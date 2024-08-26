unit uPlatformData;

interface

uses
  tttData;

type
  TPlatform = class
  private
    FInstanceIndex : Integer;

    FInstanceIdentIndex : Integer;
    FClassIndex : Integer;
  public
    InstanceName : AnsiString;

    property InstanceIndex : Integer read FInstanceIndex write FInstanceIndex;

    property InstanceIdentIndex : Integer read FInstanceIdentIndex
      write FInstanceIdentIndex;
    property ClassIndex : Integer read FClassIndex write FClassIndex;
  end;

  TVehicle_Definition = class
  private
  public
    FData : TRecVehicle_Definition;
    FPlatform_Ident : TRecPlatform_Instance_Identifier;
  end;

implementation

end.
