unit uLoading;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, GIFImg;

type
  TfLoading = class(TForm)
    pbLoading: TProgressBar;
    imgLoading: TImage;
    lbLoading: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLoading: TfLoading;

implementation

{$R *.dfm}

end.
