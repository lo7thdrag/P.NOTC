unit ufToteDisplayLite;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TfrmToteDisplay = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    FFullScreen: boolean;
    procedure SetFullScreen(const Value: boolean);
    { Private declarations }
  public
    { Public declarations }
    property FullScreen : boolean read FFullScreen write SetFullScreen;

  end;

var
  frmToteDisplay: TfrmToteDisplay;

implementation

{$R *.dfm}

{ TfrmToteDisplay }

procedure TfrmToteDisplay.FormCreate(Sender: TObject);
begin
  FormStyle   := fsNormal;
  BorderStyle := bsNone;
  WindowState := wsMaximized;
end;

procedure TfrmToteDisplay.SetFullScreen(const Value: boolean);
begin
  FFullScreen := Value;
end;

end.
