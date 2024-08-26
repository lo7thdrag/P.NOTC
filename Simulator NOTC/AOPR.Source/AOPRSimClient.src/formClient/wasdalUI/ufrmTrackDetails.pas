unit ufrmTrackDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, ExtCtrls, ComCtrls, Buttons, System.ImageList;

type
  TfrmTrackInfo = class(TForm)
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
    StaticText1: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    StaticText16: TStaticText;
    StaticText21: TStaticText;
    StaticText22: TStaticText;
    StaticText23: TStaticText;
    StaticText24: TStaticText;
    StaticText25: TStaticText;
    StaticText26: TStaticText;
    lb7: TStaticText;
    lb3: TStaticText;
    tsDetails: TTabSheet;
    lbTrackDetails: TLabel;
    Label10: TLabel;
    lbNameDetails: TLabel;
    lbClassdetails: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    lbDomain: TLabel;
    Label14: TLabel;
    lbPropulsion: TLabel;
    lbIdentifier: TLabel;
    lbDoppler: TLabel;
    lbSonarClass: TLabel;
    lbTrackType: TLabel;
    lbTypeDetails: TLabel;
    lbMergeStatus: TLabel;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    StaticText27: TStaticText;
    StaticText28: TStaticText;
    StaticText29: TStaticText;
    StaticText30: TStaticText;
    StaticText31: TStaticText;
    StaticText32: TStaticText;
    StaticText33: TStaticText;
    StaticText34: TStaticText;
    StaticText35: TStaticText;
    StaticText36: TStaticText;
    StaticText37: TStaticText;
    tsDetection: TTabSheet;
    lbTrackDetection: TLabel;
    Label15: TLabel;
    lbNameDetection: TLabel;
    lbClassDetection: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    lbFirstDetected: TLabel;
    Label19: TLabel;
    lbLastDetected: TLabel;
    lbOwner: TLabel;
    lbDetectionDetectionType: TLabel;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    lbDetectionType: TStaticText;
    StaticText38: TStaticText;
    StaticText39: TStaticText;
    StaticText40: TStaticText;
    StaticText41: TStaticText;
    StaticText42: TStaticText;
    StaticText43: TStaticText;
    StaticText44: TStaticText;
    tsIFF: TTabSheet;
    lbTrackIff: TLabel;
    Label20: TLabel;
    lbNameIff: TLabel;
    lbClassIff: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    lbMode2Iff: TLabel;
    Label24: TLabel;
    lbMode1Iff: TLabel;
    lbMode3CIff: TLabel;
    lbMode3Iff: TLabel;
    lbMode4Iff: TLabel;
    StaticText17: TStaticText;
    StaticText18: TStaticText;
    StaticText19: TStaticText;
    StaticText20: TStaticText;
    StaticText45: TStaticText;
    StaticText46: TStaticText;
    StaticText47: TStaticText;
    StaticText48: TStaticText;
    StaticText49: TStaticText;
    StaticText50: TStaticText;
    StaticText51: TStaticText;
    StaticText52: TStaticText;
    ImageList1: TImageList;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HookContactInfoTraineeDisplayChange(Sender:TObject);
  private
    { Private declarations }
    procedure DisplayTabHooked(Sender: TObject);
    procedure DisplayTabDetail(Sender: TObject);
    procedure DisplayTabDetection(Sender: TObject);
    procedure DisplayTabIFF(Sender: TObject);
  public
    { Public declarations }
    procedure InitTabHookedInfo;
    procedure DisplayTab(Sender : TObject);
  end;

var
  frmTrackInfo: TfrmTrackInfo;

implementation

uses
  uT3Unit, uT3DetectedTrack, uT3Radar,
  uSimMgr_Client, tttData,
  uBaseCoordSystem, uT3Missile,
  uDBAsset_Vehicle, uT3Torpedo,
  uT3Vehicle,uDBAssetObject,
  uT3CounterMeasure,
  uT3Sonobuoy,
  uT3Mine, uSettingCoordinate,
  uDBAsset_Weapon, uT3Common,
  ufTacticalDisplay,uT3Sensor,
  uT3OtherSensor, ufrmGeneraPfTools,
  uMapXHandler;

{$R *.dfm}

Function DecToOct(Inp : String): String;

Var
  HasilBagi,SisaBagi : Integer;
  Oct,Oktal : String;
  i : integer;
  Des : integer;
Begin
  Oct := '';
  Oktal := '';
  Des:= StrToInt(inp);
  Repeat
  SisaBagi := des Mod 8;
  Oct:= Oct + intToStr(SisaBagi);
  HasilBagi := Des Div 8;
  des:= HasilBagi;
  Until HasilBagi = 0;

  For I := length (Oct) Downto 1 Do
  Begin
  Oktal := Oktal+ Oct[i];
  End;
  Result:= Oktal;
End;

procedure TfrmTrackInfo.BitBtn1Click(Sender: TObject);
begin
  Hide;
end;

procedure TfrmTrackInfo.DisplayTab(Sender: TObject);
begin
  case HookContactInfoTraineeDisplay.ActivePageIndex of
    0 : DisplayTabHooked(Sender);
    1 : DisplayTabDetail(Sender);
    2 : DisplayTabDetection(Sender);
    3 : DisplayTabIFF(Sender);
  end;
end;

procedure TfrmTrackInfo.DisplayTabDetail(Sender: TObject);
var
  v: TT3PlatformInstance;
  det: TT3DetectedTrack;
  dName, dClass: string;
  esm: TT3ESMTrack;
begin
  v := nil;
  det := nil;

  if Assigned(Sender) then     //mk
  begin
    if Sender is TT3PlatformInstance then
      v := TT3PlatformInstance(Sender);

    if Sender is TT3DetectedTrack then
    begin
      det := TT3DetectedTrack(Sender);

      if Assigned(det.MergedESM) then
      begin
        lbMergeStatus.Caption := 'Merged';
        lbTrackDetails.Caption := (det.MergedESM.TrackNumber);
        lbNameDetails.Caption := TT3PlatformInstance(det.MergedESM.TrackObject).InstanceName;
        lbClassDetails.Caption := TT3Radar(det.MergedESM.TrackObject).RadarDefinition.FDef.Radar_Emitter;
        lbTypeDetails.Caption := 'Other';
        lbDoppler.Caption := '[None]';
        lbTrackType.Caption := 'Real Time Bearing Track';

        if TT3ESMTrack(Sender).IsMerged then
          lbMergeStatus.Caption := 'Merged'
        else
          lbMergeStatus.Caption := 'Not Merged';

        Exit;
      end
      else
        lbMergeStatus.Caption := 'Not Merged';

      v := TT3PlatformInstance(det.TrackObject);
    end
    else if Sender is TT3ESMTrack then
    begin
      esm := TT3ESMTrack(Sender);

      if esm.DetailedDetectionShowedESM.Track_ID then
        lbTrackDetails.Caption      := esm.TrackNumber
      else
        lbTrackDetails.Caption      := 'Unknown';

      if esm.DetailedDetectionShowedESM.Name_Data_Capability then
        lbNameDetails.Caption      := TT3PlatformInstance(esm.TrackObject).InstanceName
      else
        lbNameDetails.Caption      := 'Unknown';

      if esm.DetailedDetectionShowedESM.Class_Data_Capability then
        lbClassDetails.Caption      := TT3Radar(esm.TrackObject).RadarDefinition.FDef.Radar_Emitter
      else
        lbClassDetails.Caption      := 'Unknown';

      lbIdentifier.Caption  := getIdentStr(esm.TrackIdent);
      lbDomain.Caption      := getDomain(esm.TrackDomain);
      lbTypeDetails.Caption := 'Other';
      lbDoppler.Caption     := '[None]';
      lbTrackType.Caption   := 'Real Time Bearing Track';

      if esm.IsMerged then
        lbMergeStatus.Caption := 'Merged'
      else
        lbMergeStatus.Caption := 'Not Merged';

      Exit;
    end;

    if v = nil then exit;

    if det <> nil then
    begin
      frmTacticalDisplay.GetNameAndClass(det, dName, dClass);

      if det.IsDetailViewed then
      begin
        if det.DetailedDetectionShowed.Track_ID then
          lbTrackDetails.Caption := FormatTrackNumber(det.trackNumber)
        else
          lbTrackDetails.Caption   := 'Unknown';

        if det.DetailedDetectionShowed.Plat_Name_Recog_Capability then
        begin
          lbNameDetails.Caption      := v.InstanceName;
        end
        else
        begin
          lbNameDetails.Caption      := 'Unknown';
        end;

        if det.DetailedDetectionShowed.Plat_Class_Recog_Capability then
        begin
          lbClassDetails.Caption     := v.InstanceClass;
        end
        else
        begin
          lbClassDetails.Caption     := 'Unknown';
        end;

        if det.DetailedDetectionShowed.Plat_Type_Recog_Capability then
          lbTypeDetails.Caption := getTypeStr(det.TrackType)
        else
          lbTypeDetails.Caption := 'Unknown';
      end;

      lbIdentifier.Caption  := getIdentStr(det.TrackIdent);
      lbDomain.Caption      := getDomain(det.TrackDomain);
      lbTrackType.Caption   := 'Real Time Point Track';
    end
    else
    begin
      if v is TT3NonRealVehicle then
      begin
        lbTrackDetails.Caption := IntToStr(v.TrackNumber);
        lbTypeDetails.Caption  := 'Other';
        lbIdentifier.Caption    := getIdentStr(v.TrackIdent);
        lbDomain.Caption        := getDomain(v.TrackDomain);
        lbTrackType.Caption     := getNRTrackTypeStr(TT3NonRealVehicle(v).NRPType);
      end
      else
      begin
        lbTrackDetails.Caption := v.Track_ID;
        lbTypeDetails.Caption  := getTypeStr(v.PlatformType);

        case v.Force_Designation of
          1 : lbIdentifier.Caption := 'Red Force';
          2 : lbIdentifier.Caption := 'Yellow Force';
          3 : lbIdentifier.Caption := 'Blue Force';
          4 : lbIdentifier.Caption := 'Green Force';
          5 : lbIdentifier.Caption := 'White Force';
          6 : lbIdentifier.Caption := 'Black Force';
        else
          lbIdentifier.Caption := 'White Force';
        end;

        lbDomain.Caption    := getDomain(v.PlatformDomain);
        lbTrackType.Caption := 'Real Time Point Track';
      end;

      lbNameDetails.Caption   := v.InstanceName;
      lbClassDetails.Caption  := v.InstanceClass;

      if v is TT3Missile then
        lbClassDetails.Caption := TMissile_On_Board(v.UnitDefinition)
          .FDef.Class_Identifier;

      if v is TT3Torpedo then
        lbClassDetails.Caption := TTorpedo_On_Board(v.UnitDefinition)
          .FDef.Class_Identifier;

      if v is TT3Chaff then lbClassDetails.Caption := 'Chaff';

      if v is TT3AirBubble then lbClassDetails.Caption := 'Air Bubble';

      if v is TT3Decoy then lbClassDetails.Caption := 'Decoy';

      if v is TT3Sonobuoy then lbClassDetails.Caption := 'Sonobuoy';

      if v is TT3Mine then lbClassDetails.Caption := 'Mine';
    end;
  end;end;

procedure TfrmTrackInfo.DisplayTabDetection(Sender: TObject);
var
  v: TT3PlatformInstance;
  dName, dClass: string;
  det: TT3DetectedTrack;
  //dev : TSimObject;
  esm: TT3ESMTrack;
begin
  v := nil;
  det := nil;

  if Assigned(Sender) then       //mk
  begin
    if Sender is TT3PlatformInstance then
      v := TT3PlatformInstance(Sender);

    if Sender is TT3DetectedTrack then
    begin
      det := TT3DetectedTrack(Sender);

      if Assigned(det.MergedESM) then
      begin
        lbTrackDetection.Caption := (det.MergedESM.TrackNumber);
        lbNameDetection.Caption := TT3PlatformInstance(det.MergedESM.TrackObject).InstanceName;
        lbClassDetection.Caption := TT3Radar(det.MergedESM.TrackObject).RadarDefinition.FDef.Radar_Emitter;
        lbFirstDetected.Caption := FormatDateTime('ddhhnn', det.MergedESM.FirstDetected)
        + 'Z ' + FormatDateTime(' mmm yyyy', det.MergedESM.FirstDetected);
        lbLastDetected.Caption := FormatDateTime('ddhhnn', det.MergedESM.LastDetected)
        + 'Z ' + FormatDateTime(' mmm yyyy', det.MergedESM.LastDetected);
        lbDetectionDetectionType.Caption := 'Merged Track';
        Exit;
      end;

      v := TT3PlatformInstance(det.TrackObject);
    end
    else if Sender is TT3ESMTrack then
    begin
      esm := TT3ESMTrack(Sender);

      if esm.DetailedDetectionShowedESM.Track_ID then
        lbTrackDetection.Caption      := esm.TrackNumber
      else
        lbTrackDetection.Caption      := 'Unknown';

      if esm.DetailedDetectionShowedESM.Name_Data_Capability then
        lbNameDetection.Caption      := TT3PlatformInstance(esm.TrackObject).InstanceName
      else
        lbNameDetection.Caption      := 'Unknown';

      if esm.DetailedDetectionShowedESM.Class_Data_Capability then
        lbClassDetection.Caption      := TT3Radar(esm.TrackObject).RadarDefinition.FDef.Radar_Emitter
      else
        lbClassDetection.Caption      := 'Unknown';

      lbFirstDetected.Caption := FormatDateTime('ddhhnn', esm.FirstDetected)
            + 'Z ' + FormatDateTime(' mmm yyyy', esm.FirstDetected);
      lbLastDetected.Caption := FormatDateTime('ddhhnn', esm.LastDetected)
            + 'Z ' + FormatDateTime(' mmm yyyy', esm.LastDetected);
      lbDetectionDetectionType.Caption := 'ESM';

      Exit;
    end;

    if v = nil then exit;

    if det <> nil then
    begin
      frmTacticalDisplay.GetNameAndClass(det, dName, dClass);

      if det.IsDetailViewed then
      begin
        // tampilkan sensor pertama yg detect;

        if det.DetailedDetectionShowed.Track_ID then
          lbTrackDetection.Caption := FormatTrackNumber(det.trackNumber)
        else
          lbTrackDetection.Caption  := 'Unknown';

        if det.DetailedDetectionShowed.Plat_Name_Recog_Capability then
        begin
          lbNameDetection.Caption  := v.InstanceName;
        end
        else
        begin
          lbNameDetection.Caption  := 'Unknown';
        end;

        if det.DetailedDetectionShowed.Plat_Class_Recog_Capability then
        begin
          lbClassDetection.Caption := v.InstanceClass;
        end
        else
        begin
          lbClassDetection.Caption := 'Unknown';
        end;
      end;
    end
    else
    begin
      if v is TT3NonRealVehicle then
        lbTrackDetection.Caption := IntToStr(v.TrackNumber)
      else
        lbTrackDetection.Caption := v.Track_ID;

      lbNameDetection.Caption := v.InstanceName;
      lbClassDetection.Caption := v.InstanceClass;

      if v is TT3Missile then
        lbClassDetection.Caption := TMissile_On_Board(v.UnitDefinition)
          .FDef.Class_Identifier;

      if v is TT3Torpedo then
        lbClassDetection.Caption := TTorpedo_On_Board(v.UnitDefinition)
          .FDef.Class_Identifier;

      if v is TT3Chaff then lbClassDetection.Caption := 'Chaff';

      if v is TT3AirBubble then lbClassDetection.Caption := 'Air Bubble';

      if v is TT3Decoy then lbClassDetection.Caption := 'Decoy';

      if v is TT3Sonobuoy then lbClassDetection.Caption := 'Sonobuoy';

      if v is TT3Mine then lbClassDetection.Caption := 'Mine';
    end;
  end;end;

procedure TfrmTrackInfo.DisplayTabHooked(Sender: TObject);
var
  v: TT3PlatformInstance;
  ct: TT3PlatformInstance;
  det: TT3DetectedTrack;
  d, b, long, lat: double;
  pY, pX: Extended;
  idCoordinat: Integer;
  esm: TT3ESMTrack;
  largeLtr, smallLtr, horizontalNumb, verticalNumb, horzPoint, vertPoint : string;
begin
  v := nil;
  det := nil;
  idCoordinat := fSettingCoordinate.IdCoordinat;

  if Assigned(sender) then     //mk
  begin
    if Sender is TT3PlatformInstance then
      v := TT3PlatformInstance(Sender)
    else
    if Sender is TT3DetectedTrack then
    begin
      det := TT3DetectedTrack(Sender);

      if Assigned(det.MergedESM) then
      begin
        lbTrackHook.Caption:= (det.MergedESM.TrackNumber);
        lbNameHook.Caption := TT3PlatformInstance(det.MergedESM.TrackObject).InstanceName;
        lbClassHook.Caption:= TT3Radar(det.MergedESM.TrackObject).
                               RadarDefinition.FDef.Radar_Emitter;
        lbBearingHook.Caption := FormatFloat('000.0', det.MergedESM.Bearing);

        StaticText6.Caption := 'Origin';
        lbPositionHook1.Caption := formatDMS_long(det.MergedESM.DetectBy.PosX);
        lbPositionHook2.Caption := formatDMS_latt(det.MergedESM.DetectBy.PosY);

        Exit;
      end;

      v := TT3PlatformInstance(det.TrackObject);
    end
    else if Sender is TT3ESMTrack then
    begin
      esm := TT3ESMTrack(Sender);

      if esm.DetailedDetectionShowedESM.Track_ID then
        lbTrackHook.Caption      := esm.TrackNumber
      else
        lbTrackHook.Caption      := 'Unknown';

      if esm.DetailedDetectionShowedESM.Name_Data_Capability then
        lbNameHook.Caption      := TT3PlatformInstance(esm.TrackObject).InstanceName
      else
        lbNameHook.Caption      := 'Unknown';

      if esm.DetailedDetectionShowedESM.Class_Data_Capability then
        lbClassHook.Caption      := TT3Radar(esm.TrackObject).RadarDefinition.FDef.Radar_Emitter
      else
        lbClassHook.Caption      := 'Unknown';

      if esm.DetailedDetectionShowedESM.Bearing_Data_Capability then
        lbBearingHook.Caption      := FormatFloat('000.0', esm.Bearing)
      else
        lbBearingHook.Caption      := '---';

      StaticText6.Caption := 'Origin';
      lbPositionHook1.Caption := formatDMS_long(TT3ESMTrack(sender).DetectBy.PosX);
      lbPositionHook2.Caption := formatDMS_latt(TT3ESMTrack(sender).DetectBy.PosY);

      Exit;
    end;
  end;

  b := 0;
  d := 0;

  if v <> nil then
  begin
    if simMgrClient.ControlledPlatform <> nil then
    begin
      ct := TT3PlatformInstance(simMgrClient.ControlledPlatform);
      b := CalcBearing(ct.getPositionX, ct.getPositionY, v.getPositionX,
           v.getPositionY);
      d := CalcRange(ct.getPositionX, ct.getPositionY, v.getPositionX,
           v.getPositionY);
    end;
  end;

  if det <> nil then
  begin
    if det.TrackObject is TT3DeviceUnit then
    begin
      v := det.TrackObject.Parent as TT3PlatformInstance;
    end
    else if det.TrackObject is TT3PlatformInstance then
    begin
      v := det.TrackObject as TT3PlatformInstance;
    end;

    if det.TrackDomain = 0 then
    begin
      pnlDepth.Visible      := False;
      pnlAltitude.Visible   := True;

      if Assigned(v) then
      begin
        if v.Altitude <> 0 then
          lbAltitude.Caption := FormatAltitude(v.Altitude * C_Meter_To_Feet)
        else
          lbAltitude.Caption := '0';  // 05/ 04/ 2012
      end;
    end
    else if (det.TrackDomain = 2) OR (det.TrackDomain = 4) then
    begin
      pnlDepth.Visible      := True;
      pnlAltitude.Visible   := False;

      if Assigned(v) then
      begin
        if v.Altitude <> 0 then
          lbDepth.Caption    := FormatAltitude(v.Altitude)
        else
          lbDepth.Caption := '0';     // 05/ 04/ 2012
      end;
    end
    else
    begin
      pnlDepth.Visible      := False;
      pnlAltitude.Visible   := False;
    end;

    if Assigned(v) then
    begin
      if det.IsDetailViewed then
      begin
        if det.DetailedDetectionShowed.Plat_Name_Recog_Capability then
        begin
          lbNameHook.Caption      := v.InstanceName;
        end
        else
        begin
          lbNameHook.Caption      := 'Unknown';
        end;

        if det.DetailedDetectionShowed.Plat_Class_Recog_Capability then
        begin
          lbClassHook.Caption     := v.InstanceClass;
        end
        else
        begin
          lbClassHook.Caption     := 'Unknown';
        end;

        if det.DetailedDetectionShowed.Heading_Data_Capability then
          lbCourseHook.Caption    := FormatCourse(v.Course)
        else
          lbCourseHook.Caption    := '---';

        if det.DetailedDetectionShowed.Ground_Speed_Data_Capability then
          lbGround.Caption        := FormatSpeed(v.Speed)
        else
          lbGround.Caption        := '---';

        if det.DetailedDetectionShowed.Altitude_Data_Capability then
          lbAltitude.Caption    := FormatAltitude(v.Altitude * C_Meter_To_Feet)
        else
          lbAltitude.Caption    := '---';
      end;

      if det.DetailedDetectionShowed.Track_ID then
        lbTrackHook.Caption := FormatTrackNumber(det.trackNumber)
      else
        lbTrackHook.Caption   := 'Unknown';
    end
    else
    begin
      lbNameHook.Caption := 'Unknown';
      lbClassHook.Caption := 'Unknown';
    end;

    lbFormation.Caption     := '---';
    if Assigned(v) then
    begin
      lbDamage.Caption        := IntToStr(100 - Round(v.HealthPercent)) + '%';
    end;
  end
  else
  begin
    if Assigned(v) then
    begin
      if v is TT3NonRealVehicle then
        lbTrackHook.Caption := IntToStr(v.TrackNumber)
      else
        lbTrackHook.Caption := v.Track_ID;

      lbNameHook.Caption := v.InstanceName;

      if v is TT3Vehicle then
        lbClassHook.Caption := TVehicle_Definition(v.UnitDefinition)
          .FData.Vehicle_Identifier;

      if v is TT3Missile then
        lbClassHook.Caption := TMissile_On_Board(v.UnitDefinition)
          .FDef.Class_Identifier;

      if v is TT3Torpedo then
        lbClassHook.Caption := TTorpedo_On_Board(v.UnitDefinition)
          .FDef.Class_Identifier;

      if v is TT3Chaff then lbClassHook.Caption := 'Chaff';

      if v is TT3AirBubble then lbClassHook.Caption := 'Air Bubble';

      if v is TT3Decoy then lbClassHook.Caption := 'Decoy';

      if v is TT3Sonobuoy then lbClassHook.Caption := 'Sonobuoy';

      if v is TT3Mine then lbClassHook.Caption := 'Mine';

      if v.PlatformDomain = 0 then
      begin
        pnlDepth.Visible      := False;
        pnlAltitude.Visible   := True;

        if v.Altitude <> 0 then
         lbAltitude.Caption    := FormatAltitude(v.Altitude * C_Meter_To_Feet)
        else
         lbAltitude.Caption := '0'; // 05/ 04/ 2012
      end
      else if (v.PlatformDomain = 2) or (v.PlatformDomain = 4)then
      begin
        pnlDepth.Visible      := True;
        pnlAltitude.Visible   := False;

        if v.Altitude <> 0 then
          lbDepth.Caption    := FormatAltitude(v.Altitude)
        else
          lbDepth.Caption := '0'; // 05/ 04/ 2012
      end
      else
      begin
        pnlDepth.Visible      := False;
        pnlAltitude.Visible   := False;
      end;

      lbCourseHook.Caption    := FormatCourse(v.Course);
      lbGround.Caption        := FormatSpeed(v.Speed);
      lbFormation.Caption     := '---';

      lbDamage.Caption        := IntToStr(100 - Round(v.HealthPercent)) + '%';
    end;
  end;

  long := simMgrClient.GameEnvironment.FGameArea.Game_Centre_Long;
  lat := simMgrClient.GameEnvironment.FGameArea.Game_Centre_Lat;
  StaticText6.Caption := 'Position';

  case idCoordinat of
    1:
    begin
      if Assigned(v) then
      begin
        lbPositionHook1.Caption := formatDMS_long(v.getPositionX);
        lbPositionHook2.Caption := formatDMS_latt(v.getPositionY);
      end;
    end;
    2:
    begin
      pX := CalcMove(v.getPositionX, long);
      pY := CalcMove(v.getPositionY, lat);

      if (pX >= 0) and (pY >=0) then
      begin
        lbPositionHook1.Caption := 'White ' + FormatFloat('0.00', Abs(pX));  //kuadran 1
      end;
      if (pX <= 0) and (pY >=0) then
      begin
        lbPositionHook1.Caption := 'Red ' + FormatFloat('0.00', Abs(pX));   //kuadran 2
      end;
      if (pX < 0) and (pY < 0) then
      begin
        lbPositionHook1.Caption := 'Green ' + FormatFloat('0.00', Abs(pX)); //kuadran 3
      end;
      if (pX >= 0) and (pY <= 0) then
      begin
        lbPositionHook1.Caption := 'Blue ' + FormatFloat('0.00', Abs(pX));  //kuadran 4
      end;

      lbPositionHook2.Caption := FormatFloat('0.00', Abs(pY));
    end;
    3:
    begin
      if Assigned(v) then
      begin
        lbPositionHook1.Caption := ConvDegree_To_Georef(v.getPositionX, v.getPositionY);
      end;
    end;
    4:
    begin

    end;
    5:
    begin

    end;
    6:
    begin
      VSimMap.GetValLayerKarvak(v.getPositionX, v.getPositionY, largeLtr, smallLtr, horizontalNumb, verticalNumb);
      ConvDegree_To_Karvak(v.getPositionX, v.getPositionY, horzPoint, vertPoint);
      lbPositionHook1.Caption :=  largeLtr+horizontalNumb + horzPoint + verticalNumb + vertPoint;
      lbPositionHook2.Caption := '';
    end;
  end;

  lbBearingHook.Caption   := FormatCourse(b); ;
  lbRangeHook.Caption     := FormatFloat('000.00', d);
end;

procedure TfrmTrackInfo.DisplayTabIFF(Sender: TObject);
var
  v: TT3PlatformInstance;
  det: TT3DetectedTrack;
  SensorDevice: TT3DeviceUnit;
  i: Integer;
  SensorIFF: TT3IFFSensor;
  esm: TT3ESMTrack;
begin
  v := nil;
  det := nil;

  if Assigned(Sender) then   //mk
  begin
    if Sender is TT3PlatformInstance then
      v := TT3PlatformInstance(Sender);

    if Sender is TT3DetectedTrack then
    begin
      det := TT3DetectedTrack(Sender);
      v := TT3PlatformInstance(det.TrackObject);
    end
    else if Sender is TT3ESMTrack then
    begin
      esm := TT3ESMTrack(Sender);

      if esm.DetailedDetectionShowedESM.Track_ID then
        lbTrackIff.Caption      := esm.TrackNumber
      else
        lbTrackIff.Caption      := 'Unknown';

      if esm.DetailedDetectionShowedESM.Name_Data_Capability then
        lbNameIff.Caption      := TT3PlatformInstance(esm.TrackObject).InstanceName
      else
        lbNameIff.Caption      := 'Unknown';

      if esm.DetailedDetectionShowedESM.Class_Data_Capability then
        lbClassIff.Caption      := TT3Radar(esm.TrackObject).RadarDefinition.FDef.Radar_Emitter
      else
        lbClassIff.Caption      := 'Unknown';

      exit;
    end;

    if v = nil then
      exit;

    if det <> nil then
    begin
      if det.DetailedDetectionShowed.Track_ID then
        lbTrackIff.Caption := FormatTrackNumber(det.trackNumber)
      else
        lbTrackIff.Caption := 'Unknown';

      if det.DetailedDetectionShowed.Plat_Name_Recog_Capability then
      begin
        lbNameIff.Caption  := v.InstanceName;
      end
      else
      begin
        lbNameIff.Caption  := 'Unknown';
      end;

      if det.DetailedDetectionShowed.Plat_Class_Recog_Capability then
      begin
        lbClassIff.Caption := v.InstanceClass;
      end
      else
      begin
        lbClassIff.Caption := 'Unknown';
      end;

      lbMode1Iff.Caption := det.TransMode1Detected;
      lbMode2Iff.Caption := det.TransMode2Detected;
      lbMode3Iff.Caption := det.TransMode3Detected;
      lbMode3CIff.Caption := det.TransMode3CDetected;

      if det.TransMode1Detected = '' then
      lbMode1Iff.Caption := '---';

      if det.TransMode2Detected = '' then
      lbMode2Iff.Caption := '---';

      if det.TransMode3Detected = '' then
      lbMode3Iff.Caption := '---';

      if det.TransMode3CDetected = '' then
      lbMode3CIff.Caption := '---';
    end
    else
    begin
      if v is TT3NonRealVehicle then
      begin
        lbTrackIff.Caption := IntToStr(v.TrackNumber);
      end
      else
      begin
        lbTrackIff.Caption := v.Track_ID;
      end;

      lbNameIff.Caption := v.InstanceName;
      lbClassIff.Caption := v.InstanceClass;

      if v is TT3Missile then
        lbClassIff.Caption := TMissile_On_Board(v.UnitDefinition)
          .FDef.Class_Identifier;

      if v is TT3Torpedo then
        lbClassIff.Caption := TTorpedo_On_Board(v.UnitDefinition)
          .FDef.Class_Identifier;

      if v is TT3Chaff then lbClassIff.Caption := 'Chaff';

      if v is TT3AirBubble then lbClassIff.Caption := 'Air Bubble';

      if v is TT3Decoy then lbClassIff.Caption := 'Decoy';

      if v is TT3Sonobuoy then lbClassIff.Caption := 'Sonobuoy';

      if v is TT3Mine then lbClassIff.Caption := 'Mine';

      if v is TT3Vehicle then
      begin
        for i := 0 to TT3Vehicle(v).Devices.Count -1 do
        begin
          SensorDevice := TT3DeviceUnit(TT3Vehicle(v).Devices.Items[i]);

          if SensorDevice is TT3IFFSensor then
          begin
            SensorIFF := TT3IFFSensor(SensorDevice);

            lbMode3CIff.Caption := '---';
            if SensorIFF.TransponderOperateStatus = sopon then
              begin
                if SensorIFF.TransponderMode1Enabled then
                  lbMode1Iff.Caption := DecToOct(IntToStr(SensorIFF.TransponderMode1))
                else
                  lbMode1Iff.Caption := '---';
                if SensorIFF.TransponderMode2Enabled then
                  lbMode2Iff.Caption := DecToOct(IntToStr(SensorIFF.TransponderMode2))
                else
                  lbMode2Iff.Caption := '---';
                if SensorIFF.TransponderMode3Enabled then
                  lbMode3Iff.Caption := DecToOct(IntToStr(SensorIFF.TransponderMode3))
                else
                  lbMode3Iff.Caption := '---';
                end
            else
            begin
              lbMode1Iff.Caption  :='---';
              lbMode2Iff.Caption  := '---';
              lbMode3Iff.Caption  := '---';
              lbMode3CIff.Caption := '---';
            end;
          end;
        end;
      end;
    end;
  end;end;

procedure TfrmTrackInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;

  if Assigned(frmGeneralPfTools) then
    frmGeneralPfTools.btnDetails.Down := False;

end;

procedure TfrmTrackInfo.FormCreate(Sender: TObject);
begin
  InitTabHookedInfo;
end;

procedure TfrmTrackInfo.InitTabHookedInfo;
begin
  //?Hook
  lbTrackHook.Caption := 'Unknown';
  lbNameHook.Caption := 'Unknown';
  lbClassHook.Caption := 'Unknown';
  lbPositionHook1.Caption := '---';
  lbPositionHook2.Caption := '---';
  lbCourseHook.Caption := '---';
  lbGround.Caption := '---';
  lbAltitude.Caption := '---';
  lbDepth.Caption := '---';
  lbBearingHook.Caption := '---';
  lbRangeHook.Caption := '---';

  // Details
  lbTrackDetails.Caption := 'Unknown';
  lbNameDetails.Caption  := 'Unknown';
  lbClassDetails.Caption := 'Unknown';
  lbTypeDetails.Caption  := 'Unknown';
  lbDomain.Caption       := 'Unknown';
  lbIdentifier.Caption   := 'Unknown';

  // Detection
  lbTrackDetection.Caption := 'Unknown';
  lbNameDetection.Caption  := 'Unknown';
  lbClassDetection.Caption := 'Unknown';

  // IFF
  lbTrackIff.Caption := 'Unknown';
  lbNameIff.Caption  := 'Unknown';
  lbClassIff.Caption := 'Unknown';
end;

procedure TfrmTrackInfo.HookContactInfoTraineeDisplayChange(Sender: TObject);
var
  TabSheet: TTabSheet;
  ImageIndex: Integer;
begin
  TabSheet := HookContactInfoTraineeDisplay.ActivePage;
  if Assigned(TabSheet) then
  begin
    if TabSheet = tsHook then
    begin
      //background hitam
      tsHook.ImageIndex := 4;
      //background putih
      tsDetails.ImageIndex := 1;
      tsDetection.ImageIndex := 2;
      tsIFF.ImageIndex := 3;
    end

    else if TabSheet = tsDetails then
    begin
      //background hitam
      tsDetails.ImageIndex := 5;
      //background putih
      tsHook.ImageIndex := 0;
      tsDetection.ImageIndex := 2;
      tsIFF.ImageIndex := 3;
    end

    else if TabSheet = tsDetection then
    begin
      //background hitam
      tsDetection.ImageIndex := 6;
      //background putih
      tsHook.ImageIndex := 0;
      tsDetails.ImageIndex := 1;
      tsIFF.ImageIndex := 3;
    end

    else if TabSheet = tsIFF then
    begin
      //background hitam
      tsIFF.ImageIndex := 7;
      //background putih
      tsHook.ImageIndex := 0;
      tsDetails.ImageIndex := 1;
      tsDetection.ImageIndex := 2;
    end

    else ImageIndex := -1;

  end;
end;

end.
