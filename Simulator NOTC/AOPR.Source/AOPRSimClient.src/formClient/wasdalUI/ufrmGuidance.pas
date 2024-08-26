unit ufrmGuidance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmControlled, ufmPlatformGuidance, Menus, ExtCtrls, StdCtrls,
  uT3Unit, ComCtrls, uT3GroupVehicle, uGameData_TTT, uBaseCoordSystem;

type
  TfrmGuidance = class(TForm)
    fmPlatformGuidance1: TfmPlatformGuidance;
    Panel1: TPanel;
    btnLaunch: TButton;
    btnLandPlatform: TButton;
    pnlTrackControl: TPanel;
    lvTrackControl: TListView;
    pmTrackControl: TPopupMenu;
    Delete1: TMenuItem;
    ViewMember1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnLaunchClick(Sender: TObject);
    procedure btnLandPlatformClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure lvTrackControlSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ViewMember1Click(Sender: TObject);
  private
    FOnLaunchEmbarked: TNotifyEvent;
    procedure SetOnLaunchEmbarked(const Value: TNotifyEvent);
    { Private declarations }
  public
    { Public declarations }
    procedure SetControlledObject(pit : TT3PlatformInstance);
    property OnLaunchEmbarked : TNotifyEvent read FOnLaunchEmbarked
      write SetOnLaunchEmbarked;
  end;

var
  frmGuidance: TfrmGuidance;

implementation

uses
  ufrmGeneraPfTools, uSimMgr_Client, uT3Vehicle, uFLanding, uLaunchPlatform,
  ufLandTemp, ufrmKeyboard, frmGroupName;

{$R *.dfm}

procedure TfrmGuidance.btnLandPlatformClick(Sender: TObject);
begin
  if simMgrClient.ControlledPlatform <> nil then begin

    if not Assigned(frmLandTemp) then
        frmLandTemp := TfrmLandTemp.Create(self);

    frmLandTemp.ControlledPlatform := simMgrClient.ControlledPlatform as TT3PlatformInstance;
    frmLandTemp.Show;
  end;

end;

procedure TfrmGuidance.btnLaunchClick(Sender: TObject);
begin
  if Assigned(simMgrClient.ControlledPlatform) then
  begin
    if not Assigned(frmLaunchPlaform) then
      frmLaunchPlaform := TfrmLaunchPlaform.Create(self);

    frmLaunchPlaform.PlatformInst := TT3PlatformInstance(simMgrClient.ControlledPlatform);
    frmLaunchPlaform.FormStyle := fsStayOnTop;
    frmLaunchPlaform.Show;
  end;
end;

procedure TfrmGuidance.Delete1Click(Sender: TObject);
var
  rec : TRecCmdMultiMode;
begin
  rec.GroupID := T3GroupVehicle(lvTrackControl.Selected.Data).GroupID;
  StrToChar(T3GroupVehicle(lvTrackControl.Selected.Data).GroupName, rec.GroupName);
  rec.aAction := Byte(C_DELETE);
  simMgrClient.netSend_CmdMultiMode(rec);
end;

procedure TfrmGuidance.FormActivate(Sender: TObject);
begin
  frmKeyboard.HandleOfTheTargetForm := Self.Handle;
end;

procedure TfrmGuidance.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;

  if Assigned(frmGeneralPfTools) then
    frmGeneralPfTools.btnGuidance.Down := False;

end;

procedure TfrmGuidance.FormCreate(Sender: TObject);
begin
//  if not simMgrClient.ISInstructor or not simMgrClient.ISWasdal then
//  begin
//    btnLandPlatform.Visible := True; {ngikut instruktur n operator di tempatkan di ship info}
//  end
//  else
//    btnLandPlatform.Visible := false;
end;

procedure TfrmGuidance.FormShow(Sender: TObject);
begin
  if simMgrClient.ControlledPlatform = nil then begin
    btnLaunch.Enabled := false;
  end;

  if TT3Vehicle(simMgrClient.ControlledPlatform).EmbarkedVehicles.Count > 0 then
    btnLaunch.Enabled := true
  else
    btnLaunch.Enabled := false;
end;

procedure TfrmGuidance.lvTrackControlSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  GrpVehicle : T3GroupVehicle;
  i : Integer;
  pi : TT3PlatformInstance;
begin
  if Selected then
  begin
    GrpVehicle := T3GroupVehicle(item.Data);

    fmPlatformGuidance1.GrpVehicle := GrpVehicle;

//    fmPlatformGuidance1.DisplayTab(byte(vgtStraightLine));

    for i := 0 to GrpVehicle.CountVe - 1 do
    begin
      pi := TT3PlatformInstance(GrpVehicle.GetVehicle(i));
      pi.Selected := True;
    end;
  end
  else
  begin
    if Assigned(Item.Data) then
    begin
      GrpVehicle := T3GroupVehicle(item.Data);

      for i := 0 to GrpVehicle.CountVe - 1 do
      begin
        pi := TT3PlatformInstance(GrpVehicle.GetVehicle(i));
        pi.Selected := False;
      end;
    end;
  end;
end;

procedure TfrmGuidance.SetControlledObject(pit: TT3PlatformInstance);
begin
  if pit is TT3Vehicle then
  begin
    frmGuidance.Caption := 'Guidance ' + simMgrClient.ControlledPlatform.InstanceName;
    if TT3Vehicle(pit).EmbarkedVehicles.Count > 0 then
      btnLaunch.Enabled := true
    else
      btnLaunch.Enabled := false;
  end
  else
  begin
    btnLaunch.Enabled := false;
  end;
end;

procedure TfrmGuidance.SetOnLaunchEmbarked(const Value: TNotifyEvent);
begin
  FOnLaunchEmbarked := Value;
end;

procedure TfrmGuidance.ViewMember1Click(Sender: TObject);
begin
  if Assigned(lvTrackControl.Selected) then
  begin
    frmGroupName1.Tag := 1;
    frmGroupName1.Caption := 'List name group : ' + T3GroupVehicle(lvTrackControl.Selected.Data).GroupName;
    frmGroupName1.Initilaize(lvTrackControl.Selected.Data);
    frmGroupName1.Show;
  end;
end;

end.
