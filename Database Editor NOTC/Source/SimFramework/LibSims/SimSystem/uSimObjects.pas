unit uSimObjects;


interface

uses
  Classes,  uBaseSimObjects, uSimContainers, uDataTypes,
  Graphics, tttData;

type

//==============================================================================
  TSimObject = class(TBaseSimObject)
  protected
    FObjectID: String;
    FOnDestroy: TNotifyEvent;

    FPosition: t3DPoint;

    function GetObjectID: String;
    procedure SetObjectID(val: String);
  private
    FOnT3Event: TT3Event;
    procedure SetOnT3Event(const Value: TT3Event);
    //function GetPosition(index : integer): double;
    //procedure SetPosition(const Value: T3DPoint);

  protected
    FParent : TSimObject;

    procedure ChildOnDestroy(sender : TObject); virtual;
    procedure TriggerChange(eventType : TEventType);
  public
    function getPositionX: double ;
    function getPositionY: double ;
    function getPositionZ: double ;

    constructor Create;
    destructor Destroy; override;

    procedure Move(const aDeltaMs: double); virtual;
    procedure UpdateVisual; virtual;
    procedure Draw(aCnv: tCanvas); virtual;


  published


  public
    property ObjectID: String read GetObjectID write SetObjectID;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
    property Parent : TSimObject read FParent write FParent;
    property OnT3Event : TT3Event read FOnT3Event write SetOnT3Event;

  end;

//==============================================================================
  TSimObjectNode = class(TSimObject)
  private
    function GetChild(const i: integer): TSimObject;
    function GetChildCount: Integer;

  protected
    FChilds: TSimContainer;

    procedure ChildOnDestroy(sender : TObject); override;
  public
    constructor Create;
    destructor Destroy; override;

    procedure AddChild(cSimObject: TSimObject);
    procedure RemoveChild(cSimObject: TSimObject);
    procedure ClearChilds;

    procedure ClearAndFreeChilds;
    procedure CleanChildNeedFree;

    procedure MoveChilds(const aDeltaMs: double); virtual;  //call child update
    procedure Move(const aDeltaMs: double); override;

    procedure UpdateChildsVisual; virtual;
    procedure UpdateVisual; override;

    procedure DrawChilds(aCnv: tCanvas); virtual;
    procedure Draw(aCnv: tCanvas); override;

    property Childs[const i: integer]: TSimObject read GetChild;
    property ChildCount: Integer read GetChildCount;


  end;

implementation

uses
  SysUtils;

{ TBaseSimClass }
constructor TSimObject.Create;
begin
  inherited;

  FParent := nil;
end;

destructor TSimObject.Destroy;
begin
//  if Assigned(FParent) then
//    FParent.ChildOnDestroy(self);
  if Assigned(FOnDestroy) then
    FOnDestroy(self);

  FParent := nil;

  inherited;
end;


function TSimObject.GetObjectID: String;
begin
  Result := FObjectID;
end;

function TSimObject.getPositionX: double;
begin
  result := FPosition.X;
end;

function TSimObject.getPositionY: double;
begin
  result := FPosition.Y;
end;

function TSimObject.getPositionZ: double;
begin
  result := FPosition.Z;
end;

procedure TSimObject.SetObjectID(val: String);
begin
  FObjectID := val;
end;

procedure TSimObject.SetOnT3Event(const Value: TT3Event);
begin
  FOnT3Event := Value;
end;

procedure TSimObject.TriggerChange;
begin
  if Assigned(FOnT3Event) then
    FOnT3Event(eventType,Self);
end;

procedure TSimObject.UpdateVisual;
begin
  if Assigned(FParent) then begin
    FPosition.X := FParent.getPositionX;
    FPosition.Y := FParent.getPositionY;
    FPosition.Z := FParent.getPositionZ;
  end;
end;

procedure TSimObject.Draw(aCnv: tCanvas);
begin

end;

procedure TSimObject.ChildOnDestroy(sender : TObject);
begin
  // procedure ini dipanggil dari child.
  // karena TsimObject tidak punya child, seharusnya procedure ini tidak pernah
  // dipanggil.
end;

procedure TSimObject.Move(const aDeltaMs: double);
begin
   // self update.
  //calc movement etc
end;

//==============================================================================
{ TSimObjectNode }

constructor TSimObjectNode.Create;
begin
  FChilds := TSimContainer.Create;

end;

destructor TSimObjectNode.Destroy;
begin
  FreeAndNil( FChilds);

  inherited;
end;


procedure TSimObjectNode.ChildOnDestroy(sender : TObject);
begin  // procedure ini dipanggil waktu
  FChilds.GetList.Remove(sender);
  FChilds.ReturnList;
end;


procedure TSimObjectNode.CleanChildNeedFree;
var
  list : TList;
  simObj : TSimObject;
  i : integer;
  found : boolean;
begin
  list := FChilds.GetList;
  found := false;
  for I := List.Count - 1 downto 0 do begin
    simObj := TSimObject(list[i]);
    if simObj.FreeMe then begin
      list.Delete(i);
    end;
  end;

  FChilds.ReturnList;
end;

procedure TSimObjectNode.ClearAndFreeChilds;
begin
  FChilds.ClearAndFreeObject;
end;

procedure TSimObjectNode.ClearChilds;
begin
  // clear list and free all child.
  //  FChilds.ClearObject;
  // ju
  FChilds.GetList.Clear;
  FChilds.ReturnList;

end;


procedure TSimObjectNode.AddChild(cSimObject: TSimObject);
begin
  FChilds.AddObject(cSimObject);
end;


procedure TSimObjectNode.RemoveChild(cSimObject: TSimObject);
begin
//  1. remove from list and  free.
//     FChilds.RemoveObject(cSimObject);
 // 2. just remove from list. do not destroy the object.

  FChilds.GetList.Remove(cSimObject);
  FChilds.ReturnList;
end;


procedure TSimObjectNode.MoveChilds(const aDeltaMs: double);
var i : Integer;
    l : TList;
    sco : TSimObject;
begin
  l :=  FChilds.GetList;

  for I := l.Count - 1 downto 0 do begin
    sco :=  l[i];
    if Assigned(sco)  then
      sco.Move(aDeltaMs);
  end;

  FChilds.ReturnList;
end;

procedure TSimObjectNode.Move(const aDeltaMs: double);
begin
  //  inherited;
  // update my self

  MoveChilds (aDeltaMs);
end;

procedure TSimObjectNode.UpdateChildsVisual;
var i : Integer;
    l : TList;
    sco : TSimObject;
begin
  l :=  FChilds.GetList;
  for I := 0 to l.Count - 1 do begin
    sco :=  l[i];
    if Assigned(sco)  then
      sco.UpdateVisual;
  end;
  FChilds.ReturnList;
end;

procedure TSimObjectNode.UpdateVisual;
begin
  //inherited;
  UpdateChildsVisual;

end;


procedure TSimObjectNode.DrawChilds(aCnv: tCanvas);
var i : Integer;
    l : TList;
    sco : TSimObject;
begin
  l :=  FChilds.GetList;
  for I := 0 to l.Count - 1 do begin
    sco :=  l[i];
    if Assigned(sco)  then
      sco.Draw(aCnv);
  end;
  FChilds.ReturnList;

end;

function TSimObjectNode.GetChild(const i: integer): TSimObject;
var    l : TList;
begin
  l :=  FChilds.GetList;
  if (i>=0) and (i <l.Count)  then
    Result := l[i]
  else
    Result := nil;

  FChilds.ReturnList;

end;

function TSimObjectNode.GetChildCount: Integer;
begin
  Result := FChilds.GetList.Count;
  FChilds.ReturnList;

end;

procedure TSimObjectNode.Draw(aCnv: tCanvas);
begin
//  inherited;
  DrawChilds(aCnv);

end;

end.

