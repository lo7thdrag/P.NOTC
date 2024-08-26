unit uWaypointWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, uDBAssetObject;

type
  TfrmWaypointWindow = class(TForm)
    lvWaypoint: TListView;
    btnCopy: TButton;
    btnUsage: TButton;
    btnCancel: TButton;
    btnRemove: TButton;
    btnNew: TButton;
    btnEdit: TButton;
    chkShow: TCheckBox;
    chkShowAll: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure chkShowAllClick(Sender: TObject);
    procedure chkShowClick(Sender: TObject);
    procedure lvWaypointClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnUsageClick(Sender: TObject);
  private
    { Private declarations }

    procedure getWaypoint;
    procedure GetWaypointData;
  public
    { Public declarations }
    WaypointList : TList;
    WpDefSelected : TWaypoint_Def;
  end;

var
  frmWaypointWindow: TfrmWaypointWindow;

implementation

uses ufrmSummaryWaypoint, ufrmAdminMainForm, uDataModuleTTT, ufrmUsage;

{$R *.dfm}

procedure TfrmWaypointWindow.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmWaypointWindow.btnCopyClick(Sender: TObject);
var
  i : Integer;
  wp_def : TWaypoint_Def;
begin
  if lvWaypoint.Selected = nil then
  begin
    ShowMessage('Select waypoint first');
    Exit;
  end;

  for I := 0 to WaypointList.Count - 1 do
  begin
    wp_def := TWaypoint_Def(WaypointList.Items[i]);
    wp_def.isShow := False;
  end;

  Hide;
  frmAdminMainForm.isModeWaypoint := True;
//  frmSummaryWaypoint.isNew := True;
  GetWaypointData;
//  frmSummaryWaypoint.edtName.Text := 'Copy of ' + frmSummaryWaypoint.recWpDef.FData.Waypoint_Name;
  frmSummaryWaypoint.Show;
end;

procedure TfrmWaypointWindow.btnEditClick(Sender: TObject);
var
  i : Integer;
  wp_def : TWaypoint_Def;
begin
  if lvWaypoint.Selected = nil then
  begin
    ShowMessage('Select waypoint first');
    Exit;
  end;

  for I := 0 to WaypointList.Count - 1 do
  begin
    wp_def := TWaypoint_Def(WaypointList.Items[i]);
    wp_def.isShow := False;
  end;

  Hide;
  frmAdminMainForm.isModeWaypoint := True;
//  frmSummaryWaypoint.isNew := False;
  GetWaypointData;
  frmSummaryWaypoint.Show;
end;

procedure TfrmWaypointWindow.btnNewClick(Sender: TObject);
begin
  Hide;
  frmAdminMainForm.isModeWaypoint := True;
//  frmSummaryWaypoint.isNew := True;
//  frmSummaryWaypoint.recWpDef := TWaypoint_Def.Create;
//  frmSummaryWaypoint.ListWpData := TList.Create;
  frmSummaryWaypoint.Show;
end;

procedure TfrmWaypointWindow.btnRemoveClick(Sender: TObject);
var
  id : Integer;
  wp : TWaypoint_Def;
  gList : TList;
  warning : Integer;
begin
  if lvWaypoint.Selected = nil then
  begin
    ShowMessage('Select waypoint first');
    Exit;
  end;

  wp := TWaypoint_Def(lvWaypoint.Selected.Data);

  gList := TList.Create;
  if dmTTT.GetWaypointBySce(wp.FData.Waypoint_Index,gList) then
  begin
    MessageDlg('cannot remove the connected Runtime Platform data which still connected to Scenario',
                 mtWarning,[mbOK], 0);
    if lvWaypoint.Selected <> nil then
    begin
      with frmUsage do
      begin
        UId := wp.FData.Waypoint_Index;
        name_usage  := wp.FData.Waypoint_Name;
        UIndex  := 41;
        usage_title := 'Scenario:';
        ShowModal;
      end;
    end;
  end
  else
  begin
    warning := MessageDlg('Are you sure you want to delete this item?',mtConfirmation,mbOKCancel,0);
    if warning = mrOK then
    begin
      dmTTT.DeleteWaypointByID(wp.FData.Waypoint_Index);
      getWaypoint;
      frmAdminMainForm.showWaypoint := True;
      chkShow.Checked := false;
      chkShowAll.Checked := false;
    end;
  end;

end;

procedure TfrmWaypointWindow.btnUsageClick(Sender: TObject);
var
  wp : TWaypoint_Def;
begin
  if lvWaypoint.Selected <> nil then
  begin
    wp := TWaypoint_Def(lvWaypoint.Selected.Data);
    with frmUsage do begin
      UId := wp.FData.Waypoint_Index;
      name_usage  := wp.FData.Waypoint_Name;
      UIndex  := 41;
      usage_title := 'Scenario:';
      ShowModal;
    end;
  end;
end;

procedure TfrmWaypointWindow.chkShowAllClick(Sender: TObject);
var
  i : Integer;
  wp_def : TWaypoint_Def;
begin
  if chkShowAll.Checked then
  begin
    for I := 0 to WaypointList.Count - 1 do
    begin
      wp_def := TWaypoint_Def(WaypointList.Items[i]);
      wp_def.isShow := True;
    end;

    frmAdminMainForm.Map1.Repaint;
  end
  else
  begin
    for I := 0 to WaypointList.Count - 1 do
    begin
      wp_def := TWaypoint_Def(WaypointList.Items[i]);
      wp_def.isShow := False;
    end;

    chkShow.Checked := False;
    frmAdminMainForm.Map1.Repaint;
  end;
end;

procedure TfrmWaypointWindow.chkShowClick(Sender: TObject);
var
  i : Integer;
  wp_def : TWaypoint_Def;
begin
  if lvWaypoint.Selected = nil then
  begin
    ShowMessage('Select Waypoint first');
    Exit;
  end;

  if chkShow.Checked then
  begin
    wp_def := TWaypoint_Def(lvWaypoint.Selected.Data);
    wp_def.isShow := True;
    frmAdminMainForm.Map1.Repaint;
  end
  else
  begin
    wp_def := TWaypoint_Def(lvWaypoint.Selected.Data);
    wp_def.isShow := False;
    frmAdminMainForm.Map1.Repaint;
  end;
end;

procedure TfrmWaypointWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmAdminMainForm.showWaypoint := False;
  frmAdminMainForm.Map1.Repaint;
end;

procedure TfrmWaypointWindow.FormCreate(Sender: TObject);
begin
  WaypointList := TList.Create;
end;

procedure TfrmWaypointWindow.FormDestroy(Sender: TObject);
var
  i : integer;
  obj : TObject;
begin
  for I := WaypointList.Count - 1 downto 0 do
  begin
    obj := WaypointList.Items[i];
    obj.Free;
  end;

  WaypointList.Clear;
  WaypointList.Free;
  WaypointList := nil;

end;

procedure TfrmWaypointWindow.FormShow(Sender: TObject);
begin
  getWaypoint;
  frmAdminMainForm.showWaypoint := True;
  chkShow.Checked := false;
  chkShowAll.Checked := false;
end;

procedure TfrmWaypointWindow.getWaypoint;
var I : integer;
begin
  WaypointList.Clear;

  //get all waypoint name
  dmTTT.getAllWaypoint(WaypointList);

  lvWaypoint.Clear;
  for I := 0 to WaypointList.Count - 1 do
  begin
    with lvWaypoint.Items.Add do
    begin
      Data := WaypointList.Items[i];
      Caption := IntToStr(i + 1);
      SubItems.Add(TWaypoint_Def(WaypointList.Items[i]).FData.Waypoint_Name);
    end;
  end;

end;

procedure TfrmWaypointWindow.GetWaypointData;
begin
//  frmSummaryWaypoint.recWpDef := TWaypoint_Def(lvWaypoint.Selected.Data);
//  dmTTT.getWaypointDataByID(frmSummaryWaypoint.recWpDef.FData.Waypoint_Index, frmSummaryWaypoint.ListWpData);
end;

procedure TfrmWaypointWindow.lvWaypointClick(Sender: TObject);
var
  wp_def : TWaypoint_Def;
begin
  if lvWaypoint.Selected = nil then
  begin
    Exit;
  end;

  wp_def := TWaypoint_Def(lvWaypoint.Selected.Data);
//  wp_def.isShow := True;
  chkShow.Checked := wp_def.isShow;
end;

end.
