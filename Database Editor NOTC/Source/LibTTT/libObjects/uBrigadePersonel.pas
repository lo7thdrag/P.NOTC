unit uBrigadePersonel;

interface

uses
  MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ImgList, ComCtrls, ToolWin, uRecord, uFormula,
  OleCtrls, uMapXHandler, uCoordConvertor, uGameData_TTT, uBaseCoordSystem, uLibSettingTTT,
  tttData, {TeCanvas,} ColorGrd, uDataTypes;

type
  TPersonel = class
  private
    FId, FVeId: Integer;
    FIdentifier: string;
    FLastupdated: Double; //dng

    procedure SetId(const Value: Integer);
    procedure SetIdentifier(const Value: string);
    procedure SetVeId(const Value: Integer);
    procedure SetLastupdated(const Value: Double);  //dng

  public
    constructor Create;
    destructor Destroy; override;

    property Id : Integer read FId write SetId;
    property Identifier : string read FIdentifier write SetIdentifier;
    property VeId : Integer read FVeId write SetVeId;
    property last_updated : Double read FLastupdated write SetLastupdated;//dng
  end;

  TBrigade = class(TPersonel)
  private

  public
    BatalyonList : TList;

    constructor Create;
    destructor Destroy; override;
  end;

  TBatalyon = class(TPersonel)
  private

  public
    KompiList : TList;

    constructor Create;
    destructor Destroy; override;
  end;

  TKompi = class(TPersonel)
  private

  public
    PlatoonList : TList;
    IdBrigade : Integer;

    constructor Create;
    destructor Destroy; override;
  end;

  TPlatoon = class(TPersonel)
  private

  public
    GroupList : TList;
    IdBrigade : Integer;

    constructor Create;
    destructor Destroy; override;
  end;

  TGroup = class(TPersonel)
  private
    FQuantity: Integer;
    procedure SetQuantity(const Value: Integer);

  public
    IdBrigade, IdBatalyon, IdKompi, IdPlatoon : Integer;
    constructor Create;
    destructor Destroy; override;

    property quantity : Integer read FQuantity write SetQuantity;
  end;
implementation

{ TBrigade }
constructor TBrigade.Create;
begin
  BatalyonList := TList.Create
end;

destructor TBrigade.Destroy;
begin
  BatalyonList.Free;
  inherited;
end;

{ TBatalyon }
constructor TBatalyon.Create;
begin
  KompiList := TList.Create
end;

destructor TBatalyon.Destroy;
begin
  KompiList.Free;
  inherited;
end;

{ TKompi }
constructor TKompi.Create;
begin
  PlatoonList := TList.Create
end;

destructor TKompi.Destroy;
begin
  PlatoonList.Free;
  inherited;
end;

{ TPlatoon }
constructor TPlatoon.Create;
begin
  GroupList := TList.Create
end;

destructor TPlatoon.Destroy;
begin
  GroupList.Free;
  inherited;
end;

{ TGroup }
constructor TGroup.Create;
begin

end;

destructor TGroup.Destroy;
begin

  inherited;
end;


procedure TGroup.SetQuantity(const Value: Integer);
begin
  FQuantity := Value;
end;

{ TPersonel }

constructor TPersonel.Create;
begin

end;

destructor TPersonel.Destroy;
begin

  inherited;
end;

procedure TPersonel.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TPersonel.SetIdentifier(const Value: string);
begin
  FIdentifier := Value;
end;

procedure TPersonel.SetLastupdated(const Value: Double);
begin
  FLastupdated := Value;
end;

procedure TPersonel.SetVeId(const Value: Integer);
begin
  FVeId := Value;
end;

end.
