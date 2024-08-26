unit ufMainSessionSvr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, ExtCtrls, StdCtrls, OverbyteIcsWSocketS,
  OverbyteIcsWSocket, uBaseNetHandler, uNetSessionData;

type
  TfrmMainSessionSvr = class(TForm)
    pnlTOP: TPanel;
    pnlBottom: TPanel;
    sBar: TStatusBar;
    Panel4: TPanel;
    spbOnline: TSpeedButton;
    PageControl1: TPageControl;
    tsClients: TTabSheet;
    tsLogs: TTabSheet;
    lvConnection: TListView;
    pnlSession: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    mmLogs: TMemo;
    tsNetLog: TTabSheet;
    tvClientLogs: TTreeView;
    edScenarioID: TEdit;
    Label4: TLabel;
    edExerciseName: TEdit;
    lblSession: TLabel;
    procedure spbOnlineClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lvConnectionCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
  private
    { Private declarations }
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);

    function FindOnList(lv: TListView; const arg: string;
      const aSubIndex: integer): TListItem;

    procedure UpdateToConnectionList(const sIp: string;
      const aConnect: Boolean);

    procedure AddToLogs(const s: string);

    function FindClientNode(const ip: string): TTreeNode;

  public
    { Public declarations }
    procedure ApplySetting;

    procedure ServerChangeState(Sender: TObject;
                                 OldState, NewState : TSocketState);
    procedure ServerClientConnect(const sClientIp: string);
    procedure ServerClientDisConnect(const sClientIp: string);

    procedure SessionStateChange(const st: TSessionVar);
    procedure EventOnNetLog(const sClientIP, sInfo: string);
  end;

var
  frmMainSessionSvr: TfrmMainSessionSvr;
  MyMsg : Cardinal;

implementation

{$R *.dfm}

uses
  uNetBaseSocket, uNetSessionServer,  uLibSettingTTT;


procedure TfrmMainSessionSvr.AppMessage(var Msg: TMsg; var Handled: Boolean);
begin
  if Msg.Message = MyMsg then
  begin
     Application.Restore;
//     Show;
     SetForeGroundWindow(Application.MainForm.Handle);
     Handled := true;
  end;
end;

function TfrmMainSessionSvr.FindOnList(lv: TListView; const arg: string;
  const aSubIndex: integer): TListItem;
{  find text arg in ListView lv;
   if ASubIndex = -1 then compare arg to listview.Item[x].Caption
   else compare listview.Item[x].subItem[aSubIndex];
}

var i: Integer;
  f: Boolean;
  li: TListItem;
begin
  result := nil;
  li := nil;

  f := False;
  i := 0;
  while not f and (i < lv.Items.Count) do begin
    li := lv.Items.Item[i];
    if aSubIndex = -1 then
      f := SameText(li.Caption, arg)
    else begin
      if (aSubIndex < li.SubItems.Count) then
        f := SameText(li.SubItems[aSubIndex], arg)
      else
        f := False;
    end;

    Inc(i);
  end;

  if f then
    Result := li;
end;

procedure TfrmMainSessionSvr.UpdateToConnectionList(const sIp: string;
    const aConnect: Boolean);
const
  CSCon : array[Boolean] of string = ('DisConected', 'Connected');
var li: TListItem;
begin
  li := FindOnList(lvConnection, sIp, -1);
  if li = nil then begin
    li := lvConnection.Items.Add;
    li.Caption := sIp;
    li.SubItems.Add(CSCon[aConnect]);
    li.SubItems.Add(TimeStr);

  end
  else begin
    li.SubItems[0] := CSCon[aConnect];
    li.SubItems[1] := TimeStr;
  end;
  EventOnNetLog(sIP, CSCon[aConnect]);

//  AddToLogs(TimeStr +' : ' + sIp + ' is ' +  CSCon[aConnect]);
//  sBar.Panels[1].Text := IntToStr(theServer.FTCPServer.ClientCount) + ' clients';
end;

procedure TfrmMainSessionSvr.AddToLogs(const s: string);
begin
  mmLogs.Lines.Add(s);
end;

function TfrmMainSessionSvr.FindClientNode(const ip: string): TTreeNode;
var f: boolean;
    tvNode: TTreeNode;
begin
  tvNode := tvClientLogs.Items.GetFirstNode;

  f := false;

  while not f  and (tvNode <> nil)do begin

    f := tvNode.Text = ip;

    if not f then
      tvNode := tvNode.getNextSibling;
  end;
  if f then
    result := tvNode
  else
    result := nil;

end;

procedure TfrmMainSessionSvr.FormCreate(Sender: TObject);
begin
   Left := Monitor.Left + (Monitor.Width - Width) div 2;
   Top  := Monitor.Top;

   Application.OnMessage := AppMessage;
end;

procedure TfrmMainSessionSvr.lvConnectionCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
 Compare  := StrComp(PChar(item1.Caption), PChar(Item2.Caption));
end;

{procedure TfrmMainSessionSvr.ScenarioChange(const id: Integer);
begin
  AddToLogs('Scenario has been changed to ' + IntToStr(id));
  lblScenario.Caption := IntToStr(id);

end;
}

procedure TfrmMainSessionSvr.ApplySetting;
begin
  if vNetSetting.AutoStart then begin
    spbOnline.Down := true;
    spbOnlineClick(spbOnline);
  end;

end;

procedure TfrmMainSessionSvr.ServerChangeState(Sender: TObject; OldState,
  NewState: TSocketState);
var s: string;
  ws: TWSocketServer;
begin
  s := SockStateToString(NewState);
  ws := sender as TWSocketServer;
  if NewState = wsListening then begin

    s := s + ' @' + ws.Port;

  end;
  mmLogs.Lines.Add(TimeStr +' :  Server Status is ' + s );
  sBar.Panels[0].Text := s;
end;

procedure TfrmMainSessionSvr.ServerClientConnect(const sClientIp: string);
begin
  UpdateToConnectionList(sClientIp, True);

end;

procedure TfrmMainSessionSvr.ServerClientDisConnect(const sClientIp: string);
begin
  UpdateToConnectionList(sClientIp, False);
end;


procedure TfrmMainSessionSvr.spbOnlineClick(Sender: TObject);
var s: string;
    ss: TStrings;
begin
  ss := TStringList.Create;

  GetHostandIPList(s, ss);

  mmLogs.Lines.Add('Available IPAddress');
  mmLogs.Lines.Add(s);
  mmLogs.Lines.AddStrings(ss);

  if spbOnline.Down then begin
    theServer.StartNetworking;
    spbOnline.Caption := 'Offline';
  end
  else begin
    theServer.StopNetworking;
    spbOnline.Caption := 'Online';
  end;

  ss.Free;

end;

procedure TfrmMainSessionSvr.SessionStateChange(const st: TSessionVar);
begin
  case st.SessionType of
    ssEditing :begin

      if st.StateActive then
        AddToLogs('EdiT SceNari0 ON')
      else
        AddToLogs('EdiT SceNari0 OFF')
    end;

    ssPlaying:  begin

      if st.StateActive then begin
        AddToLogs('Game Play ON');
        lblSession.Caption := 'Session Started';
      end
      else begin
        AddToLogs('Game Play OFF');
        lblSession.Caption := 'Session Terminated';
      end;
      edScenarioID.Text := IntToStr(st.ScenarioID);
      edExerciseName.Text := st.ExerciseName;
    end;
  end;

end;

procedure TfrmMainSessionSvr.EventOnNetLog(const sClientIP, sInfo: string);
var tvNode: TTreeNode;
begin
  tvNode := FindClientNode(sClientIp);

  if tvNode = nil then begin
    tvNode := tvClientLogs.Items.Add(tvClientLogs.Items.GetFirstNode, sClientIP);
//    tvNode.Text := sClientIP;
  end;

  tvClientLogs.Items.AddChild(tvNode, sInfo);
end;

end.
