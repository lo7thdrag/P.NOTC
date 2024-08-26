unit uDetectedObject;

interface

uses uSimObjects, Graphics,uSimVisuals,uCoordConvertor, Classes, SysUtils,
  tttData, uObjectVisuals;

type
  TOnDetected = procedure of object;

type

  TDetectedObject = class (TDrawElement)
  private
    FSimObject  : TSimObject;
    FObjectType : TDetectedObjectType;
    FSensors : TStrings;
    FSelected: boolean;
    FTrackNumber: integer;

    FTacticalSymbol : TTacticalSymbol;
    FTrackDomain: integer;
    FTrackType: integer;
    FTrackForce: integer;

    procedure setObject(obj : TSimObject );
    procedure SetSelected(const Value: boolean);
    procedure SetTrackNumber(const Value: integer);
    procedure SetIdentity(const Value: integer);
    procedure SetTrackDomain(const Value: integer);
    procedure SetTrackType(const Value: integer);
    procedure SetTrackForce(const Value: integer);
  public
    Name : String;
    DetectedBy : TDetectedSensors;
    constructor Create;
    property SimObject : TSimObject read FSimObject write setObject;
    procedure Draw(aCnv: tCanvas); override;
    procedure ConvertCoord(cvt: TCoordConverter); override;
    procedure IfExistDelete(name : String);
    procedure IfNotExistAdd(name : String);

    property Selected     : boolean read FSelected write SetSelected;
    property TrackNumber  : integer read FTrackNumber write SetTrackNumber;
    property TrackDomain  : integer read FTrackDomain write SetTrackDomain;
    property TrackType    : integer read FTrackType write SetTrackType;
    property TrackForce   : integer read FTrackForce write SetTrackForce;
end;

implementation

uses uDBAssetObject, uLibSettingTTT, windows;

{ TDetectedObject }

procedure TDetectedObject.ConvertCoord(cvt: TCoordConverter);
var pi: TPlatform_Instance;
    pt: TPoint;
begin
  inherited;
  if Assigned(FSimObject) then begin
    if FSimObject.ClassType = TPlatform_Instance then begin
      pi := TPlatform_Instance(FSimObject);

      cvt.ConvertToScreen(pi.PositionX,
                          pi.PositionY,
                          pt.X, pt.Y);


      FTacticalSymbol.Center  := pt;

      if pi.IsGroupLeader then
        FTacticalSymbol.SpeedVector.Speed := 90
      else begin
        if Abs(pi.Speed) < 0.1 then
          FTacticalSymbol.SpeedVector.Speed := 0
        else
          FTacticalSymbol.SpeedVector.Speed := 20;
      end;
{
      if pi.Controlled then
        FTacticalSymbol.SpeedVector.Speed := 90
      else begin
        if Abs(pi.Speed) < 0.1 then
          FTacticalSymbol.SpeedVector.Speed := 0
        else
          FTacticalSymbol.SpeedVector.Speed := 20;
      end;
}
      FTacticalSymbol.SpeedVector.Course := pi.Course;

      FTacticalSymbol.ConvertCoord(cvt);

    end;
  end
  else begin
    Center := Point(0,0);
  end;
end;

constructor TDetectedObject.Create;
begin
  inherited;
  FSensors    := TStringlist.Create;
  DetectedBy  := [];
  FSelected   := false;
  FTacticalSymbol := TTacticalSymbol.Create;

{  SetTrackDomain(vhdGeneral);
  SetTrackForce(piFriend);
}  SetTrackDomain(vhdSurface);
  SetTrackForce(piPending);
end;

procedure TDetectedObject.Draw(aCnv: tCanvas);
begin
  inherited;

  if Assigned(FSimObject) then begin

    FTacticalSymbol.Selected := FSelected;
    FTacticalSymbol.Draw(aCnv);
  end;
end;

procedure TDetectedObject.IfExistDelete(name: String);
var i : integer;
begin

  i := FSensors.IndexOf(name);

  if i >= 0 then
    FSensors.Delete(i);

end;

procedure TDetectedObject.IfNotExistAdd(name: String);
var i : integer;
begin
  i := FSensors.IndexOf(name);

  if i = -1 then
    FSensors.Add(name)
end;

procedure TDetectedObject.SetIdentity(const Value: integer);
begin
  FTrackForce := Value;
end;

procedure TDetectedObject.setObject(obj: TSimObject);
var color : TColor;
  symbolName : string;
  piType, force : integer;
begin

  FSimObject := obj;

  if FSimObject.ClassType = TPlatform_Instance then begin
    FObjectType := dotPlatform;

    with TPlatform_Instance(FSimObject) do begin
//      FTacticalSymbol.TextVisual.Text       := FData.Track_ID;
      FTacticalSymbol.TextVisual.Text       := IntToStr(FTrackNumber);
      FTacticalSymbol.SpeedVector.Speed     := Speed;
      FTacticalSymbol.SpeedVector.Course    := Course;

      piType  := Vehicle.FData.Platform_Type;
      force   := FData.Force_Designation;

//auto detect:
//      symbolName := getCorrectSymbol(piType,force, color);
//surface pending
      symbolName := getPendingSymbol(piType);

      FTacticalSymbol.Color := clWhite;
      FTacticalSymbol.Symbol.LoadBitmap(
        vSymbolSetting.ImgPath + symbolName + '.bmp', clWhite);
    end;
  end;
end;

procedure TDetectedObject.SetSelected(const Value: boolean);
begin
  FSelected := Value;
end;

procedure TDetectedObject.SetTrackDomain(const Value: integer);
var
  symbolIdent : string;
  symbolName  : string;
begin
  FTrackDomain := Value;
  case FTrackForce of
    piPending : symbolIdent := pfPending;
    piUnknown : symbolIdent := pfPending;
    piAssumedFriend : symbolIdent := pfAssumedFriend;
    piFriend  : symbolIdent := pfFriend;
    piNeutral : symbolIdent := pfNeutral;
    piSuspect : symbolIdent := pfSuspect;
    piHostile : symbolIdent := pfHostile ;
  else
    symbolIdent := pfPending;
  end;

  case FTrackDomain of
    // air
    vhdAir : symbolName := pctAir + symbolIdent + '.bmp';
    // surface
    vhdSurface : symbolName := pctSurface + symbolIdent + '.bmp';
    // subsurface
    vhdSubsurface : symbolName := pctSubSurface + symbolIdent + '.bmp';
    // Land
    vhdLand : symbolName := pctLand + symbolIdent + '.bmp';
    //Amphibi
    vhdAmphibious : symbolName := pctAmphibious + symbolIdent + '.bmp';  //mk 03052012
    // general
    vhdGeneral : symbolName := pctGeneral + '.bmp';
  else
    symbolName := pctGeneral + '.bmp';
  end;

  //FTacticalSymbol.Symbol.LoadBitmap(vSymbolSetting.ImgPath + symbolName ,FTacticalSymbol.Symbol.Color);
end;

procedure TDetectedObject.SetTrackForce(const Value: integer);
//var color : TColor;
begin
  FTrackForce := Value;

  case FTrackForce of
    piPending : Color := cgOther;
    piUnknown : Color := cgOther;
    piAssumedFriend : Color := cgFriend;
    piFriend  : Color := cgFriend;
    piNeutral : Color := cgOther;
    piSuspect : Color := cgSuspect;
    piHostile : Color := cgHostile;
  end;
end;

procedure TDetectedObject.SetTrackNumber(const Value: integer);
begin
  FTrackNumber := Value;
  FTacticalSymbol.TextVisual.Text       := IntToStr(FTrackNumber);
end;

procedure TDetectedObject.SetTrackType(const Value: integer);
begin
  FTrackType := Value;
end;

end.
