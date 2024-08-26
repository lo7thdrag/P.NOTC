unit uInputName;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,uDBAssetObject, newClassASTT;

type
  TfInputName = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edtTrackId: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    cbbName: TComboBox;
    lbl3: TLabel;
    edtQuantity: TEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure getData;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fInputName: TfInputName;
  rec       : TPlatform_Instance;
  pi_ident  : TPlatform_Instance_Identifier;
  id,platform_id  : integer;
  ra        : TResource_Allocation;

implementation

uses uDataModuleTTT,uResurceAllocationSelect,uResourceAllocation,
uVehicleSelect,uMissileSelect,uTorpedoSelect,uMineSelect,uSonobuoySelect,
uSatelliteSelect,  uRAList, uDBAsset_Weapon, uDBAsset_Sonobuoy,
uDBAsset_Satellite, uVehicleAttributeWindow;

{$R *.dfm}

procedure TfInputName.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfInputName.btnOkClick(Sender: TObject);
begin
  getData;
end;

procedure TfInputName.FormCreate(Sender: TObject);
begin
  rec       := TPlatform_Instance.Create;
  pi_ident  := TPlatform_Instance_Identifier.Create;
  vList     := TList.Create;
end;

procedure TfInputName.FormShow(Sender: TObject);
var i,id:integer;
begin


  if fVehicleAttributeWindow.fromVehicle then
  begin
    edtQuantity.Clear;
    lbl1.Visible        := False;
    lbl2.Visible        := False;
    edtTrackId.Visible  := False;
    cbbName.Visible     := False;
    lbl3.Visible        := True;
    edtQuantity.Visible := True;
    
  end
  else if fVehicleAttributeWindow.fromVehicle = False then
  begin
    lbl1.Visible        := True;
    lbl2.Visible        := True;
    edtTrackId.Visible  := True;
    cbbName.Visible     := True;
    cbbName.Clear;
    edtTrackId.Clear;

    if ResourceAllocationForm.ra_index = 1 then
    begin
      vList.Clear;
      cbbName.Clear;

      dmTTT.GetPlatform_Instance_Identifier(StrToInt(fVehicleSelect.vId),'',vList,pi_ident);
      for I := 0 to vList.Count - 1 do
        cbbName.Items.Add(TPlatform_Instance_Identifier(vList[i]).FData.Instance_Identifier);

    end
    else if ResourceAllocationForm.ra_index = 2 then
    begin
      vList.Clear;
      cbbName.Clear;

      dmTTT.getAllMissile(StrToInt(fMissileSelect.missile_id),vList,fMissileSelect.missile);
      for I := 0 to vList.Count - 1 do
        cbbName.Items.Add(TMissile_On_Board(vList[i]).FDef.Class_Identifier);
    end
    else if ResourceAllocationForm.ra_index = 3 then
    begin
      vList.Clear;
      cbbName.Clear;

      dmTTT.getAllTorpedo(StrToInt(fTorpedo.torpedo_id),vList,fTorpedo.torpedo);
      for I := 0 to vList.Count - 1 do
        cbbName.Items.Add(TTorpedo_On_Board(vList[i]).FDef.Class_Identifier);
    end
    else if ResourceAllocationForm.ra_index = 4 then
    begin
      vList.Clear;
      cbbName.Clear;

      dmTTT.getAllSonobuoy(StrToInt(fSonobuoy.sonobuoy_id),vList,fSonobuoy.sonobuoy);
      for I := 0 to vList.Count - 1 do
        cbbName.Items.Add(TSonobuoy_On_Board(vList[i]).FDef.Class_Identifier);
    end
    else if ResourceAllocationForm.ra_index = 5 then
    begin
      vList.Clear;
      cbbName.Clear;

      dmTTT.getAllMine(StrToInt(fMine.mine_id),vList,fMine.mine);
      for I := 0 to vList.Count - 1 do
        cbbName.Items.Add(TMine_On_Board(vList[i]).FMine_Def.Mine_Identifier);
    end
    else if ResourceAllocationForm.ra_index = 6 then
    begin
      vList.Clear;
      cbbName.Clear;

      dmTTT.getAllSatellite(StrToInt(fSatellite.sat_id),vList,fSatellite.sat);
      for I := 0 to vList.Count - 1 do
        cbbName.Items.Add(TSatellite_Definition(vList[i]).FData.Satellite_Identifier);
    end;

  end;
end;

procedure TfInputName.getData;
var tempList :TList;
i :integer;
begin
  tempList := TList.Create;

  if fVehicleAttributeWindow.fromVehicle then
  begin
    fVehicleSelect.Show;
    Close;

    with fVehicleSelect do begin
      for I := 0 to lbAllVehicle.Count - 1 do
      begin
        if lbAllVehicle.Selected[i] then
        begin
          lbRAVehicle.Items.Add(lbAllVehicle.Items.Strings[lbAllVehicle.ItemIndex]);
          lbTempIdSel.Items.Add(lbTempIdAll.Items.Strings[lbAllVehicle.ItemIndex]);
        end
      end;
      Show;
    end;
  end
  else
  begin
    if ResourceAllocationForm.ra_index = 1 then
    begin
      platform_id := 1;
      with rec.FData do begin
        if ResourceAllocationForm.ra_id <> 0 then
          Resource_Alloc_Index  := ResourceAllocationForm.ra_id
        else
        begin
          dmTTT.GetMaxResource_Allocation(id);
          Resource_Alloc_Index  := id;
        end;
        Vehicle_Index         := StrToInt(fVehicleSelect.vId);
        Instance_Name         := cbbName.Text;
        Platform_Type         := 1;
        Track_ID              := edtTrackId.Text;
        Force_Designation     := ResourceAllocationForm.force;

        if ResourceAllocationForm.ra_id <> 0 then
        begin
         if dmTTT.getAllPlatFormInstanceForceClassification(StrToInt(fVehicleSelect.vId),StrToInt(fRAList.RA_id),tempList,ResourceAllocationForm.force,-1)<> -1 then
          begin
            dmTTT.insertPlatformInstance(rec,1);
            Close;
          end
         else
            ShowMessage('Name already exist');
        end
        else
        begin
          if dmTTT.getAllPlatFormInstanceForceClassification(StrToInt(fVehicleSelect.vId),Resource_Alloc_Index,tempList,ResourceAllocationForm.force,-1)<> -1 then
          begin
            dmTTT.insertPlatformInstance(rec,1);
            Close;
          end
          else
            ShowMessage('Name already exist');
        end;
      end;
      fVehicleSelect.getRAVehicle;
    end
    else if ResourceAllocationForm.ra_index = 2 then
    begin
      platform_id := 2;
      with rec.FData do begin
        if ResourceAllocationForm.ra_id <> 0 then
          Resource_Alloc_Index  := ResourceAllocationForm.ra_id
        else
        begin
          dmTTT.GetMaxResource_Allocation(id);
          Resource_Alloc_Index  := id;
        end;
        Missile_Index         := StrToInt(fMissileSelect.missile_id);
        Instance_Name         := cbbName.Text;
        Platform_Type         := 2;
        Track_ID              := edtTrackId.Text;
        Force_Designation     := ResourceAllocationForm.force;
      end;

      dmTTT.insertPlatformInstance(rec,2);
      Close;
      fMissileSelect.getRAMissile;
    end
    else if ResourceAllocationForm.ra_index = 3 then
    begin
      platform_id := 3;
      with rec.FData do begin
        if ResourceAllocationForm.ra_id <> 0 then
          Resource_Alloc_Index  := ResourceAllocationForm.ra_id
        else
        begin
          dmTTT.GetMaxResource_Allocation(id);
          Resource_Alloc_Index  := id;
        end;
        Torpedo_Index         := StrToInt(fTorpedo.torpedo_id);
        Instance_Name         := cbbName.Text;
        Platform_Type         := 3;
        Track_ID              := edtTrackId.Text;
        Force_Designation     := ResourceAllocationForm.force;
      end;

      dmTTT.insertPlatformInstance(rec,3);
      Close;
      fTorpedo.getRATorpedo;
    end
    else if ResourceAllocationForm.ra_index = 4 then
    begin
      platform_id := 4;
      with rec.FData do begin
        if ResourceAllocationForm.ra_id <> 0 then
          Resource_Alloc_Index  := ResourceAllocationForm.ra_id
        else
        begin
          dmTTT.GetMaxResource_Allocation(id);
          Resource_Alloc_Index  := id;
        end;
        Sonobuoy_Index        := StrToInt(fSonobuoy.sonobuoy_id);
        Instance_Name         := cbbName.Text;
        Platform_Type         := 4;
        Track_ID              := edtTrackId.Text;
        Force_Designation     := ResourceAllocationForm.force;
      end;

      dmTTT.insertPlatformInstance(rec,4);
      Close;
      fSonobuoy.getRASonobuoy;
    end
    else if ResourceAllocationForm.ra_index = 5 then
    begin
      platform_id := 5;
      with rec.FData do begin
        if ResourceAllocationForm.ra_id <> 0 then
          Resource_Alloc_Index  := ResourceAllocationForm.ra_id
        else
        begin
          dmTTT.GetMaxResource_Allocation(id);
          Resource_Alloc_Index  := id;
        end;
        Mine_Index            := StrToInt(fMine.mine_id);
        Instance_Name         := cbbName.Text;
        Platform_Type         := 5;
        Track_ID              := edtTrackId.Text;
        Force_Designation     := ResourceAllocationForm.force;
      end;

      dmTTT.insertPlatformInstance(rec,5);
      Close;
      fMine.getRAMine;
    end
    else if ResourceAllocationForm.ra_index = 6 then
    begin
      platform_id := 6;
      with rec.FData do begin
        if ResourceAllocationForm.ra_id <> 0 then
          Resource_Alloc_Index  := ResourceAllocationForm.ra_id
        else
        begin
          dmTTT.GetMaxResource_Allocation(id);
          Resource_Alloc_Index  := id;
        end;
        Satellite_Index       := StrToInt(fSatellite.sat_id);
        Instance_Name         := cbbName.Text;
        Platform_Type         := 6;
        Track_ID              := edtTrackId.Text;
        Force_Designation     := ResourceAllocationForm.force;
      end;

      dmTTT.insertPlatformInstance(rec,6);
      Close;
      fSatellite.getRASatellite;
    end;
    Close;
  end;
end;

end.
