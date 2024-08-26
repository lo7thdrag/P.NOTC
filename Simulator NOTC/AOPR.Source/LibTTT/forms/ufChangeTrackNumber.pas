unit ufChangeTrackNumber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ImgList, StdCtrls, Menus, System.ImageList;

type
  TfrmChangeTrackNumber = class(TForm)
    Label1: TLabel;
    lbTrackNumber: TLabel;
    Label3: TLabel;
    edtNewTrackNumber: TEdit;
    Button1: TButton;
    ImageList1: TImageList;
    Bevel1: TBevel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    pmNumber: TPopupMenu;

    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Data : TObject;
    procedure setPopTrackNumber(newNumber : Integer);
    procedure setEditNewTrackNumberByPop(sender : TObject);
    procedure ChangeTrackNumber(const value : Integer);
    procedure ChangeNRPTrackNumber(const value : Integer);
    procedure ChangeESMNumber(const value : String);
  end;
 //form tambahan tini
var
  frmChangeTrackNumber: TfrmChangeTrackNumber;

implementation

uses uT3Unit, uT3DetectedTrack, uSimMgr_Client,
  uDBCubicles, uGameData_TTT, uT3Vehicle;

{$R *.dfm}
procedure TfrmChangeTrackNumber.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmChangeTrackNumber.btnOKClick(Sender: TObject);
//var
//  tNum : integer;
begin
  //TT3DetectedTrack(Data).TrackNumber := StrToInt(edtNewTrackNumber.Text);
  if Data is TT3DetectedTrack then
    ChangeTrackNumber(StrToInt(edtNewTrackNumber.Text))
  else if Data is TT3ESMTrack then
  begin
    ChangeESMNumber(edtNewTrackNumber.Text);
  end
  else if Data is TT3NonRealVehicle then
  begin
    ChangeNRPTrackNumber(StrToInt(edtNewTrackNumber.Text));
  end;

  Close;
end;

procedure TfrmChangeTrackNumber.Button1Click(Sender: TObject);
var
  pos : TPoint;
begin
  GetCursorPos(pos);
  pmNumber.Popup(pos.X, pos.Y);
end;

procedure TfrmChangeTrackNumber.FormCreate(Sender: TObject);
begin
  Data := TObject.Create;
end;

procedure TfrmChangeTrackNumber.FormShow(Sender: TObject);
var
  //grp : T3CubicleGroup;
  number : Integer;
begin
  if not Assigned(Data) then
    Exit;

  if Data is TT3DetectedTrack then
  begin
    lbTrackNumber.Caption := IntToStr(TT3DetectedTrack(Data).TrackNumber);
    Button1.Enabled := true;
    //temukan grupnya dulu
    //grp := simMgrClient.FMyCubGroup;

    number := simMgrClient.GetBiggestTrackNumber;
    edtNewTrackNumber.Text := IntToStr(TT3DetectedTrack(Data).TrackNumber);
    setPopTrackNumber(number);
  end
  else if Data is TT3ESMTrack then
  begin
    lbTrackNumber.Caption := TT3ESMTrack(Data).TrackNumber;
    Button1.Enabled := false;
  end
  else if data is TT3NonRealVehicle then
  begin
    lbTrackNumber.Caption := IntToStr(TT3NonRealVehicle(Data).TrackNumber);
    Button1.Enabled := true;
    //temukan grupnya dulu
    //grp := simMgrClient.FMyCubGroup;

    number := simMgrClient.GetBiggestTrackNumber;
    edtNewTrackNumber.Text := IntToStr(TT3DetectedTrack(Data).TrackNumber);
    setPopTrackNumber(number);
  end;
end;

procedure TfrmChangeTrackNumber.setPopTrackNumber(newNumber : Integer);
var
  menu : TMenuItem;
  I, number : Integer;
begin
  pmNumber.Items.Clear; //hapus item
  number := newNumber;
  for I := 0 to 5 - 1 do
  begin
    number := number + 1;
    menu := TMenuItem.Create(pmNumber);
    menu.Caption := IntToStr(number);
    menu.Tag := number;
    menu.OnClick := Self.setEditNewTrackNumberByPop;
    menu.Enabled := true;
    menu.Visible := true;
    pmNumber.Items.Insert(I, menu);
  end;
end;

procedure TfrmChangeTrackNumber.setEditNewTrackNumberByPop(sender : TObject);
var
  number : Integer;
begin
  number := TMenuItem(sender).Tag;
  edtNewTrackNumber.Text := IntToStr(number);
end;

procedure TfrmChangeTrackNumber.ChangeTrackNumber(const value : Integer);
var
  rec: TRecCmd_Platform_CHANGE_TRACKNUMBER;
begin
  rec.PlatfomID := TT3DetectedTrack(Data).TrackObject.InstanceIndex;
  rec.TrackID   := TT3DetectedTrack(Data).TrackNumber;
  rec.newTrackNumber := value;
  rec.oldESMNumber := '';
  rec.newESMNumber := '';
  //ShowMessage('new track ' + IntToStr(rec.newTrackNumber) + 'text' + edtNewTrackNumber.Text);
  simMgrClient.netSend_CmdTrack_CHANGE_TRACKNUMBER(rec);
end;

procedure TfrmChangeTrackNumber.ChangeNRPTrackNumber(const value : Integer);
var
  rec: TRecCmd_Platform_CHANGE_TRACKNUMBER;
begin
  rec.PlatfomID := TT3NonRealVehicle(Data).InstanceIndex;
  rec.TrackID   := TT3NonRealVehicle(Data).TrackNumber;
  rec.newTrackNumber := value;
  rec.oldESMNumber := '';
  rec.newESMNumber := '';
  //ShowMessage('new track ' + IntToStr(rec.newTrackNumber) + 'text' + edtNewTrackNumber.Text);
  simMgrClient.netSend_CmdTrack_CHANGE_TRACKNUMBER(rec);
end;

procedure TfrmChangeTrackNumber.ChangeESMNumber(const value : String);
var
  rec: TRecCmd_Platform_CHANGE_TRACKNUMBER;
  detected : TT3DetectedTrack;
begin
  detected := TT3ESMTrack(Data).Parent as TT3DetectedTrack;
  rec.PlatfomID := detected.TrackObject.InstanceIndex;
  rec.TrackID   := detected.TrackNumber;
  rec.newTrackNumber := -1;

  //set ESM ol dan new
  rec.oldESMNumber := TT3ESMTrack(Data).TrackNumber;
  rec.newESMNumber := value;

  //ShowMessage('new track ' + IntToStr(rec.newTrackNumber) + 'text' + edtNewTrackNumber.Text);
  simMgrClient.netSend_CmdTrack_CHANGE_TRACKNUMBER(rec);
end;

end.
