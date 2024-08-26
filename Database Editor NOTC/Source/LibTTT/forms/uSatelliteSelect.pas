unit uSatelliteSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls,uDBAsset_Satellite;

type
  TfSatellite = class(TForm)
    lbAllSatellite: TListBox;
    btnAdd: TButton;
    shp1: TShape;
    btnRemove: TButton;
    btnOk: TButton;
    btnCancel: TButton;
    lbTempIdAll: TListBox;
    lbTempIdSel: TListBox;
    lbSatelliteSel: TListBox;
    btnEditTrack: TButton;
    btnUsage: TButton;
    btnEdit: TButton;
    btnCopy: TButton;
    btnNew: TButton;
    btnFilter: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure getAllSatellite;
    procedure getRASatellite;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEditTrackClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnUsageClick(Sender: TObject);
    procedure lbAllSatelliteDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sat_id,name_sID,pi_ID  : string;
    sat : TSatellite_Definition;
    show_from : Integer;
  end;

var
  fSatellite  : TfSatellite;
  idSelect    : string;
  pList,sList: TList;

implementation

{$R *.dfm}
uses uDataModuleTTT, uSimDBEditor, uResurceAllocationSelect,
  ufrmSummaryResourceAllocation, uInputName,ufrmAvailableResourceAllocation,uDBAssetObject, uDBAsset_Weapon,
  uSatellitePlatform, ufrmUsage;

procedure TfSatellite.btnAddClick(Sender: TObject);
begin
  if lbAllSatellite.ItemIndex <> -1 then
  begin
    sat_id := lbTempIdAll.Items.Strings[lbAllSatellite.ItemIndex];
    name_sID  := '';
    pi_ID     := '';
    fInputName.edtTrackId.Text  := 'NULL';
    frmSummaryResourceAllocation.ra_index  := 6;
    fInputName.edtQuantity.Hide;
    fInputName.lbl3.Hide;
    fInputName.ShowModal;
  end;
end;

procedure TfSatellite.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfSatellite.btnCopyClick(Sender: TObject);
begin
  if lbAllSatellite.ItemIndex <> -1 then
  begin
    getSatellite_Definition(StrToInt(lbTempIdAll.Items.Strings[lbAllSatellite.ItemIndex]), SatellitePlatformForm.satelliteObject);

    SatellitePlatformForm.isCopy  := true;
    SatellitePlatformForm.refresh;
    SatellitePlatformForm.ShowModal;
  end;
end;

procedure TfSatellite.btnEditClick(Sender: TObject);
begin
  if lbAllSatellite.ItemIndex <> -1 then
  begin
    getSatellite_Definition(StrToInt(lbTempIdAll.Items.Strings[lbAllSatellite.ItemIndex]), SatellitePlatformForm.satelliteObject);

    SatellitePlatformForm.isCopy  := false;
    SatellitePlatformForm.refresh;
    SatellitePlatformForm.ShowModal;
  end;
end;

procedure TfSatellite.btnEditTrackClick(Sender: TObject);
begin
  if lbSatelliteSel.ItemIndex <> -1 then
  begin
    sat_id    := IntToStr(TSatellite_Definition(pList[lbSatelliteSel.ItemIndex]).FPI.Satellite_Index);
    name_sId  := lbSatelliteSel.Items.Strings[lbSatelliteSel.ItemIndex];
    pi_ID     := lbTempIdSel.Items.Strings[lbSatelliteSel.ItemIndex];
    fInputName.edtTrackId.Text  := TSatellite_Definition(pList[lbSatelliteSel.ItemIndex]).FPI.Track_ID;
    frmSummaryResourceAllocation.ra_index  := 6;
    fInputName.edtQuantity.Hide;
    fInputName.lbl3.Hide;
    fInputName.ShowModal;
  end;
end;

procedure TfSatellite.btnNewClick(Sender: TObject);
begin
  with SatellitePlatformForm do
  begin
    isNew := true;
    edtClass.Text := '';
    edtDetectionRangeRadius.Text := '';
    edtAltitude.Text := '';
    edtGameArea.Text := '';
    edtGroundSpeed.Text := '';
    edtLength.Text := '';
    edtWidth.Text := '';
    edtFront.Text := '';
    edtSide.Text := '';
    cbPlatformType.Checked := false;
    cbPlatformClass.Checked := false;
    ShowModal;
  end;
end;

procedure TfSatellite.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfSatellite.btnRemoveClick(Sender: TObject);
var
warning: integer;
begin
  if lbSatelliteSel.ItemIndex <> -1 then
  begin
    warning := MessageDlg('Are you sure you want to delete this item?',mtConfirmation,mbOKCancel,0);
    if warning = mrOK then
    begin
      dmTTT.deletePlatform_ActivationByIndex(lbTempIdSel.Items[lbSatelliteSel.ItemIndex]);
//      dmTTT.deletePlatformInstance(lbTempIdSel.Items[lbSatelliteSel.ItemIndex]);
      getRASatellite;
    end;
  end;
end;

procedure TfSatellite.btnUsageClick(Sender: TObject);
begin
  if lbSatelliteSel.ItemIndex <> -1 then begin
    with frmUsage do begin
      UId := TSatellite_Definition(pList[lbSatelliteSel.ItemIndex]).FPI.Satellite_Index;
      name_usage  := lbSatelliteSel.Items.Strings[lbSatelliteSel.ItemIndex];
      UIndex  := 24;
      usage_title := 'Scenario:';
      ShowModal;
    end;
  end;
end;

procedure TfSatellite.getAllSatellite;
var i   : integer;

begin
 sList.Clear;
//get all vehicle name
 uSimDBEditor.getAllSatellite(0,sList,sat);

 lbAllSatellite.Items.Clear;
 lbTempIdAll.Items.Clear;

  for I := 0 to sList.Count - 1 do
  begin
      lbAllSatellite.Items.Add(TSatellite_Definition(sList[i]).FData.Satellite_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TSatellite_Definition(sList[i]).FData.Satellite_Index));
  end;

  getRASatellite;
end;

procedure TfSatellite.getRASatellite;
var i   : integer;

begin
 pList.Clear;

 if frmAvailableResourceAllocation.RA_id <> '' then
    uSimDBEditor.getRA(5,StrToInt(frmAvailableResourceAllocation.RA_id),frmSummaryResourceAllocation.force,pList);

 lbSatelliteSel.Items.Clear;
 lbTempIdSel.Items.Clear;

  for I := 0 to pList.Count - 1 do begin
    lbSatelliteSel.Items.Add(TSatellite_Definition(pList[i]).FPI.Instance_Name);
    lbTempIdSel.Items.Add(IntToStr(TSatellite_Definition(pList[i]).FPI.Platform_Instance_Index));
  end;

end;

procedure TfSatellite.lbAllSatelliteDblClick(Sender: TObject);
begin
  btnAdd.Click;
end;

procedure TfSatellite.FormCreate(Sender: TObject);
begin
  pList   := Tlist.Create;
  sList   := TList.Create;
  sat     := TSatellite_Definition.Create;
end;

procedure TfSatellite.FormShow(Sender: TObject);
begin
  getAllSatellite;
end;

end.
