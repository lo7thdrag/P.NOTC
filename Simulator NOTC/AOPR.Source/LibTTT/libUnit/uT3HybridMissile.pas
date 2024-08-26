{*------------------------------------------------------------------------------
  Unit definition of hybrid missile implementation.

  @author  Ryu
  @version 2013/02/18 1.0 Initial revision.
  @todo
  @comment You can change any codes for further development
-------------------------------------------------------------------------------}

unit uT3HybridMissile;

interface

uses uT3Weapon, Graphics, uT3MissileDetail, uT3Torpedo;

{*------------------------------------------------------------------------------
  Revision History
  18/02/2013 :
    - TT3HybridMissile is born!!!
-------------------------------------------------------------------------------}

type
  TMoveChangeState  = (mcsStable, mcsIncrease, mcsDecrease);

  TT3HybridMissile = class (TT3Missile_HM)
  private
//    FTorpedo : TT3Torpedo;
  protected
    {*------------------------------------------------------------------------------
    @param aDeltaMs
    -------------------------------------------------------------------------------}
    procedure CalcMovement(aDeltaMs: double); override;
  public
    constructor Create; override;
    destructor Destroy; override;

    {*------------------------------------------------------------------------------
      @param aDeltaMs
    -------------------------------------------------------------------------------}
    procedure Move(const aDeltaMs: double); override;

    {*------------------------------------------------------------------------------
    -------------------------------------------------------------------------------}
    procedure UpdateVisual; override;
    {*------------------------------------------------------------------------------
      @param aCnv
    -------------------------------------------------------------------------------}
    procedure Draw(aCnv: tCanvas); override;
    {*------------------------------------------------------------------------------
    -------------------------------------------------------------------------------}
    procedure Initialize;override;

//    property LoadedTorpedo : TT3Torpedo read FTorpedo write FTorpedo;
  end;

implementation

{ TT3HybridMissile }

procedure TT3HybridMissile.CalcMovement(aDeltaMs: double);
begin
  inherited;

end;

constructor TT3HybridMissile.Create;
begin
  inherited;

end;

destructor TT3HybridMissile.Destroy;
begin

  inherited;

end;

procedure TT3HybridMissile.Draw(aCnv: tCanvas);
begin
  inherited;

end;

procedure TT3HybridMissile.Initialize;
begin
  inherited;
end;

procedure TT3HybridMissile.Move(const aDeltaMs: double);
begin
  inherited;

end;

procedure TT3HybridMissile.UpdateVisual;
begin
  inherited;

end;

end.
