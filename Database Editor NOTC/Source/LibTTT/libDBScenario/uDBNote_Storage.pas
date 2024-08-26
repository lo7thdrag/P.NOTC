unit uDBNote_Storage;

interface

uses
  Classes;

type


  TNote_Storage = record
    Note_Index               : integer;
    Note_Type                : byte;
    //    Notes                    : string[2000];
    Notes                    : string;
  end;

 implementation

end.
