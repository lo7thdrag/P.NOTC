unit uDBAsset_Logistic;

interface

uses
  tttData,Classes;

type


  TLogistic_Characteristics = class
  public
    FData : TRecLogistic_Characteristics;
    procedure Clone(obj : TLogistic_Characteristics);
  end;

 implementation


{ TLogistic_Characteristics }

procedure TLogistic_Characteristics.Clone(obj: TLogistic_Characteristics);
begin
  obj.FData := FData;
end;

end.
