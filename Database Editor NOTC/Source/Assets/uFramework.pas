unit uFramework;

interface

uses Classes, uSimobjects, uPlatformUtility, uController,
  uDefinedType;

type

  TPlatformDevice = class;
  IObserver = interface;

//------------------------------------------------------------------------------
  IObservable = interface

    /// <aObserver>Subscribe Observer</aObserver>
    procedure addObserver(aObserver: IObserver);
    /// <aObserver>Observer to be remove</aObserver>
    procedure removeObserver(aObserver: IObserver); overload;
    procedure notifyObservers;
    /// <aIndex>Index of observer to be remove</aIndex>
    procedure removeObserver(aIndex: Integer); overload;

  end;
//------------------------------------------------------------------------------

  IObserver = interface

    procedure update;
  end;
//------------------------------------------------------------------------------

  TConcreteObservable = class(TBaseSimObject)
  private
    FObservers: TList;

  public
    constructor Create;
    destructor Destroy; override;
    procedure addObserver(aObserver: IObserver);
    procedure removeObserver(aObserver: IObserver); overload;
    procedure removeObserver(aIndex: Integer); overload;
    procedure notifyObservers;

  public
    procedure run; virtual; abstract;

  end;
//------------------------------------------------------------------------------

  TConcreteObserver = class(TInterfacedObject, IObserver)

  public
    procedure update;
    constructor Create;
    destructor Destroy; override;
  end;
//------------------------------------------------------------------------------
  TObservableObject = class(TConcreteObservable)

  private
    FObjectID: string;
  private
    function GetObjectID: string;
    procedure SetObjectID(val: string);
    function GetName: String;
    procedure SetName(val: String);
  public
    property ObjectID: string read GetObjectID write SetObjectID;
  public
    property Name: String read GetName write SetName;

  private
  var
    FName: String;
  strict private
    function GetPosition: T2DPoint;
    procedure SetPosition(val: T2DPoint);
  public
    property Position: T2DPoint read GetPosition write SetPosition;

  end;

//------------------------------------------------------------------------------
  TObserverObject = class(TConcreteObserver)

  private
  var
    FObjectID: String;
  strict private
    function GetObjectID: String;
    procedure SetObjectID(val: String);
  public
    property ObjectID: String read GetObjectID write SetObjectID;

  end;

//------------------------------------------------------------------------------

  TPlatform = class(TObservableObject)
  private
  var
    FDevices: TList;
  public
    procedure AddDevice(aDevice: TPlatformDevice);
    procedure RemoveDevice(aDevice: TPlatformDevice);
    constructor Create;
    destructor Destroy; override;

  protected

  private
  var
    FWayPoint: TWayPoint;
  strict private
    function GetDomain: TPlatformDomain;
    procedure SetDomain(val: TPlatformDomain);
  public
    property Domain: TPlatformDomain read GetDomain write SetDomain;
  strict private
    function GetCategory: TPlatformCategory;
    procedure SetCategory(val: TPlatformCategory);
  public
    property Category: TPlatformCategory read GetCategory write SetCategory;
  strict private
    function GetPlatformType: string;
    procedure SetPlatformType(val: string);
  public
    property PlatformType: string read GetPlatformType write SetPlatformType;
  strict private
    function GetDamageSustain: Integer;
    procedure SetDamageSustain(val: Integer);
  public
    property DamageSustain
      : Integer read GetDamageSustain write SetDamageSustain;
  strict private
    function GetCommunication: TPlatformCommunication;

  public
    /// <clientCardinality>0..1</clientCardinality>
    /// <supplierCardinality>1</supplierCardinality>
    /// <directed>True</directed>
    property Communication: TPlatformCommunication read GetCommunication;

  var
    /// <directed>True</directed>
    /// <clientCardinality>1</clientCardinality>
    /// <supplierCardinality>1</supplierCardinality>
    /// <alias>Motion</alias>
    Motion: TPlatformMotion;

  public

  var
    /// <clientCardinality>1</clientCardinality>
    /// <supplierCardinality>1</supplierCardinality>
    /// <directed>True</directed>
    CrossSection: TPlatformCrossSection;
    /// <clientCardinality>0..1</clientCardinality>
    /// <supplierCardinality>1</supplierCardinality>
    /// <directed>True</directed>
    AirDroppedCharacteristic: TPlatformWithAirDroppedObject;
  strict private
    function GetDimension: TDimension;
    procedure SetDimension(val: TDimension);
  public
    property Dimension: TDimension read GetDimension write SetDimension;

  var
    /// <directed>True</directed>
    /// <clientCardinality>1</clientCardinality>
    /// <supplierCardinality>1</supplierCardinality>
    Steering: TSteering;
  strict private
    function GetDevices: TList;

  public
    property Devices: TList read GetDevices;

  end;

//------------------------------------------------------------------------------
  TPlatformDevice = class(TObservableObject)

  private
  var
    FAttachedObject: TObservableObject;
  strict private
    function GetAttachedObject: TObservableObject;
    procedure SetAttachedObject(val: TObservableObject);
  public
    property AttachedObject: TObservableObject read GetAttachedObject write
      SetAttachedObject;
  strict private
    function GetOperationalStatus: TOperationalStatus;
    procedure SetOperationalStatus(val: TOperationalStatus);
  public
    property OperationalStatus
      : TOperationalStatus read GetOperationalStatus write
      SetOperationalStatus;

  end;

implementation

constructor TConcreteObservable.Create;
begin
  inherited Create;

  FObservers := TList.Create;
end;

destructor TConcreteObservable.Destroy;
begin
  FObservers.Free;
  inherited Destroy;
end;

procedure TConcreteObservable.addObserver(aObserver: IObserver);
begin
  FObservers.Add(@aObserver);
end;

procedure TConcreteObservable.removeObserver(aObserver: IObserver);
begin
  FObservers.Remove(@aObserver);
end;

procedure TConcreteObservable.notifyObservers;
var
  Current: ^IObserver;
  i: Integer;
begin
  for Current in FObservers do
    Current.update;
end;

procedure TConcreteObservable.removeObserver(aIndex: Integer);
begin
  if (aIndex >= 0) and (FObservers.Count > 0) then
    FObservers.Delete(aIndex);
end;

procedure TConcreteObserver.update;
begin
end;

constructor TConcreteObserver.Create;
begin
  inherited Create;
end;

destructor TConcreteObserver.Destroy;
begin
  inherited Destroy;
end;

function TObservableObject.GetObjectID: string;
begin
  result := FObjectID;
end;

procedure TObservableObject.SetObjectID(val: string);
begin
  FObjectID := val;
end;

function TObserverObject.GetObjectID: String;
begin
end;

procedure TObserverObject.SetObjectID(val: String);
begin
end;

function TObservableObject.GetName: String;
begin
end;

procedure TObservableObject.SetName(val: String);
begin
end;

function TObservableObject.GetPosition: T2DPoint;
begin
end;

procedure TObservableObject.SetPosition(val: T2DPoint);
begin
end;

procedure TPlatform.AddDevice(aDevice: TPlatformDevice);
begin
  FDevices.Add(@aDevice);
  aDevice.AttachedObject := self;
end;

procedure TPlatform.RemoveDevice(aDevice: TPlatformDevice);
begin
  aDevice.AttachedObject := nil;
  FDevices.Remove(@aDevice);
end;

constructor TPlatform.Create;
begin
  inherited Create;
  FDevices := TList.Create;
end;

destructor TPlatform.Destroy;
begin
  FDevices.Free;
  inherited Destroy;
end;

function TPlatform.GetDomain: TPlatformDomain;
begin
end;

procedure TPlatform.SetDomain(val: TPlatformDomain);
begin
end;

function TPlatform.GetCategory: TPlatformCategory;
begin
end;

procedure TPlatform.SetCategory(val: TPlatformCategory);
begin
end;

function TPlatform.GetPlatformType: string;
begin
end;

procedure TPlatform.SetPlatformType(val: string);
begin
end;

function TPlatform.GetDamageSustain: Integer;
begin
end;

procedure TPlatform.SetDamageSustain(val: Integer);
begin
end;

function TPlatform.GetCommunication: TPlatformCommunication;
begin
end;

function TPlatformDevice.GetAttachedObject: TObservableObject;
begin
  result := FAttachedObject;
end;

procedure TPlatformDevice.SetAttachedObject(val: TObservableObject);
begin
  FAttachedObject := val;
end;

function TPlatformDevice.GetOperationalStatus: TOperationalStatus;
begin
end;

procedure TPlatformDevice.SetOperationalStatus(val: TOperationalStatus);
begin
end;

function TPlatform.GetDimension: TDimension;
begin
end;

procedure TPlatform.SetDimension(val: TDimension);
begin
end;

function TPlatform.GetDevices: TList;
begin
  result := Devices;
end;

end.
