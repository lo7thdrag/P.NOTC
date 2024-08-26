unit ufrmAvailableResourceAllocation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDBAssetObject;

type
  TfrmAvailableResourceAllocation = class(TForm)
    btClose: TButton;
    btCopy: TButton;
    btEdit: TButton;
    btFilter: TButton;
    btNew: TButton;
    btRemove: TButton;
    btUsage: TButton;
    lbRAList: TListBox;
    lbRAId: TListBox;
    procedure FormShow(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure btCopyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure getResource;
    procedure btRemoveClick(Sender: TObject);
    procedure lbRAListClick(Sender: TObject);
    procedure btUsageClick(Sender: TObject);
    procedure lbRAListDblClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
    { Private declarations }
    procedure getDataResource;
  public
    { Public declarations }
    raList:TList;
    RA_id :string;
    resource_alloc :TResource_Allocation;
  end;

var
  frmAvailableResourceAllocation: TfrmAvailableResourceAllocation;

implementation

uses uSimDBEditor, ufrmSummaryResourceAllocation, uDataModuleTTT, ufrmUsage, uVehicleSelect;

{$R *.dfm}

procedure TfrmAvailableResourceAllocation.btCloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmAvailableResourceAllocation.btCopyClick(Sender: TObject);
begin
  frmSummaryResourceAllocation.isCopy := True;
  getDataResource;
end;

procedure TfrmAvailableResourceAllocation.btEditClick(Sender: TObject);
begin
  if lbRAList.ItemIndex = -1 then
  begin
    Exit;
  end
  else begin
    frmSummaryResourceAllocation.isCopy := False;
    frmSummaryResourceAllocation.isnew := False;
    getDataResource;
  end;

end;

procedure TfrmAvailableResourceAllocation.getDataResource;
begin
  RA_id := lbRAId.Items.Strings[lbRAList.ItemIndex];
  with frmSummaryResourceAllocation do begin
    isnew := False;
    ra_id := StrToInt(lbRAId.Items.Strings[lbRAList.ItemIndex]);
    edtStartTime.Text := datetimetostr( floattodatetime(TResource_Allocation(raList[lbRAList.ItemIndex]).FData.Game_Start_Time));
    ShowModal;
  end;
end;

procedure TfrmAvailableResourceAllocation.btNewClick(Sender: TObject);
begin
  with frmSummaryResourceAllocation do
  begin
    isnew := true;
    btnVehicle.Enabled  := False;
    btnMissile.Enabled  := False;
    btnMine.Enabled     := False;
    btnTorpedo.Enabled  := False;
    btnSonobuoy.Enabled := False;
    btnSatelite.Enabled := False;
    btnRuntimePlatformLibraries.Enabled  := False;
    btnReferencePointsResources.Enabled  := False;
    btnPredifenedPatterns.Enabled  := False;
    btnOverlaysResources.Enabled   := False;
    btnRadarIntervalLists.Enabled  := False;
    btnCommunicationResources.Enabled  := False;
//  btnApply.Enabled := False;
    btnOK.Enabled := False;
    edtDefaults.Text := '[None]';
    ShowModal;
  end;
end;

procedure TfrmAvailableResourceAllocation.btRemoveClick(Sender: TObject);
var warning: Integer;
    PI_List: TList;
    I: Integer;
    RA_index: string;
begin
  if lbRAList.ItemIndex <> -1 then
  begin
    warning := MessageDlg('Are you sure you want to delete this item?',mtConfirmation,mbOKCancel,0);
    if warning = mrOK then
    begin
      PI_List := TList.Create;
      RA_index:= lbRAId.Items.Strings[lbRAList.ItemIndex];
      dmTTT.getAllPlatFormInstance(StrToInt(RA_index),PI_List);
      for I := 0 to PI_List.Count - 1 do
      begin
        with TPlatform_Instance(PI_List[I]).FData do begin
          dmTTT.DeleteFormationDefinition_ByLeader(IntToStr(Platform_Instance_Index));
          dmTTT.deleteFormation_AssignByPI_Index(IntToStr(Platform_Instance_Index));
          dmTTT.DeleteCubicle_Group_Assignment(Platform_Instance_Index);
          dmTTT.deletePlatform_ActivationByIndex(IntToStr(Platform_Instance_Index));
//          dmTTT.deletePlatformInstance(IntToStr(Platform_Instance_Index));
        end;
      end;
      dmTTT.DeleteAllResource_Library_Mapping(RA_index);
      dmTTT.DeleteAllReference_Point(RA_index);
      dmTTT.DeleteAllResource_Pattern_Mapping(RA_index);
      dmTTT.deleteAll_Resource_Overlay_Mapping(RA_index);
      dmTTT.DeleteAllResource_Interval_List_Mapping(RA_index);
      dmTTT.DeleteAllExternal_Communication_Channel(RA_index);
      dmTTT.updateScenario_ByRA('1',RA_index);
      dmTTT.DeleteResource_Allocation(RA_index);
      getResource;
    end;
  end;
end;

procedure TfrmAvailableResourceAllocation.btUsageClick(Sender: TObject);
begin
  if lbRAList.ItemIndex <> -1 then begin
    with frmUsage do begin
      UId := StrToInt(lbRAId.Items.Strings[lbRAList.ItemIndex]);
      name_usage  := lbRAList.Items.Strings[lbRAList.ItemIndex];
      UIndex  := 28;
      usage_title := 'Scenario:';
      ShowModal;
    end;
  end;
end;

procedure TfrmAvailableResourceAllocation.FormCreate(Sender: TObject);
begin
  raList := Tlist.Create;
end;

procedure TfrmAvailableResourceAllocation.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if GetKeyState(VK_ESCAPE)< 0 then
  begin
    case Msg.CharCode of
     VK_ESCAPE:
     begin
       btClose.Click;
     end;
    end;
  end;
end;

procedure TfrmAvailableResourceAllocation.FormShow(Sender: TObject);
begin
  getResource;
  btEdit.Enabled := False;
  btCopy.Enabled := False;
  btRemove.Enabled := False;
  btUsage.Enabled  := False;
  btFilter.Enabled := False;

end;

procedure TfrmAvailableResourceAllocation.getResource;
var I: Integer;
begin
//get all scenario name
  dmTTT.getAllResource_Allocation(raList);

  lbRAList.Items.Clear;
  lbRAId.Items.Clear;


  for I := 0 to raList.Count - 1 do
  begin
    lbRAList.Items.Add(TResource_Allocation(raList[i]).FData.Allocation_Identifier);
    lbRAId.Items.Add(IntToStr(TResource_Allocation(raList[i]).FData.Resource_Alloc_Index));
  end;

end;


procedure TfrmAvailableResourceAllocation.lbRAListClick(Sender: TObject);
begin
  btEdit.Enabled := True;
  btCopy.Enabled := True;
  btRemove.Enabled := True;
  btUsage.Enabled  := True;
end;

procedure TfrmAvailableResourceAllocation.lbRAListDblClick(Sender: TObject);
begin
   btEdit.Click;
end;

end.
