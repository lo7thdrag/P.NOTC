unit ufrmAvailableWaypoint;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  uDBAssetObject;

type
  TfrmAvailableWaypoint = class(TForm)
    lstWaypoint: TListBox;
    ImgBackground: TImage;
    ImgBackgroungList: TImage;
    Label2: TLabel;
    Image1: TImage;
    lbl_search: TLabel;
    edtCheat: TEdit;
    btnNew: TImage;
    btnCopy: TImage;
    btnEdit: TImage;
    btnUsage: TImage;
    btnDelete: TImage;
    imgImgBtnBack: TImage;
    Image2: TImage;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lbSingleClick(Sender: TObject);

    procedure btnNewClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnUsageClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edtwaypointlistKeyPress(Sender: TObject; var Key: Char);

  private
    FUpdateList : Boolean;
    FWaypointList : TList;
    FSelectedWaypoint : TWaypoint_Def;

    procedure UpdateWaypointList;
  end;

var
  frmAvailableWaypoint: TfrmAvailableWaypoint;

implementation

{$R *.dfm}

uses
  uDataModuleTTT, ufrmSummaryWaypoint, ufrmUsage;

{$REGION ' Form Handle '}

procedure TfrmAvailableWaypoint.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmAvailableWaypoint.FormCreate(Sender: TObject);
begin
  FWaypointList := TList.Create;
end;

procedure TfrmAvailableWaypoint.FormShow(Sender: TObject);
begin
  UpdateWaypointList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableWaypoint.btnNewClick(Sender: TObject);
begin
  frmSummaryWaypoint := TfrmSummaryWaypoint.Create(Self);
  try
    with frmSummaryWaypoint do
    begin
       SelectedWaypoint := TWaypoint_Def.Create;
      ShowModal;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummaryWaypoint.Free;
  end;

  if FUpdateList then
    UpdateWaypointList;
end;

procedure TfrmAvailableWaypoint.btnCloseClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmAvailableWaypoint.btnCopyClick(Sender: TObject);
var
  newClassName : string;
  count : Integer;
begin
  if lstWaypoint.ItemIndex = -1 then
  begin
    ShowMessage('Select Waypoint Data ... !');
    Exit;
  end;

  with FSelectedWaypoint do
  begin
    newClassName := FData.Waypoint_Name + ' - Copy';

    count := dmTTT.GetWaypointDef(newClassName);

    if count > 0 then
      newClassName := newClassName + ' (' + IntToStr(count + 1) + ')';

    FData.Waypoint_Name := newClassName;

    dmTTT.InsertWaypointDef(FData);
  end;

  UpdateWaypointList;
end;

procedure TfrmAvailableWaypoint.btnEditClick(Sender: TObject);
begin
  if lstWaypoint.ItemIndex = -1 then
  begin
    ShowMessage('Select Waypoint Data ... !');
    Exit;
  end;

  frmSummaryWaypoint := TfrmSummaryWaypoint.Create(Self);
  try
    with frmSummaryWaypoint do
    begin
      SelectedWaypoint := FSelectedWaypoint;
      ShowModal;
      FUpdateList := AfterClose;
    end;

  finally
    frmSummaryWaypoint.Free;
  end;

  if FUpdateList then
    UpdateWaypointList;
end;

procedure TfrmAvailableWaypoint.btnDeleteClick(Sender: TObject);
var
  warning : Integer;
  tempList: TList;

begin
  if lstWaypoint.ItemIndex = -1 then
  begin
    ShowMessage('Select Waypoint Data ... !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this Waypoint Data ?', mtConfirmation,
    mbOKCancel, 0);

  if warning = mrOK then
  begin
    with FSelectedWaypoint.FData do
    begin
      tempList := TList.Create;

      {Pengecekan Relasi Dengan Resource Allocation}
      if dmTTT.GetWaypointAtResourceAllocation(Waypoint_Index, tempList) then
      begin
        ShowMessage('Cannot delete, because is already in used by Resource Allocation');
        tempList.Free;
        Exit;
      end;
      tempList.Free;

      dmTTT.DeleteWaypointData(Waypoint_Index);

      if dmTTT.DeleteWaypointDef(Waypoint_Index) then
      begin
        ShowMessage('Data has been deleted');
      end;
    end;

    UpdateWaypointList;
  end;
end;

procedure TfrmAvailableWaypoint.btnUsageClick(Sender: TObject);
begin
  if lstWaypoint.ItemIndex = -1 then
  begin
    ShowMessage('Select Waypoint Data ... !');
    Exit;
  end;

  frmUsage := TfrmUsage.Create(Self);
  try
    with frmUsage do
    begin
      UId := FSelectedWaypoint.FData.Waypoint_Index;
      name_usage := FSelectedWaypoint.FData.Waypoint_Name;
      UIndex := 41;

      ShowModal;
    end;
  finally
    frmUsage.Free;
  end;
  
end;

procedure TfrmAvailableWaypoint.edtwaypointlistKeyPress(Sender: TObject;
  var Key: Char);
  var
  i : Integer;
  waypoint : TWaypoint_Def;
begin
  if Key = #13 then
  begin

 lstWaypoint.Items.Clear;

  dmTTT.GetFilterWaypointDef(FWaypointList,edtCheat.text);
    for i := 0 to FWaypointList.Count - 1 do
    begin
     waypoint := FWaypointList.Items[i];
    lstWaypoint.Items.AddObject(waypoint.FData.Waypoint_Name, waypoint);
    end;
  end;
end;

procedure TfrmAvailableWaypoint.lbSingleClick(Sender: TObject);
begin
  if lstWaypoint.ItemIndex = -1 then
    Exit;

  FSelectedWaypoint := TWaypoint_Def(lstWaypoint.Items.Objects[lstWaypoint.ItemIndex]);
end;

procedure TfrmAvailableWaypoint.UpdateWaypointList;
var
  i : Integer;
  waypoint : TWaypoint_Def;

begin
  lstWaypoint.Items.Clear;

  dmTTT.GetAllWaypointDef(FWaypointList);

  for i := 0 to FWaypointList.Count - 1 do
  begin
    waypoint := FWaypointList.Items[i];
    lstWaypoint.Items.AddObject(waypoint.FData.Waypoint_Name, waypoint);
  end;
end;

{$ENDREGION}

end.
