unit uWaypoint;

interface

uses Windows,uDBAsset_Scripted, Classes, tttData, Graphics,uCoordConvertor, uSimContainers;


type
  TWaypointEventType  = (wetRadar,wetSonar,wetWeapon1,wetWeapon2,wetWeapon3,
                         wetWeapon4, wetWeapon5,wetMine,wetSonobuoy,wetCom,
                         wetChaff, wetIFFTransponder, wetIFFInterogator, wetNone);

  TWaypointEventClass = class
    FType   : TWaypointEventType;
    FEnable : boolean;
    FData   : TObject;  // object of scripted event
  end;

  TWaypoint = class
  private
    FWPList : TList;
    FPixelTrails : array of TPoint;
    FEvents: TList;
    FTermination: TWaypointTermination;
    FIndexPoint : integer;

    function GetEvents(index : integer) : Tlist;
    function GetBehaviour(index: integer): TObject;
    function GetCount: integer;

    procedure SetTermination(const Value: TWaypointTermination);
  public
    constructor Create;
    destructor Destroy; override;

    function EventExistForObject(indexbehav : integer; valObject : TObject; var varObject : TObject) : boolean;overload;
    function EventExistForObject(indexbehav : integer; valType : TWaypointEventType; var varObject : TObject) : boolean;overload;
    function First    : TObject;
    function Last     : TObject;
    function Next     : TObject;
    function Previous : TObject;

    procedure Add(behav : TScripted_Behav_Definition; event : TWaypointEventClass);
    procedure Delete(behav : TScripted_Behav_Definition);overload;
    procedure Delete(index : integer);overload;
    procedure Clear;
    procedure ConvertCoord(cvt: TCoordConverter);
    procedure Draw(aCnv : TCanvas);

    property Events[index : integer] : TList read GetEvents;
    property Behaviour[index : integer] : TObject read GetBehaviour;
    property Count : integer read GetCount;
    property Termination : TWaypointTermination read FTermination write SetTermination;
  end;

implementation

uses uLibSettingTTT, uDBAsset_radar, uDBAsset_Sonar, uDBAsset_Sensor;
{ TWaypoint }

procedure TWaypoint.Add(behav: TScripted_Behav_Definition; event: TWaypointEventClass);
var rec, tmp : ^TRecWaypoint;
    isNew, isDone : boolean;
    i : integer;
    List : TList;
begin
  isNew := true;

  //List := FWPList.LockList;
  List := FWPList;
  for i := 0 to List.Count - 1 do begin
    rec := List.Items[i];
    if TScripted_Behav_Definition(rec^.Behav).FData.Scripted_Event_Index =
       behav.FData.Scripted_Event_Index then begin
          if event <> nil then
            rec^.Events.Add(event);
          isNew := false;
       end;
  end;

  if isNew then begin
    isDone := false;

    New(rec);
    rec^.Events := TList.Create;
    rec^.Behav  := behav;
    if event <> nil then
      rec^.Events.Add(event);

    for I := 0 to List.Count - 1 do begin
      tmp := List.Items[i];
      if (TScripted_Behav_Definition(tmp^.Behav).FData.Scripted_Event_Index >
         behav.FData.Scripted_Event_Index) and (i <> List.Count - 1) then begin
           List.Insert(i,rec);
           isDone := true;
         end;
    end;
    if not isDone then FWPList.Add(rec);
  end;
  //FWPList.UnlockList;

//  List.Free;
end;

procedure TWaypoint.Clear;
var rec : ^TRecWaypoint;
    i : integer;
    List : TList;
begin
  //list := FWPList.LockList;
  List := FWPList;
  for i := 0 to List.Count - 1 do begin
    rec := List.Items[i];
    rec^.Behav.Free;
    rec^.Events.Clear;
    Dispose(rec);
  end;
  List.Clear;
  //FWPList.UnlockList;
end;

procedure TWaypoint.ConvertCoord(cvt: TCoordConverter);
var i : integer;
  dx, dy : double;
  rec : ^TRecWaypoint;
  list : TList;
begin
  //list := FWPList.LockList;
  List := FWPList;
  SetLength(FPixelTrails,List.Count);
  for i := 0 to List.Count - 1 do begin
    rec := List.Items[i];
    dx := TScripted_Behav_Definition(rec^.Behav).FData.Waypoint_Longitude;
    dy := TScripted_Behav_Definition(rec^.Behav).FData.Waypoint_Latitude;
    cvt.ConvertToScreen(dx, dy, FPixelTrails[i].X ,  FPixelTrails[i].Y );
  end;
  //FWPList.UnlockList;
end;

constructor TWaypoint.Create;
begin
  //FWPList := TThreadList.Create;
  FWPList := TList.Create;
  FTermination := wtLH;
  FIndexPoint  := -1;
end;

procedure TWaypoint.Delete(index: integer);
var rec : ^TRecWaypoint;
  list : TList;
begin
  //list := FWPList.LockList;
  list := FWPList;
  if (index < 0) and (index >= List.Count) then exit;

  rec := List.Items[index];
  rec^.Behav.Free;
  rec^.Events.Clear;
  rec^.Events.Free;
  Dispose(rec);

  list.Delete(index);
  //FWPList.UnlockList;
end;

destructor TWaypoint.Destroy;
var
  i : Integer;

begin
  for i := FWPList.Count - 1 downto 0 do
  begin
    TObject(FWPList[i]).Free
  end;
  FWPList.Clear;
  FWPList.Free;

//  ClearAndFreeItems(FWPList);
  inherited;
end;

procedure TWaypoint.Draw(aCnv: TCanvas);
var
  i: integer;
  bmp : TBitmap;
  w,h,x,y : integer;
begin
  with aCnv do begin
    Pen.Color := clBlack;
    Pen.Style := psSolid;
    for i := 0 to Length(FPixelTrails) - 1 do begin
      bmp := TBitmap.Create;
      bmp.Transparent := true;
      bmp.LoadFromFile(vSymbolSetting.ImgPath + pctWayPoint + '.bmp');

      w := bmp.Width;
      h := bmp.Height;

      x   := FPixelTrails[i].X - (w div 2);
      y   := FPixelTrails[i].Y - (h div 2);
      Draw(x,y,bmp);

      bmp.Free;
    end;
  end;
end;

function TWaypoint.EventExistForObject(indexbehav: integer;
  valType: TWaypointEventType; var varObject: TObject): boolean;
var rec : ^TRecWaypoint;
    event : TWaypointEventClass;
    i : integer;
    list : TList;
    exist : boolean;
begin
  Result := True;
  if indexbehav > Count - 1 then exit;
  if indexbehav < 0 then exit;

  //list := FWPList.LockList;
  list := FWPList;
  exist := false;
  varObject := nil;

  rec := List.Items[indexbehav];

  for i:=0 to rec^.Events.Count - 1 do begin
    event := rec^.Events[i];
    if event.FType = valType then begin
      varObject := event;
      exist := true;
      break;
    end;
  end;

  result := exist;
end;

function TWaypoint.First: TObject;
begin
  result := nil;

  if FWPList.Count = 0 then exit;

  FIndexPoint := 0;
  result := Behaviour[0];
end;

function TWaypoint.EventExistForObject(indexbehav: integer;
  valObject: TObject; var varObject : TObject): boolean;
var rec : ^TRecWaypoint;
    event : TWaypointEventClass;
    i : integer;
    list : TList;
    exist : boolean;
begin
  Result := True;
  if indexbehav > Count - 1 then exit;
  if indexbehav < 0 then exit;

  //list := FWPList.LockList;
  list := FWPList;

  exist := false;
  varObject := nil;

  rec := List.Items[indexbehav];
  for i:=0 to rec^.Events.Count - 1 do begin

    event := rec^.Events[i];

    if valObject.ClassType = TRadar_On_Board then begin
      if event.FData.ClassType = TScripted_Radar_Event then
        if TRadar_On_Board(valObject).FData.Radar_Index =
           TScripted_Radar_Event(event.FData).FData.Radar_Index then begin

          exist     := true;
          varObject := event;

          break;
        end;
    end else
    if valObject.ClassType = TSonar_On_Board then begin
      if event.FData.ClassType = TScripted_Sonar_Event then
        if TSonar_On_Board(valObject).FData.Sonar_Index =
           TScripted_Sonar_Event(event.FData).FData.Sonar_Index then begin

          exist     := true;
          varObject := event;

          break;
        end;
    end else
    if valObject.ClassType = TIFF_Sensor_On_Board then begin
      if event.FData.ClassType = TScripted_IFF_Event then
        if TIFF_Sensor_On_Board(valObject).FData.IFF_Instance_Index =
           TScripted_IFF_Event(event.FData).FData.IFF_Instance_Index then begin

          exist     := true;
          varObject := event;

          break;
        end;
    end;
  end;

  result := exist;
  //FWPList.UnlockList;
end;

procedure TWaypoint.Delete(behav : TScripted_Behav_Definition);
var rec : ^TRecWaypoint;
    i : integer;
    list : Tlist;
begin
  //list := FWPList.LockList;
  list := FWPList;
  for i := 0 to List.Count - 1 do begin
    rec := List.Items[i];
    if TScripted_Behav_Definition(rec^.Behav).FData.Scripted_Event_Index =
       behav.FData.Scripted_Event_Index then begin
          List.Delete(i);
          break;
       end;
  end;
  //FWPList.UnlockList;
end;

function TWaypoint.GetBehaviour(index: integer): TObject;
var rec : ^TRecWaypoint;
  list : TList;
begin
  Result := nil;
  //list := FWPList.LockList;
  list := FWPList;
  if List.Count > 0 then begin
    if (index > -1) and (index <= List.count-1) then begin
      rec := List.Items[index];
      result := rec^.Behav;
    end else result := nil;
  end;
  //FWPList.UnlockList;
end;

function TWaypoint.GetCount: integer;
var
  list : TList;
begin
  //list := FWPList.LockList;
  list := FWPList;
  result := List.Count;
  //FWPList.UnlockList;
end;

function TWaypoint.GetEvents(index : integer): Tlist;
var rec : ^TRecWaypoint;
  list : TList;
begin
  Result := nil;
  //list := FWPList.LockList;
  list := FWPList;
  if List.Count > 0 then begin
    if (index > -1) and (index <= List.count-1) then begin
      rec := List.Items[index];
      result := rec^.Events;
    end else result := nil;
  end;
  //FWPList.UnlockList;
end;

function TWaypoint.Last: TObject;
begin
  result := nil;

  if FWPList.Count = 0 then exit;

  FIndexPoint := FWPList.Count - 1;
  result := Behaviour[FWPList.Count - 1];
end;

function TWaypoint.Next: TObject;
begin
  result := nil;

  if FWPList.Count = 0 then exit;

  FIndexPoint := FIndexPoint + 1;
  if FIndexPoint < FWPList.Count - 1 then
    result := Behaviour[FIndexPoint]
  else begin
    FIndexPoint := FWPList.Count;
    result := nil;
  end;
end;

function TWaypoint.Previous: TObject;
begin
  result := nil;

  if FWPList.Count = 0 then exit;

  FIndexPoint := FIndexPoint - 1;
  if FIndexPoint >= 0 then
    result := Behaviour[FIndexPoint]
  else begin
    FIndexPoint := -1;
    result := nil;
  end;

end;

procedure TWaypoint.SetTermination(const Value: TWaypointTermination);
begin
  FTermination := Value;
end;

end.
