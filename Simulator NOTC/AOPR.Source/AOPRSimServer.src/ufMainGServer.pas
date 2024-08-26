unit ufMainGServer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, OleCtrls, MapXLib_TLB, ExtCtrls, ComCtrls, uT3Unit,
  U_Helper, uLibSettingTTT, uMapLayerDB, uT3Missile;

type

  TfMainGServer = class(TForm)
    Panel1: TPanel;
    Timer1: TTimer;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblGameState: TLabel;
    lblGameSpeed: TLabel;
    lblGameTime: TLabel;
    lblScenario: TLabel;
    spbStart: TSpeedButton;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Splitter1: TSplitter;
    Label5: TLabel;
    lblSession: TLabel;
    lblFrameReplay: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Memo1: TMemo;
    TabSheet2: TTabSheet;
    mmEvents: TMemo;
    Button2: TButton;
    TabSheet3: TTabSheet;
    mmInit: TMemo;
    Button1: TButton;
    TabSheet4: TTabSheet;
    mmEvent: TMemo;
    TabSheet5: TTabSheet;
    Panel3: TPanel;
    Button3: TButton;
    Button4: TButton;
    Timer2: TTimer;
    tsDatalink: TTabSheet;
    lblNCS: TLabel;
    lblDL1: TLabel;
    lblDL2: TLabel;
    lblDL3: TLabel;
    mmoDL3: TMemo;
    mmoDL2: TMemo;
    mmoDL1: TMemo;
    tsDataBuffer: TTabSheet;
    mmo1: TMemo;
    btn1: TBitBtn;
    btn2: TButton;
    btn3: TSpeedButton;
    lvPlatform: TListView;
    btn4: TSpeedButton;
    btnFlush: TSpeedButton;
    tsVersion: TTabSheet;
    lvVersion: TListView;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure spbStartClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnFlushClick(Sender: TObject);
    procedure lvVersionDrawItem(Sender: TCustomListView; Item: TListItem;
      Rect: TRect; State: TOwnerDrawState);
  private
    { Private declarations }
    FLastS : string;
    FWatchObj : TT3PlatformInstance;
    ActiveLogDataBuffer : Boolean;
    FLog : Boolean;
    FLogEvent : Boolean;
    FLogFile: TLogFile;
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
  public
    { Public declarations }
    procedure LogStr(const strHeader, strBody: string);
    procedure LogInitStr(const s: string);
    procedure LogEventStr(const strHeader, strBody: string);
    procedure LogRecv(const s: string);
    procedure DatalinkUpdate(Sender: TObject);

    procedure LogReplayGetFrame(const s: string);

    procedure updateGameInfo(const st: byte;
      const gSpeed: double);
    procedure UpdateViewSetting;
    procedure UpdateListObject;
    procedure UpdateEventBuffer;

    procedure OnUpdateVersion(const IP: string;
    ComputerName: string; Version : string; Match:string);

    property LogFile : TLogFile read FLogFile write FLogFile;

    procedure LogDataMissile(ts : TStringList);

  end;

var
  fMainGServer: TfMainGServer;
  MyMsg : Cardinal;

implementation

{$R *.dfm}

uses
  uSimMgr_server, uNetHandle_Server, uGameData_TTT,
  uTCPDatatype, uT3DataLink, uBaseCoordSystem, uT3Vehicle, tttData;

procedure TfMainGServer.AppMessage(var Msg: TMsg; var Handled: Boolean);
begin
  if Msg.Message = MyMsg then begin
     Application.Restore;
     SetForeGroundWindow(Application.MainForm.Handle);
     Handled := true;
  end;

end;

procedure TfMainGServer.btn1Click(Sender: TObject);
var r: TRecCmd_GameCtrl;
begin
    case Byte(simMgrServer.GameState) of
      0: ;
      1: begin
            if simMgrServer.GameSPEED >= 16.0 then
              simMgrServer.GameSPEED := 1.0
            else
              simMgrServer.GameSPEED := 2 * simMgrServer.GameSPEED;

            r.GameCtrl  := CORD_ID_game_speed;
            r.GameSpeed := simMgrServer.GameSPEED;
            r.SessionID := simMgrServer.SessionID;

            VNetServer.SendBroadcast_UDP_Data(CPID_CMD_GAME_CTRL , @r);
         end;
    end;
end;

procedure TfMainGServer.btn2Click(Sender: TObject);
begin
  ActiveLogDataBuffer := not ActiveLogDataBuffer;
end;

procedure TfMainGServer.btn3Click(Sender: TObject);
begin
 // simMgrServer.CreateThread;
 if (sender as TSpeedButton).Down then
  FLog := True
 else
  FLog := False
end;

procedure TfMainGServer.btn4Click(Sender: TObject);
begin
  if (sender as TSpeedButton).Down then
    FLogEvent := True
  else
    FLogEvent := False
end;

procedure TfMainGServer.btnFlushClick(Sender: TObject);
begin
  simMgrServer.ClearBuffer;
end;



procedure TfMainGServer.Button1Click(Sender: TObject);
begin
  UpdateListObject;
end;

procedure TfMainGServer.Button2Click(Sender: TObject);
begin
  UpdateEventBuffer;
end;

procedure TfMainGServer.Button3Click(Sender: TObject);
var
  li : TListItem;
  I : Integer;
  pi : TT3PlatformInstance;
  d1,d2 : Double;
  r : TRec_MapData;
begin
  lvPlatform.Items.Clear;

  for I := 0 to simMgrServer.SimPlatforms.itemCount do
  begin
    pi := TT3PlatformInstance(simMgrServer.SimPlatforms.getObject(I));
    if pi is TT3Vehicle then
    begin
      li := lvPlatform.Items.Add;
      li.Caption := IntToStr(pi.InstanceIndex);
      li.SubItems.Add(pi.InstanceName);
      li.SubItems.Add(formatDMS_long(Pi.getPositionX));
      li.SubItems.Add(formatDMS_latt(Pi.getPositionY));
      li.SubItems.Add(FormatSpeed(pi.GroundSpeed));
      li.SubItems.Add(FormatFloat('0.00', TT3Vehicle(pi).OrderedSpeed));
      li.SubItems.Add(FormatSpeed(TT3Vehicle(pi).Course));
      li.SubItems.Add(FormatSpeed(TT3Vehicle(pi).OrderedHeading));
      li.SubItems.Add(FormatSpeed(TT3Vehicle(pi).VehicleDefinition.FData.Draft * C_Feet_To_Meter));
      r.IsOnLand := DepthLayerDB.GetMapLand(pi.getPositionX, pi.getPositionY, d1, d2);

      if r.IsOnLand then
      begin
        r.PlatformID := pi.InstanceIndex;
        r.dMin := d1;
        r.dMax := d2;
        r.OrderID := CORD_MAPS_DEPTH;
        r.SessionID := simMgrServer.SessionID;
      end
      else
      begin
        try
          r.dAvail := DepthLayerDB.GetMapDepth(pi.getPositionX, pi.getPositionY, d1, d2);
        except
          r.dAvail := True;
        end;

        if r.dAvail then
        begin
          r.dMin := d1;
          r.dMax := d2;
        end
        else
        begin
          r.dMin := 0;
          r.dMin := 0;
        end;

        r.PlatformID := pi.InstanceIndex;
        r.OrderID := CORD_MAPS_DEPTH;
        r.SessionID := simMgrServer.SessionID;
      end;

      //simMgrServer.netRecvMapCmd(@r, SizeOf(trec_mapdata));

      li.SubItems.Add(FormatSpeed(d2));

      if TT3Vehicle(pi).OnLand then
        li.SubItems.Add('On Land')
      else
        li.SubItems.Add('On Sea');

      if TT3Vehicle(pi).OnGrounded then
        li.SubItems.Add('On Grounded')
      else
        li.SubItems.Add('On Sea');

      if TT3Vehicle(pi).isOnPort then
        li.SubItems.Add('On Port')
      else
        li.SubItems.Add('On Sea/On Land');

      if TT3Vehicle(pi).isCollision then
      begin
        if Assigned(TT3Vehicle(pi).TrackCollision) then
          li.SubItems.Add('Collision with ' + TT3PlatformInstance(TT3Vehicle(pi).TrackCollision).InstanceName)
      end
      else
        li.SubItems.Add('False');

      li.Data := pi;
    end;
  end;
  Timer2.Enabled := true;
end;

procedure TfMainGServer.DatalinkUpdate(Sender: TObject);
var
  dl : TT3DataLink;
  mmo : TMemo;
  i : integer;
  item : TT3DLNCSTrackEntityItem;
begin
  if Sender is TT3DataLink then
  begin
    dl := Sender as TT3DataLink;

    mmo := nil;
    case dl.IDLink of
      1 : mmo := mmoDL1;
      2 : mmo := mmoDL2;
      3 : mmo := mmoDL3;
    end;

    if Assigned(mmo) then
    begin
      mmo.Lines.Clear;

      for I := 0 to dl.getNCSEntitiesCount - 1 do
      begin
        item := dl.getNCSEntity(i);
        mmo.Lines.Add(IntToStr(item.NEIOwnerID) + ' : ' + IntToStr(item.NEITrackID));
      end;
    end;
  end;
end;

procedure TfMainGServer.Button4Click(Sender: TObject);
begin
  Timer2.Enabled := false;
end;

procedure TfMainGServer.ComboBox1Change(Sender: TObject);
var
  obj : TObject;
begin
  Timer2.Enabled := false;
//  obj := ComboBox1.Items.Objects[ComboBox1.ItemIndex];
  if Assigned(obj) then
    FWatchObj := TT3PlatformInstance(obj);
end;

procedure TfMainGServer.ComboBox1DropDown(Sender: TObject);
var
  i : integer;
begin
//  ComboBox1.Clear;
//  for i := 0 to simMgrServer.SimPlatforms.itemCount - 1 do begin
//    ComboBox1.AddItem(TT3PlatformInstance(simMgrServer.SimPlatforms.getObject(i)).InstanceName,
//                      simMgrServer.SimPlatforms.getObject(i));
//  end;
end;

procedure TfMainGServer.FormCreate(Sender: TObject);
begin
   Application.OnMessage := AppMessage;
   lblFrameReplay.Visible := False;
   ActiveLogDataBuffer := False;
   FLogFile := TLogFile.Create;
   FLogFile.IsLog := True;

   FLog := True;
   btn3.Down := True;

   FLogEvent := False;
   btn4.Down := False;
   fMainGServer.Caption := 'Game Server';
   Timer2.Enabled := False;
end;

procedure TfMainGServer.FormDestroy(Sender: TObject);
begin
  if Assigned(FLogFile) then FLogFile.Free;
end;

procedure TfMainGServer.LogStr(const strHeader, strBody: string);
//var i: integer;
var
  str : string;
  dt : TDateTime;
begin
  if FLog then
  begin
    dt := simMgrServer.GameTIME;
    str := '<'+FormatDateTime('dd mmm yyyy hh:nn:ss',dt)+ '> ['+strHeader+'] '+strBody;

    if Assigned(FLogFile) then
    begin
      FLogFile.Log(strHeader, '-------------------------------------------------');
      FLogFile.Log(strHeader, str);
    end;

    if vGameDataSetting.LogData = True then
    begin

      if strBody <> FLastS then
  //      Memo1.Lines.Insert(0, strBody)
        Memo1.Lines.Insert(0, str)
      else
        Memo1.Lines[0] := Memo1.Lines[0] + '*';
    end;

    FLastS := strBody;
//  FLastS := str;
  end;
end;

procedure TfMainGServer.lvVersionDrawItem(Sender: TCustomListView;
  Item: TListItem; Rect: TRect; State: TOwnerDrawState);
var
  i: Integer;
  x1, x2: integer;
  r: TRect;
  S: string;
const
  DT_ALIGN: array[TAlignment] of integer = (DT_LEFT, DT_RIGHT, DT_CENTER);
begin
  if Item.SubItems[2] = 'Not Match' then
  begin
    Sender.Canvas.Font.Color := clBlack;
//    Sender.Canvas.Brush.Color := $F6F6F6;
    Sender.Canvas.Brush.Color := clRed;
  end
  else
  begin
    Sender.Canvas.Font.Color := clBlack;
    Sender.Canvas.Brush.Color := clWhite;
  end;
  Sender.Canvas.Brush.Style := bsSolid;
  Sender.Canvas.FillRect(Rect);
  x1 := 0;
  x2 := 0;
  r := Rect;
  Sender.Canvas.Brush.Style := bsClear;
  for i := 0 to lvVersion.Columns.Count - 1 do
  begin
    inc(x2, lvVersion.Columns[i].Width);
    r.Left := x1;
    r.Right := x2;
    if i = 0 then
      S := Item.Caption
    else
      S := Item.SubItems[i - 1];
    DrawText(Sender.Canvas.Handle,
      S,
      length(S),
      r,
      DT_SINGLELINE or DT_ALIGN[lvVersion.Columns[i].Alignment] or
        DT_VCENTER or DT_END_ELLIPSIS);
    x1 := x2;
  end;
end;

procedure TfMainGServer.Panel1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case Button of
    mbLeft: begin
        if (ssShift in Shift) then begin
          spbStart.Visible := not spbStart.Visible ;
          btn1.Visible     := not btn1.Visible;
          btn3.Visible     := not btn3.Visible;
          btnFlush.Visible := not btnFlush.Visible;
        end;
      end;
  end;
end;

procedure TfMainGServer.LogDataMissile(ts: TStringList);
var
  v : TT3Vehicle;
  i : Integer;
  str: string;
begin
//  lv1.Clear;
//
//  for i := 0 to ts.Count - 1 do
//  begin
//    v := TT3Vehicle(ts.Objects[i]);
//    str := 'Vehicle Name = ' + v.InstanceName + ' ; ' + ts[i];
//    mmoMissile.Lines.Add(str);
//  end;
end;

procedure TfMainGServer.LogEventStr(const strHeader, strBody: string);
var
  gt, str : string;
  dt : TDateTime;
begin
  dt := simMgrServer.GameTIME;
  gt := FormatDateTime('hh : nn : ss', dt) + ' : ' + strBody;
  str := '<'+FormatDateTime('dd mmm yyyy hh:nn:ss',dt)+ '> ['+strHeader+'] '+strBody;

  if Assigned(FLogFile) then
    FLogFile.Log(strHeader, str);

  if vGameDataSetting.LogData = True then
  begin
    if mmEvent.Lines.Count > 100 then
      mmEvent.Lines.Clear;

    mmEvent.Lines.Insert(0, str);
  end;
end;

procedure TfMainGServer.LogInitStr(const s: string);
begin
  if FLog then
    mmInit.Lines.Insert(0, s);
end;

procedure TfMainGServer.LogRecv(const s: string);
begin
  if ActiveLogDataBuffer then
  begin
    if mmo1.Lines.Count > 250 then
      mmo1.Clear;

    mmo1.Lines.Insert(0,s);
  end;
end;

procedure TfMainGServer.LogReplayGetFrame(const s: string);
begin
  if not lblFrameReplay.Visible then lblFrameReplay.Visible := true ;
  lblFrameReplay.Caption := s ;
  if s = 'ENDREPLAY' then lblFrameReplay.Visible := False;
end;

procedure TfMainGServer.spbStartClick(Sender: TObject);
var r: TRecCmd_GameCtrl;
begin
  if (sender as TSpeedButton).Down then begin
    simMgrServer.GameSPEED := 1.0;
    simMgrServer.GameStart;
    r.GameCtrl  := CORD_ID_start;
    r.GameSpeed := 1.0;
    r.SessionID := simMgrServer.SessionID;

    VNetServer.SendBroadcast_UDP_Data(CPID_CMD_GAME_CTRL , @r);

    VNetServer.StartListen;

  end
  else begin
    simMgrServer.GameSPEED := 0.0;
    simMgrServer.GamePause;

    r.GameCtrl  := CORD_ID_pause;
    r.GameSpeed := 0.0;

  end;
  r.SessionID := simMgrServer.SessionID;

  VNetServer.SendBroadcast_UDP_Data(CPID_CMD_GAME_CTRL , @r);
end;

procedure TfMainGServer.Timer1Timer(Sender: TObject);
var dt: TDateTime;
begin
  dt := simMgrServer.GameTIME;
  lblGameTime.Caption := FormatDateTime('hh : nn : ss', dt);
  //UpdateListObject;
end;

procedure TfMainGServer.OnUpdateVersion(const IP: string; ComputerName, Version,
  Match: string);
var
  li : TListItem;
  i : Integer;
begin
  if lvVersion.Items.Count > 0 then
  begin
    for i:= 0 to lvVersion.Items.Count-1 do
    begin
      li := lvVersion.FindCaption(0, IP, True, True, True);
      if Assigned(li) then
      begin
        li.SubItems[1] := Version;
        li.SubItems[2] := Match;
      end
      else
      begin
        li := lvVersion.Items.Add;
        li.Caption := IP;
        li.SubItems.Add(ComputerName);
        li.SubItems.Add(Version);
        li.SubItems.Add(Match);
      end;
    end;
  end
  else
  begin
    li := lvVersion.Items.Add;
    li.Caption := IP;
    li.SubItems.Add(ComputerName);
    li.SubItems.Add(Version);
    li.SubItems.Add(Match);
  end;
end;

procedure TfMainGServer.Timer2Timer(Sender: TObject);
var
  gt,co : string;
  i : Integer;
  li : TListItem;
  v : TT3Vehicle;
  pi : TT3PlatformInstance;
  d1,d2 : Double;
  r : TRec_MapData;
begin
  gt := FormatDateTime('hh : nn : ss', simMgrServer.GameTIME);

  try
    for I := 0 to simMgrServer.SimPlatforms.itemCount do
    begin
      pi := TT3PlatformInstance(simMgrServer.SimPlatforms.getObject(I));
      if pi is TT3Vehicle then
      begin
        li := lvPlatform.FindData(0, pi, True, True);
        if Assigned(li) then
        begin
          v := TT3Vehicle(li.Data);
          li.SubItems[1] := formatDMS_long(v.getPositionX);
          li.SubItems[2] := formatDMS_latt(v.getPositionY);
          li.SubItems[3] := FormatSpeed(v.GroundSpeed);
          li.SubItems[4] := FormatFloat('0.00', v.OrderedSpeed);
          li.SubItems[5] := FormatSpeed(v.Course);
          li.SubItems[6] := FormatSpeed(v.OrderedHeading);
          li.SubItems[7] := FormatSpeed(TT3Vehicle(pi).VehicleDefinition.FData.Draft * C_Feet_To_Meter);

          //if v.PlatformDomain <> vhdSubsurface then
            r.IsOnLand := DepthLayerDB.GetMapLand(pi.getPositionX, pi.getPositionY, d1, d2);

          if r.IsOnLand then
          begin
            r.dMin := d1;
            r.dMax := d2;
          end
          else
          begin
            try
              r.dAvail := DepthLayerDB.GetMapDepth(pi.getPositionX, pi.getPositionY, d1, d2);
            except
              r.dAvail := True;
            end;

            if r.dAvail then
            begin
              r.dMin := d1;
              r.dMax := d2;
            end
            else
            begin
              r.dMin := 0;
              r.dMin := 0;
            end;
          end;

          r.PlatformID := pi.InstanceIndex;
          r.SessionID := simMgrServer.SessionID;
          r.OrderID := CORD_MAPS_DEPTH;
          //simMgrServer.netRecvMapCmd(@r, SizeOf(trec_mapdata));

          li.SubItems[8] := FormatSpeed(d2);

          if TT3Vehicle(pi).OnLand then
            li.SubItems[9] := 'On Land'
          else
            li.SubItems[9] := 'On Sea';

          if TT3Vehicle(pi).OnGrounded then
            li.SubItems[10] := 'On Grounded'
          else
            li.SubItems[10] := 'On Sea';

          if TT3Vehicle(pi).isCollision then
          begin
            if Assigned(v.TrackCollision) then
              li.SubItems[11] := 'Collision with ' + TT3PlatformInstance(v.TrackCollision).InstanceName
          end
          else
            li.SubItems[11] := 'False';

          if TT3Vehicle(pi).isOnPort then
            li.SubItems[12] := 'On Port'
          else
            li.SubItems[12] := 'On Sea/On Land';
        end
        else
        begin
          li := lvPlatform.Items.Add;
          li.Caption := IntToStr(pi.InstanceIndex);
          li.SubItems.Add(pi.InstanceName);
          li.SubItems.Add(formatDMS_long(Pi.getPositionX));
          li.SubItems.Add(formatDMS_latt(Pi.getPositionY));
          li.SubItems.Add(FormatSpeed(pi.GroundSpeed));
          li.SubItems.Add(FormatFloat('0.00', TT3Vehicle(pi).OrderedSpeed));
          li.SubItems.Add(FormatSpeed(TT3Vehicle(pi).Course));
          li.SubItems.Add(FormatSpeed(TT3Vehicle(pi).OrderedHeading));
          li.SubItems.Add(FormatSpeed(TT3Vehicle(pi).VehicleDefinition.FData.Draft * C_Feet_To_Meter));
          //DepthLayerDB.GetMapDepth(pi.getPositionX, pi.getPositionY, d1, d2);

          r.PlatformID := pi.InstanceIndex;
          r.dMin := d1;
          r.dMax := d2;
          r.OrderID := CORD_MAPS_DEPTH;
          r.SessionID := simMgrServer.SessionID;

          //simMgrServer.netRecvMapCmd(@r, SizeOf(trec_mapdata));

          li.SubItems.Add(FormatSpeed(d2));

          if TT3Vehicle(pi).OnLand then
            li.SubItems.Add('On Land')
          else
            li.SubItems.Add('On Sea');

          if TT3Vehicle(pi).OnGrounded then
            li.SubItems.Add('On Grounded')
          else
            li.SubItems.Add('On Sea');

          if TT3Vehicle(pi).isOnPort then
            li.SubItems.Add('On Port')
          else
            li.SubItems.Add('On Sea/On Land');

          if TT3Vehicle(pi).isCollision then
          begin
            if Assigned(TT3Vehicle(pi).TrackCollision) then
              li.SubItems.Add('Collision with ' + TT3PlatformInstance(TT3Vehicle(pi).TrackCollision).InstanceName)
          end
          else
            li.SubItems.Add('False');

          li.Data := pi;
        end;
      end;
    end;
  except
    Timer2.Enabled := false;
  end;
end;

procedure TfMainGServer.UpdateEventBuffer;
  function  formatTrail(Value : integer) : string;
  var
    I : integer;
    si,t : string;
  begin
    t := IntToStr(Value);
    si := '';
    for I := 0 to (4 - Length(t)) - 1 do
      si := si +'0';
    result := si + t;
  end;
var
  i, id : integer;
  pid: ^TPacketID;
  pBuff : PAnsiChar;
  pSize : word;
begin
  mmEvents.Clear;

  for i := 0 to VNetServer.PacketBuffer.BuffCount - 1 do begin
    if VNetServer.PacketBuffer.PeekPacket(i, pBuff, pSize) then
    begin
      pid := @pBuff^;
      id := pid^.recID;

      if (id = 31) or (id = 32) then
        continue;

      if FLogEvent then
        mmEvents.Lines.Add('<' + formatTrail(id) + '> ' + getPacketIDname(id));
    end;
  end;

end;

procedure TfMainGServer.updateGameInfo(const st: byte;
      const gSpeed: double);
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

procedure TfMainGServer.UpdateListObject;
var
  i : integer;
  aObj : TT3PlatformInstance;
begin
  mmInit.Clear;
  for i := 0 to simMgrServer.SimPlatforms.itemCount - 1 do begin
    aObj := TT3PlatformInstance(simMgrServer.SimPlatforms.getObject(i));

    mmInit.Lines.Add(IntToStr(aObj.InstanceIndex) + ' : ' + aObj.InstanceName);
  end;

end;

procedure TfMainGServer.UpdateViewSetting;
begin
  lblScenario.Caption :=
  IntToStr(simMgrServer.Scenario.ScenarioDefinition.FData.Scenario_Index )
  + ' : ' +simMgrServer.Scenario.ScenarioName;

  lblSession.Caption :=
  IntToStr(simMgrServer.SessionID );
end;

end.
