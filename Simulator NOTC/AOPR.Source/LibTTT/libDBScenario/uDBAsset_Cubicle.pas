unit uDBAsset_Cubicle;

interface

uses
  Windows, Classes, SysUtils, Graphics,tttData;

type

  TCubicle_Group = class
  public
    FData               : TRecCubicle_Group;

    PlatformInstances   : TList;
    Channel_Assgmnt     : TList;


    constructor Create;
    destructor Destroy; override;
  end;

  TCubicle_Channel_Assignment = class
    public
    FData              : TRecCubicle_Group_Channel_Assgnmnt ;
  end;

implementation

constructor TCubicle_Group.Create;
begin
  PlatformInstances   := TList.Create;
  Channel_Assgmnt     := TList.Create;
end;

destructor TCubicle_Group.Destroy;
begin
  PlatformInstances.Free;
  Channel_Assgmnt.Free;
end;


end.
