unit uPlatforms;

interface

uses
  Classes, uSimObjects, uSimContainers,  uDefinedType, uController,
  uPlatformUtility;

type

//==============================================================================
  TObservableObject = class (TSimObjectNode);

//==============================================================================
  TPlatformDevice = class(TSimObject)
  private
    FAttachedObject: TSimObjectNode;

    procedure SetAttachedObject(val: TSimObjectNode);
  public
    constructor Create;

  public
    property AttachedObject: TSimObjectNode
      read FAttachedObject write SetAttachedObject;

  public

    OperationalStatus: TOperationalStatus;

  end;

//==============================================================================

  TPlatform = class(TSimObjectNode)
  private
    function GetDevices: TList;
  protected
    FDevices  : TSimContainer;
    FWayPoint : TWayPoint;

  public

    constructor Create;
    destructor Destroy; override;

    procedure AddDevice(aDevice: TPlatformDevice);
    procedure RemoveDevice(aDevice: TPlatformDevice);
  published

  public
    Category      : TPlatformCategory;
    Domain        : TPlatformDomain;
    Dimension     : TDimension;
    Steering      : TSteering;
    PlatformType  : string;

    Communication : TPlatformCommunication;
    CrossSection  : TPlatformCrossSection;
    Motion        : TPlatformMotion;
    AirDroppedCharacteristic: TPlatformWithAirDroppedObject;

    DamageSustain : Integer;

    property Devices: TList read GetDevices;

  end;

//------------------------------------------------------------------------------

implementation

{ TPlatformDevice }


{ TPlatform }
constructor TPlatform.Create;
begin
  inherited;
  FDevices := FChilds;

end;

destructor TPlatform.Destroy;
begin
  FDevices := nil;
  inherited;
end;

procedure TPlatform.AddDevice(aDevice: TPlatformDevice);
begin
  FDevices.AddObject(aDevice);

end;

procedure TPlatform.RemoveDevice(aDevice: TPlatformDevice);
begin
  FDevices.RemoveObject(aDevice);
end;

function TPlatform.GetDevices: TList;
begin

end;


{ TPlatformDevice }

constructor TPlatformDevice.Create;
begin

end;

procedure TPlatformDevice.SetAttachedObject(val: TSimObjectNode);
begin
  FAttachedObject := val;
end;

end.
