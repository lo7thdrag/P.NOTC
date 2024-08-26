unit ufmMapWindow;

interface

uses
  MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, ExtCtrls;

type
  TfmMapWindow = class(TFrame)
    pnlTop: TPanel;
    pnlMap: TPanel;
    Map: TMap;
    procedure MapDblClick(Sender: TObject);
    procedure MapExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure InitOnFormCreate;
    procedure InitOnFormDestroy;

  end;

implementation

{$R *.dfm}


{ TfmMapWindow }

procedure TfmMapWindow.InitOnFormCreate;
begin
  Map.DoubleBuffered := true;

end;

procedure TfmMapWindow.InitOnFormDestroy;
begin

end;

procedure TfmMapWindow.MapDblClick(Sender: TObject);
begin //

end;

procedure TfmMapWindow.MapExit(Sender: TObject);
begin  //

end;

end.
