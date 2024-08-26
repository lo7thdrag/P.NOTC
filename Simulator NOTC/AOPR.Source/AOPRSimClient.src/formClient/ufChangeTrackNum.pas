unit ufChangeTrackNum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmChangeTrackNum = class(TForm)
    btnSet: TButton;
    Label1: TLabel;
    Label2: TLabel;
    lblOldTrackNum: TLabel;
    edNewTrackNum: TEdit;
    Bevel71: TBevel;
    Button1: TButton;
    btnWeapon: TSpeedButton;
  private
    function getOldTrackNum: integer;
    procedure setOldTrackNum(const Value: integer);
    function getNewTrackNum: integer;
    procedure setNewTrackNum(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    property OldTrackNum: integer read getOldTrackNum write setOldTrackNum;
    property NewTrackNum: integer read getNewTrackNum write setNewTrackNum;
  end;

var
  frmChangeTrackNum: TfrmChangeTrackNum;

implementation

{$R *.dfm}

function TfrmChangeTrackNum.getNewTrackNum: integer;
var i: integer;
begin
  if TryStrToInt(edNewTrackNum.Text, i ) then
    result := i
  else begin
    edNewTrackNum.Text := '0000';
    result := 0;
  end;
end;

procedure TfrmChangeTrackNum.setNewTrackNum(const Value: integer);
begin
  edNewTrackNum.Text :=  Format('%4d', [value]);
end;

function TfrmChangeTrackNum.getOldTrackNum: integer;
var i: integer;
begin
  if TryStrToInt(lblOldTrackNum.Caption, i) then
    result := i
  else begin
    edNewTrackNum.Text := '0000';
    result := 0;
  end;
end;


procedure TfrmChangeTrackNum.setOldTrackNum(const Value: integer);
begin

end;

end.
