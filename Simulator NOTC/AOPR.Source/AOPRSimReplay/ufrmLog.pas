unit ufrmLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Mask;

type
  TfrmReplay = class(TForm)
    btnPlay: TButton;
    btnStop: TButton;
    Button3: TButton;
    btnRewind: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblGameTime: TLabel;
    lblGameSpeed: TLabel;
    lblGameState: TLabel;
    Timer1: TTimer;
    PageControl1: TPageControl;
    Log: TTabSheet;
    mmLog: TMemo;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    medtedt1: TMaskEdit;
    lbl1: TLabel;
    lblMaxTime: TLabel;
    btnJump: TButton;
    TabSheet1: TTabSheet;
    procedure btnPlayClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnRewindClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnJumpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OnLogStr(const strHeader, strBody: string);
    procedure updateGameInfo(const st: byte;
      const gSpeed: double);
    procedure OnTickNotify(const aEventID, aTick : Int64);
    procedure OnResetreplay(Sender : TObject);
  end;

var
  frmReplay: TfrmReplay;

implementation

uses uT3ReplayManager, uGameData_TTT, DateUtils, uT3ReplayClient,
  uT3Unit;

{$R *.dfm}

{ TfrmReplay }

procedure TfrmReplay.btnJumpClick(Sender: TObject);
var
  dt1, dt2 : TDateTime;
  l : TStrings;
  h,n,s: integer;
  y,m,d : Word;
begin

  dt1 := ReplayManager.GameTIME;

  l := TStringList.Create;
  l.Delimiter := ':';
  l.DelimitedText := medtedt1.Text;

  TryStrToInt(l[0],h);
  TryStrToInt(l[1],n);
  TryStrToInt(l[2],s);

  l.Free;

  DecodeDate(dt1,y,m,d);
  dt2 := EncodeDateTime(y,m,d,h,n,s,0);

  if (dt2 <= dt1) or (dt2 > ReplayManager.Reader.RecordStop) then
  begin
    MessageDlg('Jump time not valid..', mtWarning, [mbOK], 0);
    Exit;
  end;

  ReplayManager.JumpToTime := dt2;
  ReplayManager.OnGameControl(5);

end;

procedure TfrmReplay.btnPlayClick(Sender: TObject);
begin
  ReplayManager.OnGameControl(1);
end;

procedure TfrmReplay.btnStopClick(Sender: TObject);
begin
  ReplayManager.OnGameControl(2);

end;

procedure TfrmReplay.Button3Click(Sender: TObject);
begin
  ReplayManager.OnGameControl(3);

end;

procedure TfrmReplay.btnRewindClick(Sender: TObject);
begin
  ReplayManager.OnGameControl(4);

end;

procedure TfrmReplay.OnLogStr(const strHeader, strBody: string);
var
  str : string;
  dt : TDateTime;
begin
  dt := ReplayManager.GameTIME;
  str := '<'+FormatDateTime('dd mmm yyyy hh:nn:ss',dt)+ '> ['+strHeader+'] '+strBody;

  if mmLog.Lines.Count > 200 then
    mmLog.Lines.Clear;

  mmLog.Lines.Insert(0,str);
end;

procedure TfrmReplay.OnResetreplay(Sender: TObject);
begin
  Memo1.Lines.Clear;
  mmLog.Lines.Clear;
end;

procedure TfrmReplay.OnTickNotify(const aEventID, aTick: Int64);
begin
  if memo1.Lines.Count > 200 then
    memo1.Lines.Clear;

  Memo1.Lines.Insert(0,'Tick : ' + IntToStr(aTick) + ' :: ' + getPacketIDname(aEventID) );
end;

procedure TfrmReplay.Timer1Timer(Sender: TObject);
var dt,dt2: TDateTime;
begin
  dt := ReplayManager.GameTIME;
  dt2 := ReplayManager.Reader.RecordStop;

  lblGameTime.Caption := FormatDateTime('dd/mm/yyyy, hh:nn:ss', dt);
  lblMaxTime.Caption := 'Max. Valid Time : ' + FormatDateTime('dd/mm/yyyy, hh:nn:ss', dt2);
end;

procedure TfrmReplay.updateGameInfo(const st: byte; const gSpeed: double);
begin
  case st of
    0: lblGameState.Caption := 'Stopped';
    1: lblGameState.Caption := 'Running';
  end;
  if gSpeed >= 1.0 then
    lblGameSpeed.Caption := IntToStr(Round(gSpeed))
  else
    lblGameSpeed.Caption := FormatFloat('0.00', gSpeed);
end;

end.
