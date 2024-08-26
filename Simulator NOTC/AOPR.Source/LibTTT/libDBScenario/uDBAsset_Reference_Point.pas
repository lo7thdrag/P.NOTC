unit uDBAsset_Reference_Point;

interface

uses
  tttData, Classes, Graphics, uSimVisuals;


type

  TReference_Point = class
  public
    FData         : TRecReference_Point;
    Symbol_Name   : String;
    Symbol_Color  : TColor;
    Drawing       : TDrawElement;
    IsSelected    : boolean;
  end;


implementation




end.
