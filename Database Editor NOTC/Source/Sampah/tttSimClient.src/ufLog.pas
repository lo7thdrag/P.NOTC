unit ufLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmLog = class(TForm)
    Memo1: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LogStr(const s: string);
  end;

var
  frmLog: TfrmLog;

implementation

{$R *.dfm}
procedure TfrmLog.LogStr(const s: string);
//var i: integer;
begin
//  Memo1.Lines.Insert(0, s);


end;

end.
