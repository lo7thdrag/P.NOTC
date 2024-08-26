unit uDBAsset_MotionCharacteristics;

interface

uses
  tttData,Classes;

type


  TMotion_Characteristics = class
  public
    FData : TRecMotion_Characteristics;
    procedure Clone(obj : TMotion_Characteristics);
   // constructor Create;
   // destructor Destroy;override;

  end;

 implementation
{
constructor TMotion_Characteristics.Create;
begin

end;

destructor TMotion_Characteristics.Destroy;
begin
end;
}
{ TMotion_Characteristics }

procedure TMotion_Characteristics.Clone(obj: TMotion_Characteristics);
begin
  obj.FData := FData;
end;

end.
