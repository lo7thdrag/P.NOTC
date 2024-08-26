unit uGotoTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComCtrls, ExtCtrls;

type
  TfrmGotoTime = class(TForm)
    btnApply: TButton;
    btnCancel: TButton;
    Label1: TLabel;
    lblCurrentTime: TLabel;
    GroupBox1: TGroupBox;
    rbExactly: TRadioButton;
    rbSpecific: TRadioButton;
    cbExactly: TComboBox;
    edtTime: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    tmGameTime: TTimer;
    pgProgress: TProgressBar;
    edtDate: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    lblInfo: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmGameTimeTimer(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbSpecificClick(Sender: TObject);
  private
    { Private declarations }
    FGotoState : Boolean;
    procedure UpdateProgress(const progressVal : integer);
  public
    { Public declarations }

  end;

var
  frmGotoTime: TfrmGotoTime;

implementation

uses
  uSimMgr_Client,tttData, uGameData_TTT;

{$R *.dfm}

procedure TfrmGotoTime.btnApplyClick(Sender: TObject);
var
  r: TRecCmd_GameCtrl;
  time : TTime;
  dt : TDate;
  gt : TDateTime;
  h,m,s,n : word;
  y,t,d : word;
  SavedShortdateFmt : string;
begin
//  Height := 227;

  lblInfo.Visible := True;

  { check time to go if specific time defined }
  if rbSpecific.Checked then
  begin
    SavedShortdateFmt := FormatSettings.ShortDateFormat;
    FormatSettings.ShortDateFormat := 'dd/mm/yyyy';

    time := StrToTime(edtTime.Text);
    dt := StrToDate(edtDate.Text);
    gt := dt + time;

    if gt < simMgrClient.GameTIME then
      Exit;

    FormatSettings.ShortDateFormat := SavedShortdateFmt;

  end;

  // send to server
  r.GameCtrl := CORD_ID_gototime;
  r.SessionID := simMgrClient.SessionID;

  if rbExactly.Checked then
    r.GotoTime := cbExactly.ItemIndex
  else
  begin
    r.GotoTime := 1000;
    r.TimeTogo := gt;
  end;

  simMgrClient.netSend_CmdGameControl(r);

  { disable all button }
  btnApply.Enabled := False;
  cbExactly.Enabled := False;
  edtDate.Enabled := False;
  edtTime.Enabled := False;
  FGotoState := True;
end;

procedure TfrmGotoTime.btnCancelClick(Sender: TObject);
//var
//  r: TRecCmd_GameCtrl;
begin

//  if FGotoState then
//    if Application.MessageBox('Cancel running go to time?' + #13#10 +
//      'This will canceling your current go to action..', 'Warning', MB_YESNO
//      + MB_ICONWARNING) = mrYes then
//    begin
//      { cancel all running goto time }
//      r.GameCtrl := CORD_ID_gototime;
//      r.SessionID := simMgrClient.SessionID;
//      r.GotoTime := -1;
//
//      simMgrClient.netSend_CmdGameControl(r);
//    end;

  Close;
end;

procedure TfrmGotoTime.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  simMgrClient.OnUpdateGotoProgress := nil;
  Action := caFree;
  frmGotoTime := nil;
end;

procedure TfrmGotoTime.FormCreate(Sender: TObject);
var
  I : integer;
begin
  cbExactly.Items.Clear;
  for I := 0 to Length(C_GotoTimeInfo) - 1 do
    cbExactly.Items.Add(C_GotoTimeInfo[I]);

  cbExactly.ItemIndex := 0;
  FGotoState := False;

  simMgrClient.OnUpdateGotoProgress := UpdateProgress;
end;

procedure TfrmGotoTime.rbSpecificClick(Sender: TObject);
  function FmtNumber(val : integer) : string;
  var
    s : String;
  begin
    s := IntToStr(val);
    if Length(s) <= 1 then
      s := '0' + s;

    result := s;
  end;
var
  h,m,s,n : word;
  y,t,d : word;
begin
  DecodeTime(simMgrClient.GameTIME,h,m,s,n);
  DecodeDate(simMgrClient.GameTIME,y,t,d);

  { automatically 1 hour after }
  h := h + 1;
  if h > 24 then
    h := 1;

  edtTime.Text := FmtNumber(h) + ':' + FmtNumber(m) + ':' + FmtNumber(s);
  edtDate.Text := FmtNumber(d) + '/' + FmtNumber(t) + '/' + IntToStr(y);
end;

procedure TfrmGotoTime.tmGameTimeTimer(Sender: TObject);
var dt: TDateTime;
begin
  dt := simMgrClient.GameTIME;
  lblCurrentTime.Caption := DateToStr(simMgrClient.GameTIME)  + ' ' +  FormatDateTime('hh : nn : ss', dt);
end;

procedure TfrmGotoTime.UpdateProgress(const progressVal: integer);
begin
  if progressVal >= 100 then
  begin
    btnApply.Enabled := True;
    cbExactly.Enabled := True;
    edtDate.Enabled := True;
    edtTime.Enabled := True;

    lblInfo.Visible := False;

    Close;
  end;

  pgProgress.Position := progressVal;
end;

end.
