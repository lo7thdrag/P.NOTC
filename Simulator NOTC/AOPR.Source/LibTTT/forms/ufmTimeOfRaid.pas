unit ufmTimeOfRaid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DateUtils;

type
  TfmTimeOfRaid = class(TForm)
    Label3: TLabel;
    lblDate: TLabel;
    lblTimeRiil: TLabel;
    lblDDay: TLabel;
    lblTime: TLabel;
    lblJTime: TLabel;
    Label1: TLabel;
    btnClose: TButton;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    temSec : Double;
    st : string;
    procedure updateTime(gTime, RemainingDay : TDateTime);
  end;

var
  fmTimeOfRaid: TfmTimeOfRaid;

implementation

uses
  uSimMgr_Client,ufTacticalDisplay;

{$R *.dfm}

procedure TfmTimeOfRaid.btnCloseClick(Sender: TObject);
begin
  frmTacticalDisplay.btnTimeOfRaid.Down := False;
  frmTacticalDisplay.btnDDay2D.Down := False;
  Close
end;

procedure TfmTimeOfRaid.updateTime(gTime, RemainingDay : TDateTime);
var
  JamJ, HariH, d, h, m, s : Double;
  conv1, conv2 : string;
  Hour,Min,Sec,MSec : Word;
  DifTime : TDateTime;

begin
  {Menampilkan Tanggal & Jam Permainan}
  lblDate.Caption := FormatDateTime('dd-mm-yyyy', gTime);
  lblTime.Caption := FormatDateTime('hh:mm:ss', gTime);

  {untuk konversi saja, klo langsung error(tergantung settingan windows)}
  conv1 := FormatDateTime('dd/mm/yyyy', gTime);
  conv2 := FormatDateTime('dd/mm/yyyy', RemainingDay);

  HariH := StrtoDate(conv1) - StrtoDate(conv2);

  DifTime := gTime - RemainingDay;
  DecodeTime(DifTime,Hour,Min,Sec,MSec);

  d := Abs(HariH)* 24 * 60; 
  h := int(Hour) * 60;
  m := int(Min);
  s := int(Sec);

  JamJ := d + h + m;

  if HariH = 0 then
  begin
    lblDDay.Caption := 'H';
  end
  else
  begin
    lblDDay.Caption := 'H ' + FloatToStr(HariH);
  end;

  if temSec <> s then
  begin
    if (temSec = 1) and (s = 59) then
    begin
      st := ' - ';
      JamJ := JamJ + 1;
    end
    else if (temSec = 59) and (s = 1) then
      st := ' + '
    else
    begin
      if temSec = s + 1 then
      begin
        st := ' - ';
        JamJ := JamJ + 1;
      end        
      else if s = temSec + 1 then           
        st := ' + '
    end;

    lblTimeRiil.Caption := FormatDateTime('hh:mm', gTime);

    if (HariH >= 0) and (HariH < 3)then
      lblJTime.Caption := 'J'+ st + FloatToStr(JamJ)
    else
      lblJTime.Caption := '';

    temSec := s;
  end;  

//  Label1.Caption := Format('%d Day %d Hour %d Minute %d Seconds',[Hour,Min,Sec,MSec]);
end;

end.
