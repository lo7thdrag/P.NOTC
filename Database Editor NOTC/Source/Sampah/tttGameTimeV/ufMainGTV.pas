unit ufMainGTV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uNetUDPNode, uVirtualTime, uThreadTimer,  ExtCtrls;

type
  TfrmMainGT = class(TForm)
    lblServerTIME: TLabel;
    lblGTCaption: TLabel;
    Timer1: TTimer;
    lblRTCaption: TLabel;
    lblGameTime: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FTT : TMSTimer;
    procedure netRecv_GameTime(apRec: PAnsiChar; aSize: Word);
    procedure RunningThread(const dt: double);

    { Private declarations }
  public
    { Public declarations }

    FUDPNode   : TNetUDPNode;
    FVTime : TVirtualTime;
    first  : boolean;

    procedure SetGameTime(const gt: tDateTime);
    procedure SetServerTime(const gt: tDateTime);

  end;

var
  frmMainGT: TfrmMainGT;

implementation
uses
  uLibSettingTTT, uGameData_TTT;

{$R *.dfm}

procedure TfrmMainGT.FormCreate(Sender: TObject);
begin
//
  SetServerTime(Now);

  first := true;
  vSettingFile := getFileSetting;
  LoadFF_NetSetting(vSettingFile, vNetSetting);


  FVTime := TVirtualTime.Create;
  FVTime.DateTimeOffset := 0;

  FUDPNode := TNetUDPNode.Create;
  FUDPNode.RegisterProcedure(CPID_GAMETIME,
    netRecv_GameTime, SizeOf(TRecGameTime));

  FUDPNode.Port  := vNetSetting.GamePort;
  FUDPNode.Listen(IntToStr( vNetSetting.GamePort));

  FTT := TMSTimer.Create;
  FTT.OnRunning := RunningThread;
  FTT.Interval := 200;
  FTT.Enabled   := true;

  DoubleBuffered := true;

end;

procedure TfrmMainGT.FormResize(Sender: TObject);
begin
  lblRTCaption.Left := ((Width - lblRTCaption.Width) div 2);
  lblRTCaption.Top := Round(Height * 0.1);
  lblServerTIME.Left := ((Width - lblServerTIME.Width) div 2);
  lblServerTIME.Top := Round(Height * 0.25);

  lblGTCaption.Left := ((Width - lblGTCaption.Width) div 2);
  lblGTCaption.Top := Round(Height * 0.52);

  lblGameTime.Left := ((Width - lblGameTime.Width) div 2);
  lblGameTime.Top  := Round(Height * 0.67);

  Bevel2.Height := Height div 2;

end;

procedure TfrmMainGT.netRecv_GameTime(apRec: PAnsiChar; aSize: Word);
var vdt: TDateTime;
   aRec: ^TRecGameTime;
   vMSDelta: Integer;
   st : TSystemTime;

begin
  aRec := @apRec^;

  FVTime.DateTimeOffset := aRec^.GameStart;
  FVTime.SetMilliSecond(aRec^.GameMS);

  if first then begin
    DateTimeToSystemTime(aRec^.ServerTime, st);
    SetLocalTime(st);
    first := false;
  end;
end;

procedure TfrmMainGT.RunningThread(const dt: double);
begin
  FVTime.IncreaseMillisecond(dt * 1000.0);
end;

procedure TfrmMainGT.SetGameTime(const gt: tDateTime);
begin
  lblGameTime.Caption := FormatDateTime(' hh : nn : ss ', gt)
end;

procedure TfrmMainGT.SetServerTime(const gt: tDateTime);
begin
  lblServerTIME.Caption := FormatDateTime(' hh : nn : ss ', gt)
end;

procedure TfrmMainGT.Timer1Timer(Sender: TObject);
begin
  SetServerTime(Now);
  if not first then
    SetGameTime(FVTime.GetTime);
end;

end.
