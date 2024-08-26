unit ufMainGServer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, OleCtrls, MapXLib_TLB;

type
  TfMainGServer = class(TForm)
    Memo1: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LogStr(const s: string);
  end;

var
  fMainGServer: TfMainGServer;

implementation

{$R *.dfm}

procedure TfMainGServer.LogStr(const s: string);
//var i: integer;
begin
  Memo1.Lines.Insert(0, s);


end;

end.
