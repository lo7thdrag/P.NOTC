unit ufLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uT3Unit, uT3UnitContainer, uBaseCoordSystem, ComCtrls,
  ExtCtrls, uT3DetectedTrack, VrControls, VrButtons, VrBlinkLed,U_Helper ;

type
  TfrmLog = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    lbPlatform: TListBox;
    Button1: TButton;
    TabSheet3: TTabSheet;
    Memo2: TMemo;
    TabSheet4: TTabSheet;
    Panel1: TPanel;
    Button2: TButton;
    Button3: TButton;
    Timer1: TTimer;
    Timer2: TTimer;
    Button4: TButton;
    tsDatalink: TTabSheet;
    lblNCS: TLabel;
    lblDL1: TLabel;
    lblDL2: TLabel;
    lblDL3: TLabel;
    mmoDL1: TMemo;
    mmoDL2: TMemo;
    mmoDL3: TMemo;
    tsDataBuffer: TTabSheet;
    mmo1: TMemo;
    btn1: TButton;
    vrblnkld1: TVrBlinkLed;
    lvPlatform: TListView;
    tsStatusPlatform: TTabSheet;
    lvStatusPlatform: TListView;
    pnl1: TPanel;
    btnStart: TButton;
    btnStop: TButton;
    tmrStatePlatform: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure cbDatalinkChange(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure tmrStatePlatformTimer(Sender: TObject);
  private
    FWatchObj : TT3PlatformInstance;
    FStr : TStrings;
    ActiveLogTemporary : Boolean;
    FLogFile: TLogFile;
    { Private declarations }
  public
    { Public declarations }
    procedure LogNetworkEvent(const Value: String);
    procedure LogStr(const strHeader, strBody: string);
    procedure NetworkEventLogs(const strHeader, strBody : string);
    procedure ListWeapon(pfs : TT3UnitContainer);
    procedure LogDataBuffer(const s : string);
    procedure DatalinkUpdate(Sender : TObject);
    procedure LogTemporary(const s : string);
    procedure FinishBuffer(const b : Boolean);
    procedure AddedToLogFile(strHeader, strBody: string);
    procedure InsertEmptyLine;

    property LogFile : TLogFile read FLogFile write FLogFile;
  end;

var
  frmLog: TfrmLog;

implementation

uses
  uSimMgr_Client, uT3DataLink, uT3Vehicle;

{$R *.dfm}
procedure TfrmLog.AddedToLogFile(strHeader, strBody: string);
var
  str : string;
begin
  str := '<'+FormatDateTime('dd mmm yyyy hh:nn:ss',Now)+ '> ['+strHeader+'] '+strBody;

  if Assigned(FLogFile) then
    FLogFile.Log(strHeader, strBody);
end;

procedure TfrmLog.InsertEmptyLine;
begin
  if Assigned(FLogFile) then
    FLogFile.InsertEmptyLine;
end;

procedure TfrmLog.btn1Click(Sender: TObject);
begin
  ActiveLogTemporary := not ActiveLogTemporary;
end;

procedure TfrmLog.btnStartClick(Sender: TObject);
var
  li : TListItem;
  I : Integer;
  pi : TT3PlatformInstance;
begin
  lvStatusPlatform.Items.Clear;

  for I := 0 to simMgrClient.SimPlatforms.itemCount do
  begin
    pi := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(I));
    if pi is TT3Vehicle then
    begin
      li := lvStatusPlatform.Items.Add;
      li.Caption := IntToStr(pi.InstanceIndex);
      li.SubItems.Add(pi.InstanceName);

      if TT3Vehicle(pi).Vehicle_Control.Controlled then
         li.SubItems.Add('Controlled True')
      else
        li.SubItems.Add('Controlled False');

      if TT3Vehicle(pi).Vehicle_Control.Control_Name <> '' then
        li.SubItems.Add(TT3Vehicle(pi).Vehicle_Control.Control_Name)
      else
        li.SubItems.Add('None');

      li.Data := pi;
    end;
  end;
  tmrStatePlatform.Enabled := true;
end;

procedure TfrmLog.btnStopClick(Sender: TObject);
begin
  tmrStatePlatform.Enabled := False;
end;

procedure TfrmLog.Button1Click(Sender: TObject);
var
  i : integer;
  str : string;
begin
  lbPlatform.Clear;

  if Assigned(simMgrClient) then

  for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do begin
    str := FormatFloat('##.##',simMgrClient.SimPlatforms.getObject(i).getPositionX);
    str := '(' + str + ',' + FormatFloat('##.##',simMgrClient.SimPlatforms.getObject(i).getPositionY);
    str := str + '), alt : ' + FormatAltitude(TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i)).Altitude);
    str := str + ' m';

    lbPlatform.Items.Add(TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i)).InstanceName + str);
  end;

end;

procedure TfrmLog.Button2Click(Sender: TObject);
var
  li : TListItem;
  I : Integer;
  pi : TT3PlatformInstance;
begin
  lvPlatform.Items.Clear;

  for I := 0 to simMgrClient.SimPlatforms.itemCount do
  begin
    pi := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(I));
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
      li.Data := pi;
    end;
  end;
  Timer1.Enabled := true;
end;

procedure TfrmLog.Button3Click(Sender: TObject);
begin
  Timer1.Enabled := false;

end;

procedure TfrmLog.LogDataBuffer(const s: string);
begin
  if ActiveLogTemporary  then
  begin
    if mmo1.Lines.Count > 250 then
    begin
      mmo1.Clear;
    end;

    mmo1.Lines.Insert(0,s)
  end;
end;

procedure TfrmLog.LogNetworkEvent(const Value: String);
begin
  //Memo2.Lines.Add(Value);
end;

procedure TfrmLog.Button4Click(Sender: TObject);
begin
//  Memo2.Clear;
//  if assigned(FStr) then
//    Memo2.Lines.AddStrings(FStr);
//  FStr.Clear;
end;

procedure TfrmLog.cbDatalinkChange(Sender: TObject);
//var
//  i,j : integer;
//  vObject,vSnsr : TObject;
//  vItem    : TT3DLParticipatingUnitItem;
//  vPf      : TT3PlatformInstance;
//  sSensorL : string;
//  datalink : TT3DataLink;
begin
//  mmParticipant.Clear;
//
//  datalink := simMgrClient.DataLinkManager.getDatalink(TComboBox(Sender).ItemIndex + 1);
//
//  if Assigned(datalink) then
//  begin
//    for i:=0 to datalink.ParticipatingUnits.Count - 1 do begin
//      vItem := datalink.ParticipatingUnits.Items[i];
//      mmParticipant.Lines.Add(vItem.PUPlatform.InstanceName);
//    end;
//  end;
//
//  mmDetectedTrack.Lines.Clear;
//  for i:=0 to simMgrClient.SimDetectedTrackList.itemCount - 1 do begin
//    vObject := simMgrClient.SimDetectedTrackList.getObject(i);
//    if Assigned(TT3DetectedTrack(vObject).TrackObject) then begin
//      vPf := TT3DetectedTrack(vObject).TrackObject as TT3PlatformInstance;
//
//      sSensorL := '';
//      for j := 0 to TT3DetectedTrack(vObject).TrackDetectedBy.Count - 1 do begin
//        vSnsr := TT3DetectedTrack(vObject).TrackDetectedBy.Items[j];
//        sSensorL := sSensorL + vSnsr.ClassName;
//        sSensorL := sSensorL + ',';
//      end;
//
//      sSensorL := '(' + sSensorL + ')';
//      sSensorL := vPf.InstanceName + sSensorL;
//
//      mmDetectedTrack.Lines.Add(sSensorL);
//    end;
//  end;

end;

procedure TfrmLog.ComboBox1Change(Sender: TObject);
var
  obj : TObject;
begin
  //Timer1.Enabled := false;
//  obj := ComboBox1.Items.Objects[ComboBox1.ItemIndex];
//  if Assigned(obj) then
//    FWatchObj := TT3PlatformInstance(obj);
end;

procedure TfrmLog.ComboBox1DropDown(Sender: TObject);
var
  i : integer;
begin
//  ComboBox1.Clear;
//  for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do begin
//    ComboBox1.AddItem(TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i)).InstanceName,
//                      simMgrClient.SimPlatforms.getObject(i));
//  end;
end;

procedure TfrmLog.DatalinkUpdate(Sender: TObject);
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

procedure TfrmLog.FinishBuffer(const b: Boolean);
begin
  if b then
  begin
    //ketika databuffer sudah normal
    vrblnkld1.Palette1.High := clLime;
    vrblnkld1.Palette1.Low := clLime;
  end
  else
  begin
    //ketika databuffer masih melakukan buffer
    vrblnkld1.Palette1.High := clRed;
    vrblnkld1.Palette1.Low := clRed;
  end;
end;

procedure TfrmLog.FormCreate(Sender: TObject);
begin
  //Hide;
  Show;
  FStr := TStringList.Create;
  ActiveLogTemporary := False;
  WindowState := wsMinimized;
  Timer1.Enabled := False;

  FLogFile := TLogFile.Create;
  FLogFile.IsLog := True;

  {$IfDef CLIENT}
  Memo1.Lines.Insert(0, 'CLient Mode');
  {$EndIf}
end;

procedure TfrmLog.FormDestroy(Sender: TObject);
begin
  if Assigned(FLogFile) then FLogFile.Free;
end;

procedure TfrmLog.ListWeapon(pfs: TT3UnitContainer);
begin
//
end;

procedure TfrmLog.LogStr(const strHeader, strBody: string);
var
  gt, str : string;
  dt : TDateTime;
begin
  dt := simMgrClient.GameTIME;
  //gt := FormatDateTime('hh : nn : ss', dt) + ' : ' + strBody;

  str := '<'+FormatDateTime('dd mmm yyyy hh:nn:ss',dt)+ '> ['+strHeader+'] '+strBody;

  try
    Memo1.Lines.Insert(0, str);
    FLogFile.Log(strHeader, str);
  finally

  end;
end;

procedure TfrmLog.LogTemporary(const s: string);
var
  gt : string;
  dt : TDateTime;
begin
  dt := simMgrClient.GameTIME;
  gt := FormatDateTime('hh : nn : ss', dt) + ' : ' + s;

  if Memo2.Lines.Count > 250 then
  begin
    Memo2.Clear;
  end;

  Memo2.Lines.Insert(0,gt)
end;

procedure TfrmLog.NetworkEventLogs(const strHeader, strBody: string);
var
  gt, str : string;
  dt : TDateTime;
begin
  dt := simMgrClient.GameTIME;
  //gt := FormatDateTime('hh : nn : ss', dt) + ' : ' + strBody;

  str := '<'+FormatDateTime('dd mmm yyyy hh:nn:ss',dt)+ '> ['+strHeader+'] '+strBody;

  try
    if Memo2.Lines.Count > 100 then
      Memo2.Lines.Clear;

    Memo2.Lines.Insert(0, str);
    FLogFile.Log(strHeader, str);
  finally

  end;
end;

procedure TfrmLog.Timer1Timer(Sender: TObject);
var
  gt,co : string;
  i : Integer;
  li : TListItem;
  v : TT3Vehicle;
  pi : TT3PlatformInstance;
begin
  gt := FormatDateTime('hh : nn : ss', simMgrClient.GameTIME);

  try
    for I := 0 to simMgrClient.SimPlatforms.itemCount do
    begin
      pi := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(I));
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
          li.Data := pi;
        end;
      end;
    end;
  except
    Timer1.Enabled := false;
  end
end;

procedure TfrmLog.Timer2Timer(Sender: TObject);
begin
  {Memo2.Clear;
  if assigned(FStr) then
    Memo2.Lines.AddStrings(FStr);
  FStr.Clear;}
end;

procedure TfrmLog.tmrStatePlatformTimer(Sender: TObject);
var
  li : TListItem;
  I : Integer;
  pi : TT3PlatformInstance;
begin
  for I := 0 to simMgrClient.SimPlatforms.itemCount do
  begin
    pi := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(I));
    if pi is TT3Vehicle then
    begin
      li := lvStatusPlatform.FindData(0, pi, True, True);
      if Assigned(li) then
      begin


        if TT3Vehicle(pi).Vehicle_Control.Control_Name <> '' then
          li.SubItems[2] := TT3Vehicle(pi).Vehicle_Control.Control_Name
        else
          li.SubItems[2] := 'None';

        if TT3Vehicle(pi).Vehicle_Control.Controlled then
           li.SubItems[1] := 'Controlled True'
        else
        begin
          li.SubItems[1] := 'Controlled False';
          li.SubItems[2] := 'None';
        end;
      end
      else
      begin
        li := lvStatusPlatform.Items.Add;
        li.Caption := IntToStr(pi.InstanceIndex);
        li.SubItems.Add(pi.InstanceName);

        if TT3Vehicle(pi).Vehicle_Control.Controlled then
           li.SubItems.Add('Controlled True')
        else
          li.SubItems.Add('Controlled False');

        if TT3Vehicle(pi).Vehicle_Control.Control_Name <> '' then
          li.SubItems.Add(TT3Vehicle(pi).Vehicle_Control.Control_Name)
        else
          li.SubItems.Add('None');

        li.Data := pi;
      end;
    end;
  end;
end;

end.
