unit uT3DetectedTrack;

interface

uses Windows, Classes, uT3Unit, graphics, uCoordConvertor, uSimObjects,
  uObjectVisuals, uSteppers, uT3Vehicle, uT3OtherSensor, ExtCtrls, tttData,
  uT3Sonar, uVectorVisual;

type

  TT3OnTrackBlinking = procedure (Sender : TObject; Value : boolean) of object;
  TT3NotifyScaleMap = procedure (Sender : TObject; var scale : Double) of object;

  TT3ESMTrack = class(TSimObject)
  private
    FTrackNumber: string;
    FDetectBy: TSimObject;
    FTrackIdent: integer;
    FTrackDomain: integer;
    FText: TTextVisual;
    FTrackObject: TT3Unit;
    FSelected   : boolean;
    FOnSelected : TNotifyEvent;
    FSignTrack  : TTextVisual;
    FFirstDetected : TDateTime;
    FLastDetected : TDateTime;
    FMerged : boolean;
    FNotifyScaleMap : TT3NotifyScaleMap;
    X1, Y1, X2, Y2, X3, Y3 : integer;
    percentage : Double;

    FCounterBlink : Integer;
    FTimerESMBlink_Off : TTimer;
    FDormantTime : double;
    FESMCounter : Double;
    ISESMBlinking : Boolean;
    //ACnvESM : TCanvas;

    FDetailedDetectionESM: TRecDetailESM;
    FIsEnable: Boolean;

    procedure SetTrackNumber(const Value: string);
    procedure SetDetectBy(const Value: TSimObject);
    procedure SetTrackIdent(const Value: integer);
    procedure SetTrackDomain(const Value: integer);
  public
    Bearing, Range, Variance, RangeInterval, DetectionRange: Double;

    constructor Create;
    destructor Destroy; override;

    procedure UpdateVisual; override;
    procedure Draw(aCnv: tCanvas); override;
    procedure Move(const aDeltaMs: double); override;
    procedure DrawBlinkESM(ACnvESM: TCanvas);

    procedure SetTrackObject(const Value: TT3Unit);
    procedure SetSelected(const Value: boolean);
    procedure SetOnSelected(const Value: TNotifyEvent);
    procedure SetFirstDetected(const Value : TDateTime);
    procedure SetLastDetected(const Value : TDateTime);
    procedure SetMerged(const value : boolean);

    function  isPointOnESMLine(X, Y: double): boolean;
    procedure OnESMBlink(Sender : TObject);

    property  DetailedDetectionShowedESM: TRecDetailESM read FDetailedDetectionESM
        write FDetailedDetectionESM;
    property TrackNumber: string read FTrackNumber write SetTrackNumber;
    property TrackIdent: integer read FTrackIdent write SetTrackIdent;
    property TrackDomain: integer read FTrackDomain write SetTrackDomain;
    property DetectBy: TSimObject read FDetectBy write SetDetectBy;
    property TrackObject: TT3Unit read FTrackObject write SetTrackObject;
    property TextVisual: TTextVisual read FText;
    property IsSelected: boolean read FSelected write SetSelected;
    property OnSelected: TNotifyEvent read FOnSelected write SetOnSelected;
    property FirstDetected : TDateTime read FFirstDetected write SetFirstDetected;
    property LastDetected : TDateTime read FLastDetected write SetLastDetected;
    property IsMerged : boolean read FMerged write SetMerged;
    property NotifyScaleMap : TT3NotifyScaleMap read FNotifyScaleMap write FNotifyScaleMap;
  end;

  TT3DetectedTrack = class(TSimObject)
  private
    FTrackObject: TT3Unit;
    FTrackType: integer;
    FTrackDomain: integer;
    FTrackNumber: integer;
    FTrackIdent: integer;

    FSensors: TStrings;

    FTacticalSymbol: TTacticalSymbol;
    FVHistory: THistoryVisual;
    FHisCounter: TDelayer;
    FSignTrack : TTextVisual;
    FVectorSymbol     : TShipVectorSymbol;

    FTrackDetectedBy: TList;
    FTimeDetected: TDateTime;
    FSelected: boolean;
    FShowTrails: boolean;

    FOnSelected: TNotifyEvent;
    FVarianceESM: TOnVarianceESM;
    FTrackID: string;
    FTrackName: string;
    FTrackClass: string;

    FDormantTime: double;
    FDormant: boolean;
    FDormantCounter: double;

    FBlinkDelay: double;
    FBlinkCounter: double;
    FLastBlinking: Boolean;
    //FBlinkCounted: integer;

    FESMTracks: TList;
    FOnce: boolean;

    FMergedESM: TT3ESMTrack;
    FOnTrackBlinking: TT3OnTrackBlinking;

    FOnMerged : TNotifyEvent;
    FOnUnmerged : TNotifyEvent;

    //blink variabel
    FCounterBlink : Integer;
    FDetecTime : Double;
    FCountDetectTime : Double;
    TimerBlink_Off : TTimer;
    //FSignPlatform     : TTextVisual;

    FNotifyScaleMap : TT3NotifyScaleMap;
    FPlatformViewMode: Boolean;
    FIsEnable: Boolean;

    procedure SetTrackObject(const Value: TT3Unit);
    procedure SetTrackNumber(const Value: integer);

    procedure SetTrackID(const Value: string);
    procedure SetTrackName(const Value: string);
    procedure SetTrackClass(const Value: string);

    procedure SetTrackDomain(const Value: integer);
    procedure SetTtrackIdent(const Value: integer);

    procedure SetTrackType(const Value: integer);
    procedure SetSelected(const Value: boolean);
    procedure SetTimeDetected(const Value: TDateTime);

    //procedure OnDestroyObject(Sender: TObject);
    procedure SetOnSelected(const Value: TNotifyEvent);
    procedure SetShowTrails(const Value: boolean);

    procedure HistoryOnAddpoint(Sender: TObject);

    procedure LoadTrackSymbol;
    procedure SetDormant(const Value: boolean);
    procedure SetDormantTime(const Value: double);

    function  CreateESMTrack(DetectBy: TSimObject): TSimObject;
    procedure RemoveESMTrack(DetectBy: TSimObject);
    procedure SetMergedESM(const value : TT3ESMTrack);
    procedure SetOnTrackBlinking(const Value: TT3OnTrackBlinking);
    procedure SetVarianceESM(const value : TOnVarianceESM);
    procedure SetDetailESM(sensor : TT3ESMSensor);

    procedure SetPlatformViewMode(const Value: Boolean);  protected
    FESMTrack: TT3ESMTrack;
    FDetailedDetection: TRadarDetailedCapabilities;
  public
    isShowIFF : Boolean;
    isMode4IFF : Boolean;
    ISBlinking : Boolean;
    isIFF3C : Boolean;
    IsDetailViewed : Boolean;
    TransMode1Detected, TransMode2Detected, TransMode3Detected, TransMode3CDetected  :string;
    OnDetectecTrackDestroy : TNotifyEvent;

    constructor Create;
    destructor Destroy; override;

    procedure Move(const aDeltaMs: double); override;
    procedure UpdateVisual; override;
    procedure Draw(aCnv: tCanvas); override;

    //blink sensor
    procedure OnTimerBlink_Off(sender : Tobject);
    function addDetectBy(device: TT3DeviceUnit): TSimObject;
    function removeDetectBy(device: TT3DeviceUnit): boolean; //add 12042012 pak andik
    function IsDetectedOnlyByDataLink : Boolean;

    property TrackObject: TT3Unit read FTrackObject write SetTrackObject;
    property TrackID: string read FTrackID write SetTrackID;
    property TrackNumber: integer read FTrackNumber write SetTrackNumber;
    property TrackName: string read FTrackName write SetTrackName;
    property TrackClass: string read FTrackClass write SetTrackClass;

    property TrackDomain: integer read FTrackDomain write SetTrackDomain;
    property TrackIdent: integer read FTrackIdent write SetTtrackIdent;

    property TrackType: integer read FTrackType write SetTrackType;
    property TrackDetectedBy: TList read FTrackDetectedBy;
    property TimeDetected: TDateTime read FTimeDetected write SetTimeDetected;
    property ShowTrails: boolean read FShowTrails write SetShowTrails;

    property Selected: boolean read FSelected write SetSelected;
    property OnSelected: TNotifyEvent read FOnSelected write SetOnSelected;
    property OnTrackBlinking : TT3OnTrackBlinking read FOnTrackBlinking write SetOnTrackBlinking;

    property Dormant: boolean read FDormant write SetDormant;
    property DormantTime: double read FDormantTime write SetDormantTime;
    property ESMTracks: TList read FESMTracks;

    property MergedESM : TT3ESMTrack read FMergedESM write SetMergedESM;

    property OnMerged : TNotifyEvent read FOnMerged write FOnMerged;
    property OnUnmerged : TNotifyEvent read FOnUnmerged write FOnUnmerged;

    property NotifyScaleMap : TT3NotifyScaleMap read FNotifyScaleMap write FNotifyScaleMap;
    property DetailedDetectionShowed: TRadarDetailedCapabilities read FDetailedDetection write FDetailedDetection;
    property VarianceESM : TOnVarianceESM read FVarianceESM write SetVarianceESM;
    property VHistory : THistoryVisual read FVHistory;
    property PlatformViewMode : Boolean read FPlatformViewMode write SetPlatformViewMode;
    property IsEnable : Boolean read FIsEnable write FIsEnable;
  end;

implementation

uses
  uBaseCoordSystem, uT3Common,
  uLibSettingTTT, SysUtils,
  uT3Missile, uDataTypes, uT3Radar, uT3Datalink, uT3Weapon,
  uT3Visual;

{ TT3DetectedTrack }

function TT3DetectedTrack.addDetectBy(device: TT3DeviceUnit): TSimObject;
var
  i, j: integer;
  rec : TRadarDetailedCapabilities;
  obj, sensor : TSimObject;
  found, showDetail : Boolean;
begin
  result := nil;
  i := FTrackDetectedBy.IndexOf(device);

  if Assigned(Self.FTrackObject) then
  begin
    obj := TSimObject(Self.FTrackObject);
  end;

  if i < 0 then
  begin
    FTrackDetectedBy.Add(device);
    found := False;
    showDetail := False;


    if device is TT3ESMSensor then
    begin
      {$REGION ' ESM '}
      //dist := CalcRange(TrackObject.PosX, TrackObject.PosY, device.Parent.PosX, device.Parent.PosY);
      result := CreateESMTrack(device);

      if not(Assigned(Result)) then
        Exit;

      if Assigned(VarianceESM) then
        VarianceESM(Result,Self);

      if TT3ESMTrack(Result).ISESMBlinking then
        ISBlinking := False;

      if Result is TT3ESMTrack then
      begin
        TT3ESMTrack(result).FirstDetected := Self.TimeDetected;
        //sementara last detected diambil sama dengan first detected
        TT3ESMTrack(result).LastDetected := Self.TimeDetected;

        //esm detail hook
        TT3ESMTrack(result).FDetailedDetectionESM.Track_ID  := True;
        TT3ESMTrack(result).FDetailedDetectionESM.Bearing_Data_Capability := False;
        TT3ESMTrack(result).FDetailedDetectionESM.Class_Data_Capability := False;
        TT3ESMTrack(result).FDetailedDetectionESM.Name_Data_Capability := False;
      end;
      {$ENDREGION}
    end;

    for j := 0 to FTrackDetectedBy.Count - 1 do
    begin
      sensor := FTrackDetectedBy.Items[j];
      if not(Assigned(sensor)) then Continue;

      if sensor is TT3Visual then
      begin
        found := True;
        if Assigned(obj)then
          showDetail := TT3Visual(device).InsideDetailRange(obj);
//          showDetail := TT3Visual(sensor).InsideDetailRange(obj);

        Break;
      end;
    end;

    if found and showDetail then
    begin
      rec.IFF_Capability := true;
      rec.Altitude_Data_Capability := true;
      rec.Ground_Speed_Data_Capability := true;
      rec.Heading_Data_Capability := true;
      rec.Plat_Type_Recog_Capability := true;
      rec.Plat_Class_Recog_Capability := true;
      rec.Plat_Name_Recog_Capability := true;
      rec.Track_ID  := True;

      DetailedDetectionShowed := rec;
    end
    else if device is TT3Radar then
    begin
      rec.IFF_Capability := TT3Radar(device).RadarDefinition.FDef.IFF_Capability
                              or DetailedDetectionShowed.IFF_Capability;
      rec.Altitude_Data_Capability := TT3Radar(device).RadarDefinition.FDef.Altitude_Data_Capability
                                      or DetailedDetectionShowed.Altitude_Data_Capability;
      rec.Ground_Speed_Data_Capability := TT3Radar(device).RadarDefinition.FDef.Ground_Speed_Data_Capability
                                          or DetailedDetectionShowed.Ground_Speed_Data_Capability;
      rec.Heading_Data_Capability := TT3Radar(device).RadarDefinition.FDef.Heading_Data_Capability
                                      or DetailedDetectionShowed.Heading_Data_Capability;
      rec.Plat_Type_Recog_Capability := TT3Radar(device).RadarDefinition.FDef.Plat_Type_Recog_Capability
                                        or DetailedDetectionShowed.Plat_Type_Recog_Capability;
      rec.Plat_Class_Recog_Capability := TT3Radar(device).RadarDefinition.FDef.Plat_Class_Recog_Capability
                                          or DetailedDetectionShowed.Plat_Class_Recog_Capability;
      rec.Plat_Name_Recog_Capability := DetailedDetectionShowed.Plat_Name_Recog_Capability;
      rec.Track_ID  := True;

      DetailedDetectionShowed := rec;
    end
    {untuk datalink, perlu dicek lagi. smntara true semua dulu detailnya}
    else
    if device is TT3DataLink then
    begin
        rec.IFF_Capability := true;
        rec.Altitude_Data_Capability := true;
        rec.Ground_Speed_Data_Capability := true;
        rec.Heading_Data_Capability := true;
        rec.Plat_Type_Recog_Capability := true;
        rec.Plat_Class_Recog_Capability := true;
        rec.Plat_Name_Recog_Capability := true;
        rec.Track_ID  := True;

        DetailedDetectionShowed := rec;
    end
    else
    begin
      rec.IFF_Capability := False;
      rec.Altitude_Data_Capability := False;
      rec.Ground_Speed_Data_Capability := False;
      rec.Heading_Data_Capability := False;
      rec.Plat_Type_Recog_Capability := False;
      rec.Plat_Class_Recog_Capability := False;
      rec.Plat_Name_Recog_Capability := False;
      rec.Track_ID  := True;

      DetailedDetectionShowed := rec;
    end;
  end;
end;

constructor TT3DetectedTrack.Create;
begin
  inherited;
  FSensors := TStringlist.Create;
  FSelected := false;
  FTrackDetectedBy := TList.Create;
  FTacticalSymbol := TTacticalSymbol.Create;
  FESMTracks := TList.Create;
  FVectorSymbol := TShipVectorSymbol.Create;

  FVHistory := THistoryVisual.Create;
  FVHistory.Color := clGray;
  FVHistory.Visible := FShowTrails;

  FHisCounter := TDelayer.Create;
  FHisCounter.DInterval := 4.0;
  FHisCounter.OnTime := HistoryOnAddpoint;
  FHisCounter.Enabled := true;

  FSignTrack := TTextVisual.Create;

  FTrackDomain := -1;

  FDormantTime := 15;  //60 //mk 20042012
  FDormant := false;
  FDormantCounter := 0;

  FBlinkDelay := 1; // second
  FBlinkCounter := 2000;

  FDetecTime := 15;    //30 //mk 20042012
  FCountDetectTime := 0;

  TimerBlink_Off := TTimer.Create(nil);
  TimerBlink_Off.Interval := 1000;
  TimerBlink_Off.OnTimer := OnTimerBlink_Off;
  TimerBlink_Off.Enabled := False;
  FCounterBlink := 0;

  FOnce := false;
  IsDetailViewed := True;

  with FDetailedDetection do
  begin
    IFF_Capability := False;
    Altitude_Data_Capability := False;
    Ground_Speed_Data_Capability := False;
    Heading_Data_Capability := False;
    Plat_Type_Recog_Capability := False;
    Plat_Class_Recog_Capability := False;
    Plat_Name_Recog_Capability := False;
    Track_ID  := True;
  end;

  {ryu : platform view mode default}
  FPlatformViewMode := False;
end;

function TT3DetectedTrack.CreateESMTrack(DetectBy: TSimObject): TSimObject;
var
  // ESMTrack : TObject;
  i: integer;
  found: boolean;
  dist, maxRange, EmitterRange, BlankFactor : Double;
begin
  result := nil;
  i := 0;
  found := false;

  if FESMTracks.Count > 0 then
  begin
    while (not found) and (i < FESMTracks.Count) do
    begin
      result := FESMTracks.Items[i];

      if TT3ESMTrack(result).DetectBy = DetectBy then
        found := true;

      inc(i);
    end;
  end;

  if not found then
  begin
    dist := CalcRange(TrackObject.PosX, TrackObject.PosY, DetectBy.Parent.PosX, DetectBy.Parent.PosY);    //
    //maxRangeESMDetected := TT3Vehicle(device.Parent).getMaxRangeRadar * 1.8;
    //maxRange := TT3Radar(Self.TrackObject).DetectionRange * 1.8;   //diambil dari radar Object yg terdeteksi oleh ESMSensor * 1.8
    maxRange := TT3Vehicle(Self.TrackObject.Parent).getMaxRangeRadar * 1.8;

    if dist > maxRange then
      Exit;

    FESMTrack := TT3ESMTrack.Create;
    FESMTrack.Converter := Self.Converter;

    result := FESMTrack;

    FESMTrack.Parent := Self;
    FESMTrack.TrackObject := Self.TrackObject;
    FESMTrack.TrackNumber := FormatTrackNumber(Self.TrackNumber);
    FESMTrack.TrackIdent := FTrackIdent;
    //awal esm domainya general, dan berubah saat di ganti oleh cubicle
    FESMTrack.TrackDomain := vhdGeneral; //TT3PlatformInstance(Self.TrackObject.Parent).TrackDomain; //vhdGeneral;
    FESMTrack.DetectBy := DetectBy;
    FESMTrack.OnSelected := Self.FOnSelected;
    FESMTrack.FNotifyScaleMap := Self.FNotifyScaleMap;
    FESMTrack.ISESMBlinking := True;
    //range ESM (dr range radar terjauh target * 1.8)
    FESMTrack.Range := TT3Vehicle(FESMTrack.TrackObject.Parent).getMaxRangeRadar * 1.8;

    if Assigned(TT3ESMSensor(DetectBy).ESMDefinition) then
    begin
      EmitterRange:= TT3ESMSensor(DetectBy).ESMDefinition.FESM_Def.Emitter_Detect_Range_Factor;
      BlankFactor := TT3ESMSensor(DetectBy).ESMDefinition.FESM_Def.Sector_Blank_Detection_Factor
    end
    else
    begin
      EmitterRange:= 1;
      BlankFactor := 1;
    end;

    FESMTrack.DetectionRange := FESMTrack.Range * EmitterRange * BlankFactor {* ESM envi};
    if FESMTrack.DetectionRange <= 0 then
      FESMTrack.DetectionRange := 1;

    FESMTrack.RangeInterval := (1 - (dist / FESMTrack.DetectionRange));
    FESMTracks.Add(FESMTrack);
  end;
end;

destructor TT3DetectedTrack.Destroy;
begin
  if Assigned(OnDetectecTrackDestroy) then
    OnDetectecTrackDestroy(Self);

  FESMTracks.Clear;
  FESMTracks.Free;

  FTrackDetectedBy.Free;
  FTacticalSymbol.Free;
  FHisCounter.Free;
  FVHistory.Free;
  FSignTrack.Free;
  TimerBlink_Off.Free;

  inherited;
end;

procedure TT3DetectedTrack.Draw(aCnv: tCanvas);
var
  symbol: Char;
  Color: TColor;
  i, xPos, yPos, mx, my, lx, ly: integer;
  device: TObject;
  found: boolean;
  ESMTrack: TObject;
  CanvPosX, CanvPosY : Integer;
  devSonar : TT3Sonar;
  bearing, x, y : Double;
  OnlyDetectSonarPassive : Boolean;
begin
  inherited;
  OnlyDetectSonarPassive := False;

  if Assigned(FTrackObject) then
  begin
    if not FIsEnable then
      Exit;

    found := false;
    i := 0;

    // find other than ESM Sensor
    while (not found) and (i < FTrackDetectedBy.Count) do
    begin
      device := FTrackDetectedBy.Items[i];

      if device is TT3ESMSensor then begin
        found := true;
      end;

      inc(i);
    end;

    {cek detectedBy, jika hanya di detect sonar passive >> true}
    if FTrackDetectedBy.Count > 0 then
    begin
      for I := 0 to FTrackDetectedBy.Count - 1 do
      begin
        device := FTrackDetectedBy.Items[i];
        if device is TT3Sonar then
        begin
          devSonar := TT3Sonar(device);

          if devSonar.ControlMode = scmPassive then
            OnlyDetectSonarPassive := True
          else
          begin
            OnlyDetectSonarPassive := False;
            Break;
          end;
        end
        else
        begin
          OnlyDetectSonarPassive := False;
          Break;
        end;
      end;

      {jika cubicle yg memiliki lebih dari 1 kapal
      dan menghidupkan sonar passive lebih dari 1 }
      if OnlyDetectSonarPassive then
      begin
        for I := 0 to FTrackDetectedBy.Count - 1 do
        begin
          device := FTrackDetectedBy.Items[i];
          devSonar := TT3Sonar(device);
          begin
            bearing := CalcBearing(devSonar.getPositionX, devSonar.getPositionY,
                                     FPosition.X, FPosition.Y);

            RangeBearingToCoord(50, bearing, x, y);
            x := devSonar.getPositionX + x;
            y := devSonar.getPositionY + y;

            Converter.ConvertToScreen(devSonar.getPositionX, devSonar.getPositionY, mx,my);
            Converter.ConvertToScreen(x, y, lx, ly);
            aCnv.Pen.Color := clGreen;
            aCnv.Pen.Style := psDot;
            aCnv.MoveTo(mx,my);
            aCnv.LineTo(lx,ly);
          end;
        end;
      end;

    end;

    if not (OnlyDetectSonarPassive) then
    begin
      if isShowIFF then
      begin
        Converter.ConvertToScreen(FPosition.X, FPosition.Y, CanvPosX, CanvPosY);

        with aCnv do
        begin
          if isMode4IFF then
            pen.Color := clBlue
          else
          Pen.Color := clWhite;

          Pen.Style := psSolid;
          Pen.Width := 1;
          Brush.Style := bsClear;

          MoveTo(CanvPosX + 9, CanvPosY-13);
          LineTo(CanvPosX - 9, CanvPosY-13);

          MoveTo(CanvPosX + 9, CanvPosY-13);
          LineTo(CanvPosX + 14, CanvPosY-7);

          MoveTo(CanvPosX - 9, CanvPosY-13);
          LineTo(CanvPosX - 14, CanvPosY-7);
        end;
      end;

      // if found other then ESM sensor, then draw symbol
      if found then
      begin
        // draw all ESM Sensor
        for i := 0 to FESMTracks.Count - 1 do
        begin
          ESMTrack := FESMTracks.Items[i];
          TT3ESMTrack(ESMTrack).NotifyScaleMap := NotifyScaleMap;
          TT3ESMTrack(ESMTrack).Draw(aCnv);
        end;
      end
      else
      begin
        if ISBlinking then
        begin
          FTrackIdent := piPending; //farid+p.andik 20042012
          if isIFF3C and (not isShowIFF) then
          begin
            if (not(FTrackDomain = vhdAir)) then
              symbol := getDetectedSymbolFileName(99,     //saya isi 99 biar beda sendiri>>untuk detect IFF, andik
              FTrackIdent)
            else
              symbol := getDetectedSymbolFileName(FTrackDomain,
              FTrackIdent);

            FTacticalSymbol.SpeedVector.Visible := false;
          end
          else
          begin
            symbol := getDetectedSymbolFileName(FTrackDomain,
              FTrackIdent);
            FTacticalSymbol.SpeedVector.Visible := true;
          end;

//          FTacticalSymbol.symbol.LoadBitmap(symbol); //nando load simbol kotak dulu
          FTacticalSymbol.SymbolVisual.CharSymbol := symbol;
          FTacticalSymbol.SymbolVisual.FontName := 'atct';

          FCountDetectTime := FCountDetectTime + 1;
          if FCountDetectTime = FDetecTime then
          begin
            FCounterBlink := FCounterBlink + 1;
            if FCounterBlink <= 20 then    //10 //mk 20042012
            begin
              if FCounterBlink mod 2 <> 0 then
              begin
                FTacticalSymbol.SetTextColor(RGB(0,0,51));
                FTacticalSymbol.Color := RGB(0,0,51);
                FCountDetectTime := 0;

                if FPlatformViewMode and (FTrackDomain in [1,2]) then // if ship
                  FVectorSymbol.Color := RGB(0,0,51);
              end
              else
              begin
                FTacticalSymbol.SetTextColor(getColorFromIdentity(piPending));  //--- edit farid 20042012
                FTacticalSymbol.Color := getColorFromIdentity(piPending);
                FTrackIdent := piPending;
                FCountDetectTime := 0;                                               //--- edit farid 20042012

                if FPlatformViewMode and (FTrackDomain in [1,2]) then // if ship
                  FVectorSymbol.Color := getColorFromIdentity(piPending);
              end;
            end
            else
            begin
              TimerBlink_Off.Enabled := False;
              FCounterBlink := 0;
              ISBlinking := False;
              FCountDetectTime := 0;
            end;
          end;
        end
        else
        begin
          if isIFF3C and (not isShowIFF)then
          begin
            if (not(FTrackDomain = vhdAir)) then
              symbol := getDetectedSymbolFileName(99,     //saya isi 99 biar beda sendiri>>untuk detect IFF, andik
              FTrackIdent)
            else
              symbol := getDetectedSymbolFileName(FTrackDomain,
              FTrackIdent);

            FTacticalSymbol.SpeedVector.Visible := false;
          end
          else
          begin
            symbol := getDetectedSymbolFileName(FTrackDomain,
            FTrackIdent); // add farid 20042012
            FTacticalSymbol.SpeedVector.Visible := true;
          end;

          FTacticalSymbol.SetTextColor(getColorFromIdentity(FTrackIdent));
//          FTacticalSymbol.symbol.LoadBitmap(symbol);
          FTacticalSymbol.Color := getColorFromIdentity(FTrackIdent);
          FTacticalSymbol.SymbolVisual.CharSymbol := symbol;
          FTacticalSymbol.SymbolVisual.FontName := 'atct';
        end;

        if Assigned(MergedESM) then
          FTacticalSymbol.Merged := true
        else
          FTacticalSymbol.Merged := false;

        if FTrackObject is TT3Vehicle then
          if TT3Vehicle(FTrackObject).Dormant then
            FTacticalSymbol.SpeedVector.Visible := false;

        FTacticalSymbol.Selected := FSelected;
        FVHistory.Draw(aCnv);

        if IsDetectedOnlyByDataLink then
          FSignTrack.Text := '-' + IntToStr(TrackNumber)
        else
          FSignTrack.Text := '+' + IntToStr(TrackNumber);

        if Selected then
          FSignTrack.Color := clYellow
        else
          FSignTrack.Color := FTacticalSymbol.Color;

        FSignTrack.Color := FTacticalSymbol.Color;
        xPos := FTacticalSymbol.Center.X;
        yPos := FTacticalSymbol.Center.Y;
        FSignTrack.Center := Point(xPos - 7, yPos);

         { ryu : ship plaftform view}
        if not FPlatformViewMode  then
        begin
          FTacticalSymbol.Visible := False;
          FTacticalSymbol.Draw(aCnv);
        end
        else
        if FPlatformViewMode and (FTrackDomain in [1,2]) then // if ship
        begin
          if IsDetectedOnlyByDataLink then
            FVectorSymbol.CallSign1 :=  '-' + IntToStr(TrackNumber)
          else
            FVectorSymbol.CallSign1 :=  '+' + IntToStr(TrackNumber);

          { color identity }
          FVectorSymbol.Color := getColorFromIdentity(FTrackIdent);
          FVectorSymbol.Draw(aCnv)
        end
        else
          FTacticalSymbol.Draw(aCnv);

       if not FPlatformViewMode  then
          FSignTrack.Draw(aCnv);
        // end;
      end;

//      if FTrackObject is TT3Missile then
//      begin
//        if TT3Missile(FTrackObject).SeekerOn and not(FOnce) then
//        begin
//          FOnce := true;
//
//          symbol := getCorrectSymbol(TrackDomain, TrackType, FTrackIdent, Color);
//          symbol := vSymbolSetting.ImgPath + 'MissileFriend.bmp';
//
//          FTacticalSymbol.symbol.LoadBitmap(symbol, Color);
//          FTacticalSymbol.Color := Color;
//        end;
//      end;

      if FTrackObject is TT3Vehicle then
        if TT3Vehicle(FTrackObject).Dormant then
          FTacticalSymbol.SpeedVector.Visible := false;

// --- saya comment soalnya ambigu, esm tdk perlu prosedur ini klo  -----
// --- ada masalah dengan prosedure ini tolong hubungi saya (mamik) -----

//      FTacticalSymbol.Selected := FSelected;
//      //FTacticalSymbol.Visible := true;
//      FTacticalSymbol.Draw(aCnv);
//      FVHistory.Draw(aCnv);
//
//      if IsDetectedOnlyByDataLink then
//        FSignTrack.Text := '-'
//      else
//        FSignTrack.Text := '+';
//
//      if Selected then
//        FSignTrack.Color := clYellow
//      else
//        FSignTrack.Color := FTacticalSymbol.Color;
//
//      FSignTrack.Color := FTacticalSymbol.Color;
//      xPos := FTacticalSymbol.Center.X;
//      yPos := FTacticalSymbol.Center.Y;
//      FSignTrack.Center := Point(xPos - 7, yPos);
//      FSignTrack.Draw(aCnv);
      // end;
    end;

    if FTrackObject is TT3Missile then
    begin
      if TT3Missile(FTrackObject).SeekerOn and not(FOnce) then
      begin
        FOnce := true;

        symbol := getCorrectSymbol(TrackDomain, TrackType, FTrackIdent, Color);
        //symbol := vSymbolSetting.ImgPath + 'MissileFriend.bmp';

//        FTacticalSymbol.symbol.LoadBitmap(symbol, Color);
        FTacticalSymbol.Color := Color;

        FTacticalSymbol.SymbolVisual.CharSymbol := 's';
        FTacticalSymbol.SymbolVisual.FontName := 'atct';
      end;
    end;

    if FTrackObject is TT3Vehicle then
    begin
      if (not FDormant) and (not ISBlinking) then       //nando - tambah kondisi isblink
        LoadTrackSymbol;
    end;
  end;

  if Assigned(FTrackObject) then
    if FTrackObject.FreeMe then
      FTrackObject := nil;
end;

procedure TT3DetectedTrack.OnTimerBlink_Off(sender: Tobject);
var
  sName: Char;
  Color: TColor;
begin
  FCounterBlink := FCounterBlink + 1;
//  sName := vSymbolSetting.ImgPath + getDetectedSymbolFileName(FTrackDomain,
//    FTrackIdent);

  sName := getDetectedSymbolFileName(FTrackDomain, FTrackIdent);


  if FCounterBlink <= 10 then
  begin
    if FCounterBlink mod 2 <> 0 then
    begin
      FTacticalSymbol.Color := RGB(0,0,51);
      Color := RGB(0,0,51);
      FTacticalSymbol.SetTextColor(Color);
//      FTacticalSymbol.symbol.LoadBitmap(sName);
      FTacticalSymbol.Color := Color;
      FTacticalSymbol.SymbolVisual.CharSymbol := sName;
      FTacticalSymbol.SymbolVisual.FontName := 'atct';
    end
    else
    begin
      FTacticalSymbol.Color := getColorFromIdentity(FTrackIdent);
      FTacticalSymbol.SetTextColor(FTacticalSymbol.Color);
//      FTacticalSymbol.symbol.LoadBitmap(sName);
      FTacticalSymbol.Color := FTacticalSymbol.Color;
      FTacticalSymbol.SymbolVisual.CharSymbol := sName;
      FTacticalSymbol.SymbolVisual.FontName := 'atct';
    end;
  end
  else
  begin
    FTacticalSymbol.Color := getColorFromIdentity(FTrackIdent);
    FTacticalSymbol.SetTextColor(FTacticalSymbol.Color);
//    FTacticalSymbol.symbol.LoadBitmap(sName);
    FTacticalSymbol.Color := FTacticalSymbol.Color;
    FTacticalSymbol.SymbolVisual.CharSymbol := sName;
    FTacticalSymbol.SymbolVisual.FontName := 'atct';

    TimerBlink_Off.Enabled := False;
    FCounterBlink := 0;
    ISBlinking := False;
  end;
end;

procedure TT3DetectedTrack.HistoryOnAddpoint(Sender: TObject);
begin
  if FTrackObject is TT3PlatformInstance then
    if TT3PlatformInstance(FTrackObject).Speed > 0 then
      FVHistory.AddPoint(getPositionX, getPositionY);
end;

//procedure TT3DetectedTrack.OnDestroyObject(Sender: TObject);
//var
//  i: integer;
//begin
//  i := FTrackDetectedBy.IndexOf(Sender);
//  if i >= 0 then
//    FTrackDetectedBy.Delete(i);
//
//  if FTrackDetectedBy.Count = 0 then
//    FreeMe := true;
//end;

function TT3DetectedTrack.removeDetectBy(device: TT3DeviceUnit): boolean;
var
  i, j: integer;
  aSensor : TObject;
  rec : TRadarDetailedCapabilities;
  viewDetail : Boolean;
begin
  i := FTrackDetectedBy.IndexOf(device);

  if i >= 0 then
  begin
    RemoveESMTrack(device);

    FTrackDetectedBy.Delete(i);

    result := true;   //add pak andik 12042012
  end
  else
    Result := False;    //add pak andik 12042012

  if (device is TT3Visual)then
  begin
    if (FTrackDetectedBy.Count > 0) then
    begin
      //set false di awal
      rec.IFF_Capability := False;
      rec.Altitude_Data_Capability := False;
      rec.Ground_Speed_Data_Capability := False;
      rec.Heading_Data_Capability := False;
      rec.Plat_Type_Recog_Capability := False;
      rec.Plat_Class_Recog_Capability := False;
      rec.Plat_Name_Recog_Capability := False;
      rec.Track_ID  := True;

      // ambil salah satu radar
      for j := 0 to FTrackDetectedBy.Count - 1 do
      begin
        aSensor := FTrackDetectedBy.Items[j];
        if not(Assigned(aSensor)) then
          Continue;

        //jika remove dan masih ada visual lainnya maka true
        if aSensor is TT3Visual then
        begin
          viewDetail := False;
          if Assigned(Self.TrackObject) then
            viewDetail := TT3Visual(device).InsideDetailRange(Self.TrackObject);
//            viewDetail := TT3Visual(aSensor).InsideDetailRange(Self.TrackObject);

          if viewDetail then
          begin
            rec.IFF_Capability := true;
            rec.Altitude_Data_Capability := true;
            rec.Ground_Speed_Data_Capability := true;
            rec.Heading_Data_Capability := true;
            rec.Plat_Type_Recog_Capability := true;
            rec.Plat_Class_Recog_Capability := true;
            rec.Plat_Name_Recog_Capability := true;
            rec.Track_ID  := True;
          end;
        end
        //jika remove dan masih ada radar lainnya maka set sesua kapabiliti radar tsb
        else if aSensor is TT3Radar then
        begin
          rec.IFF_Capability := TT3Radar(aSensor).RadarDefinition.FDef.IFF_Capability
                                or rec.IFF_Capability;
          rec.Altitude_Data_Capability := TT3Radar(aSensor).RadarDefinition.FDef.Altitude_Data_Capability
                                          or rec.Altitude_Data_Capability;
          rec.Ground_Speed_Data_Capability := TT3Radar(aSensor).RadarDefinition.FDef.Ground_Speed_Data_Capability
                                              or rec.Ground_Speed_Data_Capability;
          rec.Heading_Data_Capability := TT3Radar(aSensor).RadarDefinition.FDef.Heading_Data_Capability
                                          or rec.Heading_Data_Capability;
          rec.Plat_Type_Recog_Capability := TT3Radar(aSensor).RadarDefinition.FDef.Plat_Type_Recog_Capability
                                            or rec.Plat_Type_Recog_Capability;
          rec.Plat_Class_Recog_Capability := TT3Radar(aSensor).RadarDefinition.FDef.Plat_Class_Recog_Capability
                                              or rec.Plat_Class_Recog_Capability;
          rec.Plat_Name_Recog_Capability := rec.Plat_Name_Recog_Capability;
          rec.Track_ID  := True;
        end
        else if aSensor is TT3Sonar then
        begin
          rec.Altitude_Data_Capability := TT3Sonar(aSensor).SonarDefinition.FDef.Depth_Finding_Capable
                                      or DetailedDetectionShowed.Altitude_Data_Capability;
          rec.Ground_Speed_Data_Capability := True;
          rec.Heading_Data_Capability := True;

          DetailedDetectionShowed := rec;
          rec.Track_ID  := True;
        end;
      end;

      DetailedDetectionShowed := rec;
    end
    else
    begin
      rec.IFF_Capability := False;
      rec.Altitude_Data_Capability := False;
      rec.Ground_Speed_Data_Capability := False;
      rec.Heading_Data_Capability := False;
      rec.Plat_Type_Recog_Capability := False;
      rec.Plat_Class_Recog_Capability := False;
      rec.Plat_Name_Recog_Capability := False;
      rec.Track_ID  := True;

      DetailedDetectionShowed := rec;
    end;
  end
  else if device is TT3Radar then
  begin
//    rec.IFF_Capability := DetailedDetectionShowed.IFF_Capability;
//    rec.Altitude_Data_Capability := DetailedDetectionShowed.Altitude_Data_Capability;
//    rec.Ground_Speed_Data_Capability := DetailedDetectionShowed.Ground_Speed_Data_Capability;
//    rec.Heading_Data_Capability := DetailedDetectionShowed.Heading_Data_Capability;
//    rec.Plat_Type_Recog_Capability := DetailedDetectionShowed.Plat_Type_Recog_Capability;
//    rec.Plat_Class_Recog_Capability := DetailedDetectionShowed.Plat_Class_Recog_Capability;
//    rec.Track_ID  := True;
//
//    DetailedDetectionShowed := rec;
  end;

  if (FTrackDetectedBy.Count = 0) then
  begin
    if (not(device is TT3ESMSensor)) and (not (device is TT3Sonar ))then
      begin
        // blink dulu baru free

        ISBlinking := True;

        Dormant := true;

        //FreeMe := true;
      end
    else
    begin
      FreeMe := true;
      AbsoluteFree := True;
    end;
  end;
end;

function TT3DetectedTrack.IsDetectedOnlyByDataLink : Boolean;
var
  obj : TSimObject;
  I: Integer;
begin
  Result := false;
  if Self.TrackDetectedBy.Count > 1 then
    Exit;

  //find datalink detected
  for I := 0 to TrackDetectedBy.Count - 1 do
  begin
    obj := TrackDetectedBy.Items[I];
    if obj is TT3Datalink then
    begin
      Result := True;
      Break;
    end;
  end;
end;

procedure TT3DetectedTrack.RemoveESMTrack(DetectBy: TSimObject);
var
  ESMTrackObj: TObject;
  i : integer;
  found: boolean;
  aESM: TT3EsmTrack;
begin
  i := 0;
  found := false;
  ESMTrackObj := nil;

  if FESMTracks.Count <= 0 then
    Exit;

  while (not found) and (i < (FESMTracks.Count)) do
  begin
    ESMTrackObj := FESMTracks.Items[i];

    if TT3ESMTrack(ESMTrackObj).DetectBy = DetectBy then
    begin
      found := true;
      TT3ESMTrack(ESMTrackObj).ISESMBlinking := True;
    end;

    inc(i);
  end;

  if found then
  begin
    aESM := TT3ESMTrack(ESMTrackObj);
    if Assigned(aESM) then
    begin
      if aESM.IsMerged then
      begin
        aESM.IsMerged := False;

        if Assigned(OnUnmerged) then
          OnUnmerged(Self);

        MergedESM := nil;
      end;
    end;

    FESMTracks.Remove(ESMTrackObj);
  end;
end;

procedure TT3DetectedTrack.SetMergedESM(const value : TT3ESMTrack);
begin
  FMergedESM := value;
end;

procedure TT3DetectedTrack.SetDormant(const Value: boolean);
var
  symbol: string;
  Color: TColor;
begin
  if Value = FDormant then //add pak andik 12042012
   Exit;

  FDormant := Value;


  if FDormant then
  begin
    // start dying here

    FDormantCounter := 0;

    symbol := getCorrectSymbol(5, 0, FTrackIdent, Color);
//    FTacticalSymbol.symbol.LoadBitmap(vSymbolSetting.ImgPath + symbol + '.bmp',
//      Color);
    FTacticalSymbol.Color := Color;
    FTacticalSymbol.SpeedVector.Visible := false;

  end
  else
  begin
    // cancelled dying object;

    FDormantCounter := 0;
    symbol := getCorrectSymbol(TrackDomain, TrackType, FTrackIdent, Color);

//    FTacticalSymbol.symbol.LoadBitmap(vSymbolSetting.ImgPath + symbol + '.bmp',
//      Color);
    FTacticalSymbol.Color := Color;
    FTacticalSymbol.SpeedVector.Visible := true;
  end;

end;

procedure TT3DetectedTrack.SetDormantTime(const Value: double);
begin
  FDormantTime := Value;
end;

procedure TT3DetectedTrack.SetDetailESM(sensor: TT3ESMSensor);
var
  i : Integer;
  ESMTrack  : TObject;
  RangeTarget : Double;
  ESMBearingCapability, ESMClassCapability,
  ESMNameCapability : Boolean;
begin
  // cek all ESM track
  if Assigned(TT3ESMSensor(sensor).ESMDefinition) then
  begin
    if TT3ESMSensor(sensor).ESMDefinition.FESM_Def.ESM_Classification = 1 then
    begin
      ESMBearingCapability := True;
      ESMClassCapability := False;
      ESMNameCapability := False;
    end
    else if TT3ESMSensor(sensor).ESMDefinition.FESM_Def.ESM_Classification = 2 then
    begin
      ESMBearingCapability := True;
      ESMClassCapability := True;
      ESMNameCapability := False;
    end
    else if (TT3ESMSensor(sensor).ESMDefinition.FESM_Def.ESM_Classification = 3)
         or (TT3ESMSensor(sensor).ESMDefinition.FESM_Def.ESM_Classification = 4) then
    begin
      ESMBearingCapability := True;
      ESMClassCapability := True;
      ESMNameCapability := True;
    end
    else
    begin
      ESMBearingCapability := False;
      ESMClassCapability := False;
      ESMNameCapability := False;
    end;
  end
  else
  begin
    ESMBearingCapability := False;
    ESMClassCapability := False;
    ESMNameCapability := False;
  end;

  for i := 0 to FESMTracks.Count - 1 do
  begin
    ESMTrack := FESMTracks.Items[i];
    if Assigned(ESMTrack) and (ESMTrack is TT3ESMTrack) then
    begin
      //SAMAKAN SENSOR ESMNYA
      if TT3ESMSensor(TT3ESMTrack(ESMTrack).DetectBy).InstanceIndex = TT3ESMSensor(sensor).InstanceIndex then
      begin
        RangeTarget := CalcRange(TT3ESMTrack(ESMTrack).TrackObject.PosX, TT3ESMTrack(ESMTrack).TrackObject.PosY,
                 TT3ESMTrack(ESMTrack).DetectBy.Parent.PosX, TT3ESMTrack(ESMTrack).DetectBy.Parent.PosY);
        TT3ESMTrack(ESMTrack).RangeInterval := (1 - (RangeTarget / TT3ESMTrack(ESMTrack).DetectionRange));

        //esm detail hook
        TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Track_ID  := True;
        if TT3ESMTrack(ESMTrack).TrackObject.Parent is TT3PlatformInstance then
        begin
          if TT3PlatformInstance(TT3ESMTrack(ESMTrack).TrackObject.Parent).PlatformDomain = vhdAir then
          begin
            if TT3ESMTrack(ESMTrack).RangeInterval >= 0.25 then
            begin
              TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Bearing_Data_Capability
                := (True and ESMBearingCapability);
              TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Class_Data_Capability
                := (True and ESMClassCapability);
              TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Name_Data_Capability
                := (True and ESMNameCapability);
            end
            else if TT3ESMTrack(ESMTrack).RangeInterval < 0.25 then
            begin
              TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Bearing_Data_Capability
                := (True and ESMBearingCapability);
              TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Class_Data_Capability
                := (True and ESMClassCapability);
              TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Name_Data_Capability
                := (False and ESMNameCapability);
            end;
          end
          else
          begin
            if TT3ESMTrack(ESMTrack).RangeInterval >= 0.5 then
            begin
              TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Bearing_Data_Capability
                := (True and ESMBearingCapability);
              TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Class_Data_Capability
                := (True and ESMClassCapability);
              TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Name_Data_Capability
                := (True and ESMNameCapability);
            end
            else if (0 <= TT3ESMTrack(ESMTrack).RangeInterval)
                and (TT3ESMTrack(ESMTrack).RangeInterval < 0.5) then
            begin
              TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Bearing_Data_Capability
                := (True and ESMBearingCapability);
              TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Class_Data_Capability
                := (True and ESMClassCapability);
              TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Name_Data_Capability
                := (False and ESMNameCapability);
            end
            else if TT3ESMTrack(ESMTrack).RangeInterval < 0 then
            begin
              TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Bearing_Data_Capability
                := (True and ESMBearingCapability);
              TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Class_Data_Capability
                := (False and ESMClassCapability);
              TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Name_Data_Capability
                := (False and ESMNameCapability);
            end;
          end;
        end
        else
        begin
          if TT3ESMTrack(ESMTrack).RangeInterval >= 0.5 then
          begin
            TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Bearing_Data_Capability
              := (True and ESMBearingCapability);
            TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Class_Data_Capability
              := (True and ESMClassCapability);
            TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Name_Data_Capability
              := (True and ESMNameCapability);
          end
          else if (0 <= TT3ESMTrack(ESMTrack).RangeInterval)
              and (TT3ESMTrack(ESMTrack).RangeInterval < 0.5) then
          begin
            TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Bearing_Data_Capability
              := (True and ESMBearingCapability);
            TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Class_Data_Capability
              := (True and ESMClassCapability);
            TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Name_Data_Capability
              := (False and ESMNameCapability);
          end
          else if TT3ESMTrack(ESMTrack).RangeInterval < 0 then
          begin
            TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Bearing_Data_Capability
              := (True and ESMBearingCapability);
            TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Class_Data_Capability
              := (False and ESMClassCapability);
            TT3ESMTrack(ESMTrack).FDetailedDetectionESM.Name_Data_Capability
              := (False and ESMNameCapability);
          end;
        end;
      end;
    end;
  end;
end;

procedure TT3DetectedTrack.SetOnSelected(const Value: TNotifyEvent);
begin
  FOnSelected := Value;
end;

procedure TT3DetectedTrack.SetOnTrackBlinking(
  const Value: TT3OnTrackBlinking);
begin
  FOnTrackBlinking := Value;
end;

procedure TT3DetectedTrack.SetPlatformViewMode(const Value: Boolean);
begin
  FPlatformViewMode := Value;
end;

procedure TT3DetectedTrack.SetSelected(const Value: boolean);
begin
  FSelected := Value;
  FTacticalSymbol.Selected := FSelected;
  FVectorSymbol.Selected     := Value;

  if Assigned(FOnSelected) then
    FOnSelected(Self);
end;

procedure TT3DetectedTrack.SetShowTrails(const Value: boolean);
begin
  FShowTrails := Value;
  FVHistory.Visible := Value;
end;

procedure TT3DetectedTrack.SetTimeDetected(const Value: TDateTime);
begin
  FTimeDetected := Value;
end;

procedure TT3DetectedTrack.LoadTrackSymbol;
var
  sName: Char;
begin
//  sName := vSymbolSetting.ImgPath + getDetectedSymbolFileName(FTrackDomain,
//    FTrackIdent);

  sName := getDetectedSymbolFileName(FTrackDomain,
    FTrackIdent);

//  if FileExists(sName) then
//  begin
//    FTacticalSymbol.symbol.LoadBitmap(sName);
    FTacticalSymbol.Color := getColorFromIdentity(FTrackIdent);
    FTacticalSymbol.SymbolVisual.CharSymbol := sName;
    FTacticalSymbol.SymbolVisual.FontName := 'atct';

//  end;
end;

procedure TT3DetectedTrack.Move(const aDeltaMs: double);
var
  i : integer;
  rec : TRadarDetailedCapabilities;
  sensor : TSimObject;
  showDetail : Boolean;
begin
  inherited;
//  if FtrackObject.InstanceName = '' then
//    Exit;

  for i := 0 to FTrackDetectedBy.Count - 1 do
  begin
    sensor := FTrackDetectedBy.Items[i];
    showDetail := False;

    if not(Assigned(sensor)) then Continue;

    if sensor is TT3Visual then
    begin
      if Assigned(Self.TrackObject) then begin
        showDetail := TT3Visual(sensor).InsideDetailRange(Self.TrackObject);
      end;

      if showDetail then
      begin
        rec.IFF_Capability := true;
        rec.Altitude_Data_Capability := true;
        rec.Ground_Speed_Data_Capability := true;
        rec.Heading_Data_Capability := true;
        rec.Plat_Type_Recog_Capability := true;
        rec.Plat_Class_Recog_Capability := true;
        rec.Plat_Name_Recog_Capability := true;
        rec.Track_ID  := True;

        DetailedDetectionShowed := rec;
      end
      else
      begin
        rec.IFF_Capability := DetailedDetectionShowed.IFF_Capability;
        rec.Altitude_Data_Capability := DetailedDetectionShowed.Altitude_Data_Capability;
        rec.Ground_Speed_Data_Capability := DetailedDetectionShowed.Ground_Speed_Data_Capability;
        rec.Heading_Data_Capability := DetailedDetectionShowed.Heading_Data_Capability;
        rec.Plat_Type_Recog_Capability := DetailedDetectionShowed.Plat_Type_Recog_Capability;
        rec.Plat_Class_Recog_Capability := DetailedDetectionShowed.Plat_Class_Recog_Capability;
        rec.Plat_Name_Recog_Capability := DetailedDetectionShowed.Plat_Name_Recog_Capability;
        rec.Track_ID  := True;
      end;
    end
    else if sensor is TT3Radar then
    begin
      rec.IFF_Capability := TT3Radar(sensor).RadarDefinition.FDef.IFF_Capability
                                or DetailedDetectionShowed.IFF_Capability;
      rec.Altitude_Data_Capability := TT3Radar(sensor).RadarDefinition.FDef.Altitude_Data_Capability
                                      or DetailedDetectionShowed.Altitude_Data_Capability;
      rec.Ground_Speed_Data_Capability := TT3Radar(sensor).RadarDefinition.FDef.Ground_Speed_Data_Capability
                                          or DetailedDetectionShowed.Ground_Speed_Data_Capability;
      rec.Heading_Data_Capability := TT3Radar(sensor).RadarDefinition.FDef.Heading_Data_Capability
                                      or DetailedDetectionShowed.Heading_Data_Capability;
      rec.Plat_Type_Recog_Capability := TT3Radar(sensor).RadarDefinition.FDef.Plat_Type_Recog_Capability
                                        or DetailedDetectionShowed.Plat_Type_Recog_Capability;
      rec.Plat_Class_Recog_Capability := TT3Radar(sensor).RadarDefinition.FDef.Plat_Class_Recog_Capability
                                          or DetailedDetectionShowed.Plat_Class_Recog_Capability;
      rec.Plat_Name_Recog_Capability := DetailedDetectionShowed.Plat_Name_Recog_Capability;;
      rec.Track_ID  := True;

      DetailedDetectionShowed := rec;
    end
    else if sensor is TT3ESMSensor then
    begin
      // set detail detection ESM track
      SetDetailESM(TT3ESMSensor(sensor));
    end
    else if sensor is TT3Sonar then
    begin
      rec.Altitude_Data_Capability := TT3Sonar(sensor).SonarDefinition.FDef.Depth_Finding_Capable
                                      or DetailedDetectionShowed.Altitude_Data_Capability;
      rec.Ground_Speed_Data_Capability := True;
      rec.Heading_Data_Capability := True;

      DetailedDetectionShowed := rec;
    end;
  end;

  if FDormant then
  begin
    FDormantCounter := FDormantCounter + aDeltaMs;
    if FDormantCounter >= FDormantTime then begin
      FreeMe := true;
      AbsoluteFree := True;
      exit;
    end;

    FLastBlinking := ISBlinking;
  end;

  FHisCounter.Run(aDeltaMs);
end;

procedure TT3DetectedTrack.SetTrackClass(const Value: string);
begin
  FTrackClass := Value;
end;

procedure TT3DetectedTrack.SetTrackDomain(const Value: integer);
begin
  if Value <> FTrackDomain then
  begin
    FTrackDomain := Value;
    LoadTrackSymbol;
  end;

end;

procedure TT3DetectedTrack.SetTtrackIdent(const Value: integer);
begin
  if Value <> FTrackIdent then
  begin
    FTrackIdent := Value;
    LoadTrackSymbol;
  end;
end;

procedure TT3DetectedTrack.SetVarianceESM(const value: TOnVarianceESM);
begin
  FVarianceESM := Value;
end;

procedure TT3DetectedTrack.SetTrackID(const Value: string);
begin
  FTrackID := Value;
end;

procedure TT3DetectedTrack.SetTrackName(const Value: string);
begin
  FTrackName := Value;
end;

procedure TT3DetectedTrack.SetTrackNumber(const Value: integer);
begin
  FTrackNumber := Value;
  FTacticalSymbol.CallSign1 := Format('%4d', [Value]);
end;

procedure TT3DetectedTrack.SetTrackObject(const Value: TT3Unit);
var
  symbol: Char;
  pi: TT3PlatformInstance;
begin
  FTrackObject := Value;
  if FTrackObject is TT3PlatformInstance then
  begin
    pi := FTrackObject as TT3PlatformInstance;

    symbol := getDetectedSymbolFileName(pi.PlatformDomain, piPending);

    { symbol := getCorrectSymbol(TT3PlatformInstance(FTrackObject).PlatformType,
      TT3PlatformInstance(FTrackObject).Force_Designation,color);
    }
    FTacticalSymbol.Color := getColorFromIdentity(piPending);
//    FTacticalSymbol.symbol.LoadBitmap(vSymbolSetting.ImgPath + symbol);

    FTacticalSymbol.SymbolVisual.CharSymbol := symbol;
    FTacticalSymbol.SymbolVisual.FontName := 'atct';

  end;
end;

procedure TT3DetectedTrack.SetTrackType(const Value: integer);
begin
  FTrackType := Value;
end;

procedure TT3DetectedTrack.UpdateVisual;
var
  pi: TT3PlatformInstance;
  pt: TPOint;
  i: integer;
  ESMTrack: TObject;
begin
  inherited;
  pi := nil;
  if Assigned(FTrackObject) then
  begin

    FPosition.X := FTrackObject.getPositionX;
    FPosition.Y := FTrackObject.getPositionY;
    FPosition.Z := FTrackObject.getPositionZ;

    if FTrackObject is TT3PlatformInstance then
    begin
      pi := (FTrackObject as TT3PlatformInstance);

      FTacticalSymbol.SpeedVector.Course := (pi.heading);      //(pi.Course);
      if pi is TT3Weapon then                 //mk test
      begin
        FTacticalSymbol.SpeedVector.Course := (pi.Course);
      end;

      // asumsi: detected tidak pernah di control. yg dicontrol adalah platform.
      // if pi.IsGroupLeader then
      // FTacticalSymbol.SpeedVector.Speed := 90
      // else begin
      if Abs(pi.Speed) < 0.1 then
        FTacticalSymbol.SpeedVector.Speed := 0
      else
        FTacticalSymbol.SpeedVector.Speed := 20;
      // end;

      if TT3Vehicle(pi).Dormant then //add pak andik 12042012
        Dormant := True;

{
      if pi is TT3Vehicle then
      begin
        if TT3Vehicle(pi).Dormant <> FDormant then
          Dormant := TT3Vehicle(pi).Dormant;

      end;
}
    end;

    Converter.ConvertToScreen(FPosition.X, FPosition.Y, pt.X, pt.Y);
    FTacticalSymbol.Center := pt;
    FTacticalSymbol.ConvertCoord(Converter);

    if Assigned(pi) then
    begin
      if pi is TT3Vehicle then
      begin
        FVectorSymbol.Course    := TT3Vehicle(pi).Heading;
        FVectorSymbol.DimWidth  := TT3Vehicle(pi).VehicleDefinition.FData.Width;
        FVectorSymbol.DimLength := TT3Vehicle(pi).VehicleDefinition.FData.Length;
        FVectorSymbol.Center    := pt;
        FVectorSymbol.ConvertCoord(Converter);
      end;
    end;

    FVHistory.ConvertCoord(Converter);
  end
  else
  begin
    FPosition.X := 0;
    FPosition.Y := 0;
    FreeMe := true;
    AbsoluteFree := True;
  end;

  for i := 0 to FESMTracks.Count - 1 do
  begin
    ESMTrack := FESMTracks.Items[i];
    TT3ESMTrack(ESMTrack).UpdateVisual;
  end;
end;

{ TT3ESMTrack }

constructor TT3ESMTrack.Create;
begin
  inherited;
  FText := TTextVisual.Create;
  FSignTrack := TTextVisual.Create;
  IsMerged := false;

  FTimerESMBlink_Off := TTimer.Create(nil);
  FTimerESMBlink_Off.Interval := 1000;
  FTimerESMBlink_Off.Enabled  := False;
  FTimerESMBlink_Off.OnTimer  := OnESMBlink;
  FCounterBlink := 0;
  FDormantTime := 30;
  FESMCounter := 0;
end;

destructor TT3ESMTrack.Destroy;
begin
  FText.Free;
  FreeAndNil(FSignTrack);
  FreeAndNil(FTimerESMBlink_Off);
  inherited;
end;

procedure TT3ESMTrack.Draw(aCnv: tCanvas);
const
  INFINITE = 300;
var
  mx, my, dx, dy, cx, cy: double;
  orientation: double;
  //diff: double;
  xPos, yPos : integer;
  scale : Double;
  //cscale : Double;
  ESMBearing : Double;
  ESMRange, TextRange : Double;
begin
  inherited;

  if IsMerged then Exit;

  Bearing := CalcBearing(FDetectBy.getPositionX, FDetectBy.getPositionY,
             FPosition.X, FPosition.Y);
  orientation := Bearing + Variance;

  if Range = 0 then Range := INFINITE;

  //  diff := Bearing - TT3PlatformInstance(Self.FTrackObject.Parent).heading;    // Course;
  //
  //  if ((diff < 0) and (diff > -180)) or ((diff > 180) and (diff < 360)) then
  //  begin
  //    orientation := (Bearing - Variance);
  //  end
  //  else
  //  begin
  //    orientation := (Bearing + Variance);
  //  end;

  //cscale := scale / 8;
  //  if cscale > 1 then
  //    cscale := 1;
  //RangeBearingToCoord((scale / 2), orientation, dx, dy)
  //  dx := FPosition.X + (dx);
  //  dy := FPosition.Y + (dy);

  scale := 8;
  if Assigned(NotifyScaleMap) then
    NotifyScaleMap(Self, scale);

  RangeBearingToCoord(Range, orientation, mx, my);
  mx := FDetectBy.getPositionX + mx;
  my := FDetectBy.getPositionY + my;

  //hasil bearing target
  ESMBearing := CalcBearing(FDetectBy.getPositionX, FDetectBy.getPositionY, mx, my);
  Bearing := ESMBearing;
  //posisi text line ESM
  TextRange := 0.05 * Range;
  CalcForward(FDetectBy.getPositionX, FDetectBy.getPositionY, TextRange, ESMBearing , cx, cy);
  ESMRange := CalcRange(FDetectBy.getPositionX, FDetectBy.getPositionY, cx, cy);
  CalcForward(FDetectBy.getPositionX, FDetectBy.getPositionY, ESMRange, ESMBearing , dx, dy);

  //awal garis ESM
  Converter.ConvertToScreen(FDetectBy.getPositionX, FDetectBy.getPositionY,
    X1, Y1);
  Converter.ConvertToScreen(mx, my, X2, Y2);
  Converter.ConvertToScreen(dx, dy, X3, Y3);

  if IsSelected then
    FText.Color := clYellow
  else
    FText.Color := getColorFromIdentity(FTrackIdent);

  FText.Center := Point(X3, Y3);

  if ISESMBlinking then begin
    with aCnv do
    begin
      if FSelected then
      begin
        FSignTrack.Color := clYellow;
        Pen.Color := clYellow;
      end
      else
      begin
        FSignTrack.Color := getColorFromIdentity(FTrackIdent);
        Pen.Color := getColorFromIdentity(FTrackIdent);
      end;

      Pen.Style := psDash;

      MoveTo(X1, Y1);
      LineTo(X2, Y2);

      //FText.Text := 'EL-' + TrackNumber;
      FText.Text := '+' + TrackNumber;
      FText.Draw(aCnv);
    end;

    FSignTrack.Text := 'E';

    FESMCounter := FESMCounter + 1;
    if FESMCounter = FDormantTime then
    begin
      FCounterBlink := FCounterBlink + 1;
      if FCounterBlink <= 10 then
      begin
        if FCounterBlink mod 2 <> 0 then
        begin
          with aCnv do
          begin
            if FSelected then
            begin
              FSignTrack.Color := RGB(0,0,51);
              Pen.Color := RGB(0,0,51);
              FText.Color := RGB(0,0,51);
            end
            else
            begin
              FSignTrack.Color := RGB(0,0,51);
              Pen.Color := RGB(0,0,51);
              FText.Color := RGB(0,0,51);
            end;

            Pen.Style := psDash;

            MoveTo(X1, Y1);
            LineTo(X2, Y2);

            //FText.Text := 'EL-' + TrackNumber;
            FText.Text := '+' + TrackNumber;
            FText.Draw(aCnv);
          end;

          FSignTrack.Text := 'E';

          FESMCounter := 0;
        end
        else
        begin
          with aCnv do
          begin
            if FSelected then
            begin
              FSignTrack.Color := clYellow;
              Pen.Color := clYellow;
              FText.Color := clYellow;
            end
            else
            begin
              FSignTrack.Color := getColorFromIdentity(FTrackIdent);
              Pen.Color := getColorFromIdentity(FTrackIdent);
              FText.Color := getColorFromIdentity(FTrackIdent);
            end;

            Pen.Style := psDash;

            MoveTo(X1, Y1);
            LineTo(X2, Y2);

            //FText.Text := 'EL-' + TrackNumber;
            FText.Text := '+' + TrackNumber;
            FText.Draw(aCnv);
          end;

          FSignTrack.Text := 'E';

          FESMCounter := 0;
        end;
      end
      else
      begin
        with aCnv do
        begin
          if FSelected then
          begin
            FSignTrack.Color := clYellow;
            Pen.Color := clYellow;
          end
          else
          begin
            FSignTrack.Color := getColorFromIdentity(FTrackIdent);
            Pen.Color := getColorFromIdentity(FTrackIdent);
          end;

          Pen.Style := psDash;

          MoveTo(X1, Y1);
          LineTo(X2, Y2);

          //FText.Text := 'EL-' + TrackNumber;
          FText.Text := '+' + TrackNumber;
          FText.Draw(aCnv);
        end;

        FSignTrack.Text := 'E';


        FTimerESMBlink_Off.Enabled := False;
        FCounterBlink := 0;
        ISESMBlinking := False;
        FESMCounter   := 0;
      end;
    end;
  end
  else begin
    with aCnv do
    begin
      if FSelected then
      begin
        FSignTrack.Color := clYellow;
        Pen.Color := clYellow;
      end
      else
      begin
        FSignTrack.Color := getColorFromIdentity(FTrackIdent);
        Pen.Color := getColorFromIdentity(FTrackIdent);
      end;

      Pen.Style := psDash;

      MoveTo(X1, Y1);
      LineTo(X2, Y2);

      //FText.Text := 'EL-' + TrackNumber;
      FText.Text := '+' + TrackNumber;
      FText.Draw(aCnv);
    end;

    FSignTrack.Text := 'E';
  end;

  if FSelected then
    FSignTrack.Color := clYellow
  else
    FSignTrack.Color := getColorFromIdentity(FTrackIdent);

  FSignTrack.Color := FText.Color;
  xPos := FText.Center.X;
  yPos := FText.Center.Y;
  FSignTrack.Center := Point(xPos - 7, yPos );
  FSignTrack.Draw(aCnv);
end;

procedure TT3ESMTrack.OnESMBlink(Sender: TObject);
begin
  //DrawBlinkESM;
end;

procedure TT3ESMTrack.DrawBlinkESM(ACnvESM: TCanvas);
var
  sName: string;
  //Color: TColor;
begin
  FCounterBlink := FCounterBlink + 1;
  sName := vSymbolSetting.ImgPath + getDetectedSymbolFileName(FTrackDomain,
    FTrackIdent);


  if FCounterBlink <= 10 then
  begin

    if FCounterBlink mod 2 <> 0 then
    begin
    begin
      with ACnvESM do
      begin
        if FSelected then
        begin
          FSignTrack.Color := RGB(0,0,51);
          Pen.Color := RGB(0,0,51);
          FText.Color := RGB(0,0,51);
        end
        else
        begin
          FSignTrack.Color := RGB(0,0,51);
          Pen.Color := RGB(0,0,51);
          FText.Color := RGB(0,0,51);
        end;

        Pen.Style := psDash;

        MoveTo(X1, Y1);
        LineTo(X2, Y2);

        //FText.Text := 'EL-' + TrackNumber;
        FText.Text := '+' + TrackNumber;
        FText.Draw(ACnvESM);
      end;

      FESMCounter := 0;
    end;
     { FTacticalSymbol.Color := RGB(0,0,51);
      Color := RGB(0,0,51);
      FTacticalSymbol.TextVisual.Color := Color;
      FTacticalSymbol.symbol.LoadBitmap(sName);
      FTacticalSymbol.Color := Color; }
    end
    else
    begin
      with ACnvESM do
      begin
        if FSelected then
        begin
          FSignTrack.Color := clYellow;
          Pen.Color := clYellow;
          FText.Color := clYellow;
        end
        else
        begin
          FSignTrack.Color := getColorFromIdentity(FTrackIdent);
          Pen.Color := getColorFromIdentity(FTrackIdent);
          FText.Color := getColorFromIdentity(FTrackIdent);
        end;

        Pen.Style := psDash;

        MoveTo(X1, Y1);
        LineTo(X2, Y2);

        //FText.Text := 'EL-' + TrackNumber;
        FText.Text := '+' + TrackNumber;
        FText.Draw(ACnvESM);
      end;

      FESMCounter := 0;
      {FTacticalSymbol.Color := getColorFromIdentity(FTrackIdent);
      FTacticalSymbol.TextVisual.Color := getColorFromIdentity(FTrackIdent);
      FTacticalSymbol.symbol.LoadBitmap(sName);
      FTacticalSymbol.Color := getColorFromIdentity(FTrackIdent);  }
    end;

  end
  else
  begin
    with ACnvESM do
    begin
      if FSelected then
      begin
        FSignTrack.Color := clYellow;
        Pen.Color := clYellow;
      end
      else
      begin
        FSignTrack.Color := getColorFromIdentity(FTrackIdent);
        Pen.Color := getColorFromIdentity(FTrackIdent);
      end;

      Pen.Style := psDash;

      MoveTo(X1, Y1);
      LineTo(X2, Y2);

      //FText.Text := 'EL-' + TrackNumber;
      FText.Text := '+' + TrackNumber;
      FText.Draw(ACnvESM);
    end;
   { FTacticalSymbol.Color := getColorFromIdentity(FTrackIdent);
    FTacticalSymbol.TextVisual.Color := getColorFromIdentity(FTrackIdent);
    FTacticalSymbol.symbol.LoadBitmap(sName);
    FTacticalSymbol.Color := getColorFromIdentity(FTrackIdent); }

    FTimerESMBlink_Off.Enabled := False;
    FCounterBlink := 0;
    ISESMBlinking := False;
    FESMCounter   := 0;

  end;
end;

procedure TT3ESMTrack.SetDetectBy(const Value: TSimObject);
var
  nRandom, randValue : Integer;
  bMin, bMax : Double;
begin
  // untuk toleransi kesalahan
  // variance diambil dari random antara min_variance dan init_variance

  FDetectBy := Value;
  nRandom := Random(2);
  //percentage := (Random(10)) + 5;
  //percentage := Random * 45;
  randValue := Random(100);

  if Assigned(TT3ESMSensor(Self.FDetectBy).ESMDefinition) then
  begin
    with TT3ESMSensor(Self.FDetectBy).ESMDefinition.FESM_Def do
    begin
      bMin := Minimum_Bearing_Error_Variance;
      bMax := Initial_Bearing_Error_Variance;
    end;
  end
  else
  begin
    bMin := 2;  //def min
    bMax := 45; //def max
  end;

  percentage := bMin + ((randValue / 100) * (bMax - bMin));

//  if percentage < bMin then percentage := bMin;
//  if percentage > bMax then percentage := bMax;

  if nRandom = 1 then
    Variance := -percentage
  else
    Variance := percentage;
end;

procedure TT3ESMTrack.SetTrackIdent(const Value: integer);
begin
  FTrackIdent := Value;
end;

procedure TT3ESMTrack.SetTrackDomain(const Value: integer);
begin
  FTrackDomain := Value;
end;

procedure TT3ESMTrack.SetTrackNumber(const Value: string);
begin
  FTrackNumber := Value;
end;

procedure TT3ESMTrack.SetTrackObject(const Value: TT3Unit);
begin
  FTrackObject := Value;
end;

procedure TT3ESMTrack.SetSelected(const Value: boolean);
begin
  FSelected := Value;

  if Assigned(FOnSelected) and FSelected then
    FOnSelected(Self);
end;

procedure TT3ESMTrack.SetOnSelected(const Value: TNotifyEvent);
begin
  FOnSelected := Value;
end;

procedure TT3ESMTrack.SetFirstDetected(const Value : TDateTime);
begin
  FFirstDetected := Value;
end;

procedure TT3ESMTrack.SetLastDetected(const Value : TDateTime);
begin
  FLastDetected := Value;
end;

procedure TT3ESMTrack.SetMerged(const value : boolean);
begin
  FMerged := value;
end;

function TT3ESMTrack.isPointOnESMLine(X, Y: double): boolean;
var
  sX, sY: integer;
  pt1, pt2, pt3: T2dPoint;
  dist: double;
begin
  Converter.ConvertToScreen(X, Y, sX, sY);

  result := false;

  pt1.X := X1;
  pt1.Y := Y1;
  pt2.X := X2;
  pt2.Y := Y2;
  pt3.X := sX;
  pt3.Y := sY;

  dist := ptToLineDistance(pt1, pt2, pt3);

  if dist < 3 then
  begin
    result := true;
  end;

end;

procedure TT3ESMTrack.Move(const aDeltaMs: double);
begin
  inherited;

 { if ISESMBlinking then
  begin
    FESMCounter := FESMCounter + aDeltaMs;
    if FESMCounter >= FDormantTime then begin
      DrawBlinkESM
    end;
  end;  }
end;

procedure TT3ESMTrack.UpdateVisual;
begin
  inherited;

  if Assigned(FParent) then
  begin

    FPosition.X := FParent.getPositionX;
    FPosition.Y := FParent.getPositionY;
    FPosition.Z := FParent.getPositionZ;

  end;

end;

end.
