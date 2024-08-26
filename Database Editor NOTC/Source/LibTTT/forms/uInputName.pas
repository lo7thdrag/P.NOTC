unit uInputName;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,uDBAssetObject, newClassASTT, tttData, uVectorVisual;

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
    cbbInstanceIdentIndex: TComboBox;
    procedure btnCancelClick(Sender: TObject);
    procedure getData;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbbNameChange(Sender: TObject);
    procedure edtTrackIdChange(Sender: TObject);
  private
    { Private declarations }
    procedure upperCase(sender:TObject);
  public
    { Public declarations }
    show_from : Integer;
    hostRec : THosted_Platform;
    PlatformVecList : TList;
    ownInc : Byte;
  end;

var
  fInputName: TfInputName;
  rec       : TPlatform_Instance;
  pi_ident  : TPlatform_Instance_Identifier;
  id,platform_id  : integer;
  ra        : TResource_Allocation;

implementation

uses uDataModuleTTT,uResurceAllocationSelect,ufrmSummaryResourceAllocation,
uVehicleSelect,ufrmMissileOnBoardPickList,ufrmTorpedoOnBoardPickList,ufrmMineOnBoardPickList,uSonobuoySelect,
uSatelliteSelect,  ufrmAvailableResourceAllocation, uDBAsset_Weapon, uDBAsset_Sonobuoy,
uDBAsset_Satellite, ufrmSummaryVehicle, uEmbarkedSelect;

{$R *.dfm}

procedure TfInputName.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfInputName.btnOkClick(Sender: TObject);
begin
  if not (show_from = fromVehicle) then
  begin
    if cbbName.Text = '' then
      ShowMessage('Select the name of the vehicle')
    else
      getData;
  end
  else
    getData;

end;

procedure TfInputName.cbbNameChange(Sender: TObject);
begin
  cbbInstanceIdentIndex.ItemIndex := cbbName.ItemIndex;
end;

procedure TfInputName.edtTrackIdChange(Sender: TObject);
begin
  upperCase(Sender);
end;

procedure TfInputName.FormCreate(Sender: TObject);
begin
  rec       := TPlatform_Instance.Create;
  pi_ident  := TPlatform_Instance_Identifier.Create;
  vList     := TList.Create;
  hostRec   := THosted_Platform.Create;
  PlatformVecList := TList.Create;
  ownInc := 0;
end;

procedure TfInputName.FormShow(Sender: TObject);
var i:integer;
begin
  if show_from = fromVehicle then
  begin
    lbl1.Visible        := False;
    lbl2.Visible        := False;
    edtTrackId.Visible  := False;
    cbbName.Visible     := False;
    lbl3.Visible        := True;
    edtQuantity.Visible := True;
    edtQuantity.Text    := IntToStr(hostRec.FData.Quantity);
  end
  else {if fVehicleAttributeWindow.fromVehicle = False then }
  begin
    lbl1.Visible        := True;
    lbl2.Visible        := True;
    edtTrackId.Visible  := True;
    cbbName.Visible     := True;

    if frmSummaryResourceAllocation.ra_index = 1 then
    begin
      vList.Clear;
      cbbName.Clear;
      cbbInstanceIdentIndex.Clear;

      dmTTT.GetPlatform_Instance_Identifier(StrToInt(fVehicleSelect.vId),'',vList,pi_ident);
      for I := 0 to vList.Count - 1 do
      begin
        cbbName.Items.Add(TPlatform_Instance_Identifier(vList[i]).FData.Instance_Identifier);
        cbbInstanceIdentIndex.Items.Add(inttostr(TPlatform_Instance_Identifier(vList[i]).FData.Instance_Ident_Index));

        if TPlatform_Instance_Identifier(vList[i]).FData.Instance_Identifier = fVehicleSelect.name_vId then
        begin
          cbbName.ItemIndex := I;
        end;
      end;
      if fVehicleSelect.name_vId = '' then cbbName.Text := '(Unnamed)';

    end
    else if frmSummaryResourceAllocation.ra_index = 2 then
    begin
      vList.Clear;
      cbbName.Clear;

//      dmTTT.getAllMissile(StrToInt(frmMissileOnBoardPickList.missile_id),vList,frmMissileOnBoardPickList.missile);
//      for I := 0 to vList.Count - 1 do
//      begin
//        cbbName.Items.Add(TMissile_On_Board(vList[i]).FDef.Class_Identifier);
//        if TMissile_On_Board(vList[i]).FDef.Class_Identifier = frmMissileOnBoardPickList.name_mId then
//        begin
//          cbbName.ItemIndex := I;
//        end;
//      end;
//      if frmMissileOnBoardPickList.name_mId = '' then cbbName.Text := '(Unnamed)';
    end
    else if frmSummaryResourceAllocation.ra_index = 3 then
    begin
      vList.Clear;
      cbbName.Clear;

//      dmTTT.getAllTorpedo(StrToInt(frmTorpedoOnBoardPickList.torpedo_id),vList,frmTorpedoOnBoardPickList.torpedo);
      for I := 0 to vList.Count - 1 do
      begin
        cbbName.Items.Add(TTorpedo_On_Board(vList[i]).FDef.Class_Identifier);
//        if TTorpedo_On_Board(vList[i]).FDef.Class_Identifier = frmTorpedoOnBoardPickList.name_tId then
        begin
          cbbName.ItemIndex := I;
        end;
      end;
//      if frmTorpedoOnBoardPickList.name_tId = '' then cbbName.Text := '(Unnamed)';
    end
    else if frmSummaryResourceAllocation.ra_index = 4 then
    begin
      vList.Clear;
      cbbName.Clear;

      dmTTT.getAllSonobuoy(0,StrToInt(fSonobuoySelect.sonobuoy_id),vList,fSonobuoySelect.sonobuoy);
      for I := 0 to vList.Count - 1 do
      begin
        cbbName.Items.Add(TSonobuoy_On_Board(vList[i]).FDef.Class_Identifier);
        if TSonobuoy_On_Board(vList[i]).FDef.Class_Identifier = fSonobuoySelect.name_sId then
        begin
          cbbName.ItemIndex := I;
        end;
      end;
      if fSonobuoySelect.name_sId = '' then cbbName.Text := '(Unnamed)';
    end
    else if frmSummaryResourceAllocation.ra_index = 5 then
    begin
      vList.Clear;
      cbbName.Clear;

//      dmTTT.getAllMine(StrToInt(frmMineOnBoardPickList.mine_id),vList,frmMineOnBoardPickList.mine);
      for I := 0 to vList.Count - 1 do
      begin
        cbbName.Items.Add(TMine_On_Board(vList[i]).FMine_Def.Mine_Identifier);
//        if TMine_On_Board(vList[i]).FMine_Def.Mine_Identifier = frmMineOnBoardPickList.name_mId then
        begin
          cbbName.ItemIndex := I;
        end;
      end;
//      if frmMineOnBoardPickList.name_mId = '' then cbbName.Text := '(Unnamed)';
    end
    else if frmSummaryResourceAllocation.ra_index = 6 then
    begin
      vList.Clear;
      cbbName.Clear;

//      dmTTT.getAllSatellite(StrToInt(fSatellite.sat_id),vList,fSatellite.sat);
//      for I := 0 to vList.Count - 1 do
//      begin
//        cbbName.Items.Add(TSatellite_Definition(vList[i]).FData.Satellite_Identifier);
//        if TSatellite_Definition(vList[i]).FData.Satellite_Identifier = fSatellite.name_sId then
//        begin
//          cbbName.ItemIndex := I;
//        end;
//      end;
//      if fSatellite.name_sId = '' then cbbName.Text := '(Unnamed)';
    end;
  end;
end;

procedure TfInputName.getData;
var
  tempList :TList;
  hybridRec : THybrid_On_Board;
  counter : Integer;
  I, warning: Integer;
  aPlatIns :TPlatform_Instance;
  isFoundVec, isFoundTrackID : Boolean;
begin
  tempList := TList.Create;

  if show_from = fromVehicle then
  begin
    with fEmbarkedSelect do begin
      if edtQuantity.Text <> '' then
        hostRec.FData.Quantity  := StrToInt(edtQuantity.Text)
      else hostRec.FData.Quantity  := 0;
      if edit_quantity then
      begin
        selVecList[lbRAVehicle.ItemIndex] := hostRec;
      end
      else begin
        edit_quantity := True;
        selVecList.Add(hostRec);
        showVehicleSelectList;
        lbRAVehicle.ItemIndex := selVecList.Count - 1;
      end;
    end;
    Close;
  end
  else
  begin
    if frmSummaryResourceAllocation.ra_index = 1 then
    begin
      platform_id := 1;
      rec := TPlatform_Instance.Create;
      with rec.FData do begin
        if frmSummaryResourceAllocation.ra_id <> 0 then
          Resource_Alloc_Index  := frmSummaryResourceAllocation.ra_id
        else
        begin
          dmTTT.GetMaxResource_Allocation(id);
          Resource_Alloc_Index  := id;
        end;

        Platform_Instance_Index := ownInc; //owninc;//increment temporary saja
        Vehicle_Index         := StrToInt(fVehicleSelect.vId);
        Instance_Name         := cbbName.Text;
        Platform_Type         := 1;
        Track_ID              := edtTrackId.Text;
        Force_Designation     := frmSummaryResourceAllocation.force;
//        Instance_Ident_Index  := StrToInt(cbbInstanceIdentIndex.Text);

        Instance_Ident_Index := dmTTT.getInstance_Ident_Index(Vehicle_Index, Instance_Name);

        if Assigned(rec.FVectorSymbol) then
            rec.FVectorSymbol.Free;

        if dmTTT.GetVehicle_Definition(Vehicle_Index, rec.Vehicle) then
        begin
          case rec.Vehicle.FData.Platform_Domain of
            vhdAir :
              begin
                case rec.Vehicle.FData.Platform_Type of
                  vhtRotaryRec, vhtRotaryAttack, vhtRotaryASW, vhtRotarySurv : rec.FVectorSymbol := THelicopterVectorSymbol.Create;
                  vhtFixedRec  : rec.FVectorSymbol := TAirPlaneVectorSymbol.Create;
                else
                  rec.FVectorSymbol := TAirPlaneVectorSymbol.Create;
                end;
              end;
            vhdSurface : rec.FVectorSymbol := TShipVectorSymbol.Create;
            vhdSubsurface : rec.FVectorSymbol := TShipVectorSymbol.Create;   //sementara ikut yang surface dulu
            vhdLand : rec.FVectorSymbol := TTankVectorSymbol.Create;
            vhdAmphibious : rec.FVectorSymbol := TTankVectorSymbol.Create;
//            vhdWreck :;
//            vhdGeneral :;
//            vhdGrpPersonel :;
          else
            rec.FVectorSymbol := TVectorSymbol.Create;
          end;
        end;

        {Prince}
        if dmTTT.GetMotion_Characteristics(rec.Vehicle.FData.Motion_Characteristics, rec.Motion) then
        begin
          rec.FActivation.Init_Fuel := rec.Motion.FData.Max_Fuel_Capacity;
        end;

//        if dmTTT.GetDefault_Logistics(rec.Vehicle.FData.Logistics_Index, rec.Logistic) then
//        begin
//          rec.FActivation.Init_Lubricants := rec.Logistic.FData.ML;
//          rec.FActivation.Init_Freshwater := rec.Logistic.FData.AT;
//          rec.FActivation.Init_Water := rec.Logistic.FData.Water;
//          rec.FActivation.Init_Food := rec.Logistic.FData.Food;
//        end;

        if dmTTT.getAllPlatFormInstanceForceClassification(StrToInt(fVehicleSelect.vId),Resource_Alloc_Index,tempList,frmSummaryResourceAllocation.force,-1)<> -1 then
          begin
            if fVehicleSelect.pi_ID = '' then
            begin
//              dmTTT.insertPlatformInstance(rec,1);    // insertnya di pindah ke main form
              isFoundVec := False;
              isFoundTrackID := False;
              for I := 0 to PlatformVecList.Count - 1 do
              begin
                aPlatIns := TPlatform_Instance(PlatformVecList.Items[i]);
                if rec.FData.Instance_Ident_Index = aPlatIns.FData.Instance_Ident_Index then     //cek apakan platform sudah digunakan
                begin
                  isFoundVec := True;
                  break;
                end;
              end;

              for I := 0 to PlatformVecList.Count - 1 do
              begin
                aPlatIns := TPlatform_Instance(PlatformVecList.Items[i]);
                if rec.FData.Track_ID = aPlatIns.FData.Track_ID then     //cek apakan TrackID sama
                begin
                  isFoundTrackID := True;
                  break;
                end;
              end;

              if isFoundVec then
              begin
                warning := MessageDlg('vehicle has already been add !!',mtWarning,[mbOK],0);
                if warning = mrOK then
                begin
                  Exit;
                end;
              end
              else if isFoundTrackID then
              begin
                warning := MessageDlg('Track ID is already exist  !!',mtWarning,[mbOK],0);
                if warning = mrOK then
                begin
                  Exit;
                end;
              end
              else
                PlatformVecList.Add(rec)

            end
            else
            begin
              for I := 0 to PlatformVecList.Count - 1 do
              begin
                if TPlatform_Instance(PlatformVecList.Items[i]).FData.Platform_Instance_Index = StrToInt(fVehicleSelect.pi_ID) then
                begin
                  TPlatform_Instance(PlatformVecList.Items[i]).FData.Instance_Name := cbbName.Text;
                  TPlatform_Instance(PlatformVecList.Items[i]).FData.Track_ID := edtTrackId.Text;
                end;

              end;

//              dmTTT.updatePlatformInst(1,rec,fVehicleSelect.pi_ID);

            end;

            Close;
          end
        else
            ShowMessage('Name already exist');
      end;

      counter := fVehicleSelect.lbAllVehicle.ItemIndex;
      fVehicleSelect.getAllVehicle;
      fVehicleSelect.lbAllVehicle.ItemIndex := counter;

//      fVehicleSelect.getRAVehicle;
    end
    else if frmSummaryResourceAllocation.ra_index = 2 then
    begin
//      platform_id := 2;
//      with rec.FData do begin
//        if frmSummaryResourceAllocation.ra_id <> 0 then
//          Resource_Alloc_Index  := frmSummaryResourceAllocation.ra_id
//        else
//        begin
//          dmTTT.GetMaxResource_Allocation(id);
//          Resource_Alloc_Index  := id;
//        end;
//        Missile_Index         := StrToInt(frmMissileOnBoardPickList.missile_id);
//        Instance_Name         := cbbName.Text;
//        Platform_Type         := 2;
//        Track_ID              := edtTrackId.Text;
//        Force_Designation     := frmSummaryResourceAllocation.force;
//      end;
//
//      hybridRec := THybrid_On_Board.Create;
//      if frmMissileOnBoardPickList.pi_ID = '' then
//      begin
//        //checking hybrid or not
//        if dmTTT.GetHybrid_ByMissile(rec.FData.Missile_Index,hybridRec) then
//        begin
//          rec.FData.Hybrid_Index := hybridRec.FData.Hybrid_Index;
//          dmTTT.insertPlatformInstance(rec,7);
//        end
//        else
//          dmTTT.insertPlatformInstance(rec,2)
//      end
//      else
//      begin
//        //checking hybrid or not
//        if dmTTT.GetHybrid_ByMissile(rec.FData.Missile_Index,hybridRec) then
//        begin
//          rec.FData.Hybrid_Index := hybridRec.FData.Hybrid_Index;
//          dmTTT.updatePlatformInst(7,rec,frmMissileOnBoardPickList.pi_ID);
//        end
//        else
//        dmTTT.updatePlatformInst(2,rec,frmMissileOnBoardPickList.pi_ID);
//      end;
//
//      Close;
//      frmMissileOnBoardPickList.getRAMissile;
    end
    else if frmSummaryResourceAllocation.ra_index = 3 then
    begin
      platform_id := 3;
      with rec.FData do begin
        if frmSummaryResourceAllocation.ra_id <> 0 then
          Resource_Alloc_Index  := frmSummaryResourceAllocation.ra_id
        else
        begin
          dmTTT.GetMaxResource_Allocation(id);
          Resource_Alloc_Index  := id;
        end;
//        Torpedo_Index         := StrToInt(frmTorpedoOnBoardPickList.torpedo_id);
        Instance_Name         := cbbName.Text;
        Platform_Type         := 3;
        Track_ID              := edtTrackId.Text;
        Force_Designation     := frmSummaryResourceAllocation.force;
      end;

//      if frmTorpedoOnBoardPickList.pi_ID = '' then
//        dmTTT.insertPlatformInstance(rec,3)
//      else
//        dmTTT.updatePlatformInst(3,rec,frmTorpedoOnBoardPickList.pi_ID);

      Close;
//      frmTorpedoOnBoardPickList.getRATorpedo;
    end
    else if frmSummaryResourceAllocation.ra_index = 4 then
    begin
      platform_id := 4;
      with rec.FData do begin
        if frmSummaryResourceAllocation.ra_id <> 0 then
          Resource_Alloc_Index  := frmSummaryResourceAllocation.ra_id
        else
        begin
          dmTTT.GetMaxResource_Allocation(id);
          Resource_Alloc_Index  := id;
        end;
        Sonobuoy_Index        := StrToInt(fSonobuoySelect.sonobuoy_id);
        Instance_Name         := cbbName.Text;
        Platform_Type         := 4;
        Track_ID              := edtTrackId.Text;
        Force_Designation     := frmSummaryResourceAllocation.force;
      end;

//      if fSonobuoySelect.pi_ID = '' then
//        dmTTT.insertPlatformInstance(rec,4)
//      else
//        dmTTT.updatePlatformInst(4,rec,fSonobuoySelect.pi_ID);

      Close;
      fSonobuoySelect.getRASonobuoy;
    end
    else if frmSummaryResourceAllocation.ra_index = 5 then
    begin
      platform_id := 5;
      with rec.FData do begin
        if frmSummaryResourceAllocation.ra_id <> 0 then
          Resource_Alloc_Index  := frmSummaryResourceAllocation.ra_id
        else
        begin
          dmTTT.GetMaxResource_Allocation(id);
          Resource_Alloc_Index  := id;
        end;
//        Mine_Index            := StrToInt(frmMineOnBoardPickList.mine_id);
        Instance_Name         := cbbName.Text;
        Platform_Type         := 5;
        Track_ID              := edtTrackId.Text;
        Force_Designation     := frmSummaryResourceAllocation.force;
      end;

//      if frmMineOnBoardPickList.pi_ID = '' then
//        dmTTT.insertPlatformInstance(rec,5)
//      else
//        dmTTT.updatePlatformInst(5,rec,frmMineOnBoardPickList.pi_ID);

      Close;
//      frmMineOnBoardPickList.getRAMine;
    end
    else if frmSummaryResourceAllocation.ra_index = 6 then
    begin
      platform_id := 6;
      with rec.FData do begin
        if frmSummaryResourceAllocation.ra_id <> 0 then
          Resource_Alloc_Index  := frmSummaryResourceAllocation.ra_id
        else
        begin
          dmTTT.GetMaxResource_Allocation(id);
          Resource_Alloc_Index  := id;
        end;
        Satellite_Index       := StrToInt(fSatellite.sat_id);
        Instance_Name         := cbbName.Text;
        Platform_Type         := 6;
        Track_ID              := edtTrackId.Text;
        Force_Designation     := frmSummaryResourceAllocation.force;
      end;

//      if fSatellite.pi_ID = '' then
//        dmTTT.insertPlatformInstance(rec,6)
//      else
//        dmTTT.updatePlatformInst(6,rec,fSatellite.pi_ID);

      Close;
      fSatellite.getRASatellite;
    end;
    Close;
  end;
end;

procedure TfInputName.upperCase(sender: TObject);
var
  sebelumUp : TNotifyEvent; //mengeset variabel yang dibutuhkan
  dimulaiUp: Integer;
begin
  with (Sender as TEdit) do
  begin
    sebelumUp := OnChange; //assign var sebelumUp seperti onChange
    OnChange := nil;
    dimulaiUp := SelStart;

    SelStart := SelStart - 1;
    SelLength := 1;
    SelText := AnsiUpperCase (SelText);

    OnChange := sebelumUp;
    SelStart := dimulaiUp;
  end;
end;

end.
