unit uScrCapture;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TfScrCapture = class(TForm)
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
    PDown             : TPoint;
  PActually         : TPoint;
  end;

var
  fScrCapture: TfScrCapture;

implementation

{$R *.dfm}

end.
