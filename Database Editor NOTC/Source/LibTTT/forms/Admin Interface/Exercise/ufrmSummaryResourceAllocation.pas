unit ufrmSummaryResourceAllocation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, uDBAssetObject,
  uDBAsset_GameEnvironment, uDBGame_Defaults, tttData, newClassASTT;

type
  TfrmSummaryResourceAllocation = class(TForm)
    pnl2: TPanel;
    pnl1: TPanel;
    pnl3: TPanel;
    lblName: TStaticText;
    edtName: TEdit;
    PageControl1: TPageControl;
    General: TTabSheet;
    Platforms: TTabSheet;
    Resources: TTabSheet;
    edtStartTime: TEdit;
    lblStartTime: TStaticText;
    lblEnvironment: TStaticText;
    edtEnvironment: TEdit;
    lblDefaults: TStaticText;
    edtDefaults: TEdit;
    btnBrowseEnvironment: TSpeedButton;
    btnBrowseDefaults: TSpeedButton;
    btnStudentRoleList: TButton;
    btnRuntimePlatformLibraries: TButton;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    grbForcePlatforms: TGroupBox;
    rbRedPlatforms: TRadioButton;
    rbAmberPlatforms: TRadioButton;
    rbBluePlatforms: TRadioButton;
    rbGreenPlatforms: TRadioButton;
    rbNoPlatforms: TRadioButton;
    grbPlatforms: TGroupBox;
    btnVehicle: TButton;
    btnMissile: TButton;
    btnTorpedo: TButton;
    btnSonobuoy: TButton;
    btnMine: TButton;
    btnSatelite: TButton;
    grbForceResources: TGroupBox;
    rbRedResources: TRadioButton;
    rbAmberResources: TRadioButton;
    rbBlueResources: TRadioButton;
    rbGreenResources: TRadioButton;
    rbNoForceResources: TRadioButton;
    grbResources: TGroupBox;
    btnReferencePointsResources: TButton;
    btnPredifenedPatterns: TButton;
    btnOverlaysResources: TButton;
    btnRadarIntervalLists: TButton;
    btnCommunicationResources: TButton;
    lbTextTime: TStaticText;
    procedure btnCancelClick(Sender: TObject);
    procedure btnBrowseEnvironmentClick(Sender: TObject);
    procedure btnBrowseDefaultsClick(Sender: TObject);
    procedure btnVehicleClick(Sender: TObject);
    procedure btnMissileClick(Sender: TObject);
    procedure ForceChoose;
    procedure ForceChooseResources;
    procedure btnTorpedoClick(Sender: TObject);
    procedure btnSonobuoyClick(Sender: TObject);
    procedure btnMineClick(Sender: TObject);
    procedure btnSateliteClick(Sender: TObject);
    procedure btnReferencePointsResourcesClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure getData;
    procedure getAllPlatform;
    procedure getAllResource;
    procedure getRuntimePlatform;
    procedure getVehicle;
    procedure getWeapon;
    procedure getSattelite;
    procedure getSonobuoy;
    procedure getMissle;
    procedure getTorpedo;
    procedure getMine;
    procedure getReferencePoint;
    procedure getPredefined;
    procedure getOverlay;
    procedure getIntervaList;
    procedure getCommchanel;
    procedure btnApplyClick(Sender: TObject);
    procedure getRAData;

    procedure btnCommunicationResourcesClick(Sender: TObject);
    procedure btnStudentRoleListClick(Sender: TObject);
	procedure btnOverlaysResourcesClick(Sender: TObject);
    procedure btnRuntimePlatformLibrariesClick(Sender: TObject);
    procedure btnPredifenedPatternsClick(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure btnRadarIntervalListsClick(Sender: TObject);


  private
    { Private declarations }
  public
 
    force,ra_id,ra_index, colorOfForce  : Integer;
    isnew,isCopy{,fromRA}: boolean;
    ra: TResource_Allocation;
    GameEnviroDef : TGame_Environment_Definition;
    Default : TRecGame_Defaults;
    Role_List : TStudent_Role_List;
    v_id : Integer;
    idEnvi,idGDef,idStuRole,idSat : string;
    MISSLList, TORPList, MINEList, SONOList,
    SATList, REFList, PREList, OVERList, TERVAList, CommList : Tlist;
    procedure getRA;
    procedure getEnvironment;
    procedure getDefault;
    procedure EnableButton;
    function getForcedesignation : integer;
    { Public declarations }
  end;

var
  frmSummaryResourceAllocation: TfrmSummaryResourceAllocation;

implementation

uses uEnvironmentSelect,uGameDefaultSelect,uVehicleSelect,ufrmMissileOnBoardPickList,
ufrmTorpedoOnBoardPickList,uSonobuoySelect, ufrmMineOnBoardPickList, uSatelliteSelect, uReferencePointEditor,
ufrmAvailableResourceAllocation,uDataModuleTTT, uSimDBEditor, uChannelComList, ufrmSummaryOverlay,
  ufrmOverlayResourceAllocationPickList, uStudentRoleList, ufrmSummaryVehicle,
  ufrmRPLResourceAllocationPickList, ufrmSummaryScenario, uResurceAllocationSelect, uLibSettingTTT,
  ufrmAdminMainForm, ufrmSummaryRadarIntervalList, uPredefinedSelectListForm,
  uDBAsset_Runtime_Platform_Library, uDBAsset_Weapon, uDBAsset_Fitted,
  uDBAsset_Sonobuoy, uDBAsset_Satellite, uDBPattern, uRadarIntervalDouble;


{$R *.dfm}

procedure TfrmSummaryResourceAllocation.btnApplyClick(Sender: TObject);
begin
  try
    if isNew then
    begin
      EnableButton;
      getData;
      dmTTT.insertResource(ra);
      ra_id := ra.FData.Resource_Alloc_Index;
      isNew := False;
    end
    else
    begin
      getData;
//      getAllPlatform;
//      getAllResource;   //masih belum fixed
      dmTTT.updateResource(ra,IntToStr(ra.FData.Resource_Alloc_Index));
    end;

//    if frmSummaryScenario.fromScenario then
//       fResorceAllocationSelect.getRA
//    else
//      frmAvailableResourceAllocation.getResource;
  except
    MessageDlg('The name of Resource Allocation is already exist, Please choose another name.',mtWarning,mbOKCancel,0);
  end;
  btnOK.Enabled:=True;
end;

procedure TfrmSummaryResourceAllocation.EnableButton;
begin
  btnVehicle.Enabled  := True;
  btnMissile.Enabled  := False;
  btnTorpedo.Enabled  := False;
  btnSonobuoy.Enabled := False;
  btnMine.Enabled     := False;
  btnSatelite.Enabled := False;
  btnRuntimePlatformLibraries.Enabled := True;
  btnReferencePointsResources.Enabled := True;
  btnPredifenedPatterns.Enabled  := True;
  btnOverlaysResources.Enabled   := True;
  btnRadarIntervalLists.Enabled  := True;
  btnCommunicationResources.Enabled  := True;
end;

procedure TfrmSummaryResourceAllocation.btnBrowseDefaultsClick(Sender: TObject);
begin
  fGameDefaults.fromResaourceAlloc := true;
  fGameDefaults.fromCharacteristic := false;
  fGameDefaults.ShowModal;
end;

procedure TfrmSummaryResourceAllocation.btnBrowseEnvironmentClick(Sender: TObject);
begin
   fEnvironmentSelect.ShowModal;
end;

procedure TfrmSummaryResourceAllocation.btnCancelClick(Sender: TObject);
begin
  Self.Close;
  isnew   := false;
  isCopy  := false;
end;

procedure TfrmSummaryResourceAllocation.btnCommunicationResourcesClick(
  Sender: TObject);
begin
  colorOfForce := getForcedesignation;
  fChannelComList.ShowModal;
end;

procedure TfrmSummaryResourceAllocation.btnMineClick(Sender: TObject);
begin
  ForceChoose;
//  frmMineOnBoardPickList.show_from := fromRA;
//  frmMineOnBoardPickList.ShowModal;
end;

procedure TfrmSummaryResourceAllocation.btnMissileClick(Sender: TObject);
begin
  ForceChoose;
//  frmMissileOnBoardPickList.id_form := fromRA;
//  frmMissileOnBoardPickList.ShowModal;
end;

procedure TfrmSummaryResourceAllocation.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
  isnew   := false;
  isCopy  := false;
end;

function TfrmSummaryResourceAllocation.getForcedesignation;
var
  forceResource : integer;
begin
  if rbRedResources.Checked = true then
    begin
      forceResource := 1;
    end
  else if rbAmberResources.Checked = true then
    begin
      forceResource := 2;
    end
  else if rbBlueResources.Checked = true then
    begin
      forceResource := 3;
    end
  else if rbGreenResources.Checked = true then
    begin
      forceResource := 4;
    end
  else if rbNoForceResources.Checked = true then
    begin
      forceResource := 6;
    end
  else
    forceResource := 0;

  result := forceResource;
end;

procedure TfrmSummaryResourceAllocation.getIntervaList;
var  I,K,id_intList : Integer;
     MList: TList;
     TERVALrec: TRadar_Interval_List;
     isSaved : Boolean;
begin
  if not isNew then
  begin
    MList := TList.Create;
    dmTTT.getAllMines_OnBoard(v_id, 0, MList);
    if MList.Count > 0 then
    begin
      for I := 0 to MList.Count - 1 do
      begin
        isSaved := False;
        for K := 0 to TERVAList.Count - 1 do
        begin
          id_intList := TRadar_Interval_List(MINEList[K]).FData.Interval_List_Index;
          if id_intList = TRadar_Interval_List(MList[I]).FData.Interval_List_Index then
          begin
            //update
            TERVALrec := TRadar_Interval_List.Create;
            TERVALrec.FData := TRadar_Interval_List(TERVAList[K]).FData;
            dmTTT.UpdateRadar_Interval_List(id_intList,TERVALrec);

            isSaved := True;
            if I < MList.Count - 1 then
              Break;
          end
          else if id_intList = 0 then
          begin
            if not (dmTTT.GetRadar_Interval_List(id_intList,TERVAList,TERVALrec)) then
            begin
              //insert
              TERVALrec := TRadar_Interval_List.Create;
              TERVALrec.FData := TRadar_Interval_List(TERVAList[K]).FData;
              dmTTT.InsertRadar_Interval_List(TERVALrec);

              isSaved := True;
            end;
          end;
        end;
        if not isSaved then
        begin
          //delete
          dmTTT.DeleteRadar_Interval_List(IntToStr(TRadar_Interval_List(MList[I]).FData.Interval_List_Index));
        end;
      end;
    end
    else
    begin
      for K := 0 to TERVAList.Count - 1 do
      begin
        //insert
        TERVALrec := TRadar_Interval_List.Create;
        TERVALrec.FData := TRadar_Interval_List(TERVAList[K]).FData;
        dmTTT.InsertRadar_Interval_List(TERVALrec);
      end;
    end;
  end
  else
  begin
    for K := 0 to TERVAList.Count - 1 do
    begin
      //insert
      TERVALrec := TRadar_Interval_List.Create;
      TERVALrec.FData := TRadar_Interval_List(TERVAList[K]).FData;
      TERVALrec.FData.Interval_List_Index := v_id;
      dmTTT.InsertRadar_Interval_List(TERVALrec);
    end;
  end;
end;

procedure TfrmSummaryResourceAllocation.getMine;
var  I,K,id_MineInstance : Integer;
     MList: TList;
     Minerec: TFitted_Weapon_On_Board;
     isSaved : Boolean;
begin
  if not isNew then
  begin
    MList := TList.Create;
    dmTTT.getAllMines_OnBoard(v_id, 0, MList);
    if MList.Count > 0 then
    begin
      for I := 0 to MList.Count - 1 do
      begin
        isSaved := False;
        for K := 0 to MINEList.Count - 1 do
        begin
          id_MineInstance := TMine_On_Board(MINEList[K]).FData.Fitted_Weap_Index;
          if id_MineInstance = TMine_On_Board(MList[I]).FData.Fitted_Weap_Index then
          begin
            //update
            Minerec := TFitted_Weapon_On_Board.Create;
            Minerec.FData := TMine_On_Board(MINEList[K]).FData;
            dmTTT.UpdateFitted_Weapon_OnBoard(IntToStr(id_MineInstance),3,Minerec.FData);

            isSaved := True;
            if I < MList.Count - 1 then
              Break;
          end
          else if id_MineInstance = 0 then
          begin
            if not (dmTTT.getWeapon_On_Board(1,v_id,TMine_On_Board(MINEList[K]).FData.Instance_Identifier)) then
            begin
              //insert
              Minerec := TFitted_Weapon_On_Board.Create;
              Minerec.FData := TMine_On_Board(MINEList[K]).FData;
              //~~dmTTT.InsertFitted_Weapon_On_Board(3,Minerec);

              isSaved := True;
            end;
          end;
        end;
        if not isSaved then
        begin
          //delete
          //~~dmTTT.DeleteFitted_Weapon_On_Board(IntToStr(TMine_On_Board(MList[I]).FData.Fitted_Weap_Index));
        end;
      end;
    end
    else
    begin
      for K := 0 to MINEList.Count - 1 do
      begin
        //insert
        Minerec := TFitted_Weapon_On_Board.Create;
        Minerec.FData := TMine_On_Board(MINEList[K]).FData;
        //~~dmTTT.InsertFitted_Weapon_On_Board(3,Minerec);
      end;
    end;
  end
  else
  begin
    for K := 0 to MINEList.Count - 1 do
    begin
      //insert
      Minerec := TFitted_Weapon_On_Board.Create;
      Minerec.FData := TMine_On_Board(MINEList[K]).FData;
      Minerec.FData.Vehicle_Index := v_id;
      //~~dmTTT.InsertFitted_Weapon_On_Board(3,Minerec);
    end;
  end;
end;

procedure TfrmSummaryResourceAllocation.getMissle;
var  I,K,L,id_MisInstance : Integer;
     MList            : TList;
     MisRec           : TFitted_Weapon_On_Board;
     LaunchRec        : TFitted_Weap_Launcher_On_Board;
     Hybrid_miss      : THybrid_On_Board;
     isSaved          : Boolean;
begin
  if not isNew then
  begin
    MList := TList.Create;
    Hybrid_miss := THybrid_On_Board.Create;
    dmTTT.getAllMissile_OnBoard2(v_id, 0, MList);
    if MList.Count > 0 then
    begin
      for I := 0 to MList.Count - 1 do
      begin
        isSaved := False;
        for K := 0 to MISSLList.Count - 1 do
        begin
          id_MisInstance := TMissile_On_Board(MISSLList[K]).FData.Fitted_Weap_Index;
          if id_MisInstance = TMissile_On_Board(MList[I]).FData.Fitted_Weap_Index then
          begin
            //update
            MisRec := TFitted_Weapon_On_Board.Create;
            MisRec.FData := TMissile_On_Board(MISSLList[K]).FData;
            if dmTTT.GetHybrid_ByMissile(TMissile_On_Board(MISSLList[K]).FDef.Missile_Index,Hybrid_miss) then
            begin
              //using hybrid ID
              MisRec.FData.Hybrid_Index := Hybrid_miss.FData.Hybrid_Index;
              dmTTT.UpdateFitted_Weapon_OnBoard(IntToStr(id_MisInstance),4,MisRec.FData);
            end
            else
            begin
              //using missile ID
              dmTTT.UpdateFitted_Weapon_OnBoard(IntToStr(id_MisInstance),1,MisRec.FData);
            end;

            //launcher
            dmTTT.DeleteFitted_Weap_Launcher_On_Board(0,IntToStr(id_MisInstance),'');
            for L := 0 to TMissile_On_Board(MISSLList[K]).FLaunchs.Count - 1 do
            begin
              LaunchRec := TFitted_Weap_Launcher_On_Board.Create;
              LaunchRec := TMissile_On_Board(MISSLList[K]).FLaunchs[L];
              dmTTT.InsertFitted_Weap_Launcher_On_Board(LaunchRec.FData);
            end;

            isSaved := True;
            if I < MList.Count - 1 then
              Break;
          end
          else if id_MisInstance = 0 then
          begin
            if not (dmTTT.getWeapon_On_Board(1,v_id,TMissile_On_Board(MISSLList[K]).FData.Instance_Identifier)) then
            begin
              //insert
              MisRec := TFitted_Weapon_On_Board.Create;
              MisRec.FData := TMissile_On_Board(MISSLList[K]).FData;
              if dmTTT.GetHybrid_ByMissile(TMissile_On_Board(MISSLList[K]).FDef.Missile_Index,Hybrid_miss) then
              begin
                //using hybrid ID
                MisRec.FData.Hybrid_Index := Hybrid_miss.FData.Hybrid_Index;
                //~~dmTTT.InsertFitted_Weapon_On_Board(4,MisRec);
              end
              else
              begin
                //~~dmTTT.InsertFitted_Weapon_On_Board(1,MisRec);
              end;

              //~~dmTTT.DeleteFitted_Weap_Launcher_On_Board(0,IntToStr(MisRec.FData.Fitted_Weap_Index),'');
              for L := 0 to TMissile_On_Board(MISSLList[K]).FLaunchs.Count - 1 do
              begin
                LaunchRec := TFitted_Weap_Launcher_On_Board.Create;
                LaunchRec := TMissile_On_Board(MISSLList[K]).FLaunchs[L];
                LaunchRec.FData.Fitted_Weap_Index := MisRec.FData.Fitted_Weap_Index;
                //~~dmTTT.InsertFitted_Weap_Launcher_On_Board(LaunchRec.FData);
              end;

              isSaved := True;
            end;
          end;
        end;
        if not isSaved then
        begin
          //delete
          //~~dmTTT.DeleteFitted_Weap_Launcher_On_Board(0,IntToStr(TMissile_On_Board(MList[I]).FData.Fitted_Weap_Index),'');
          //~~dmTTT.deleteBlind(6,IntToStr(TMissile_On_Board(MList[I]).FData.Fitted_Weap_Index));
          //~~dmTTT.DeleteFitted_Weapon_On_Board(IntToStr(TMissile_On_Board(MList[I]).FData.Fitted_Weap_Index));
        end;
      end;
    end
    else
    begin
      for K := 0 to MISSLList.Count - 1 do
      begin
        //insert
        MisRec := TFitted_Weapon_On_Board.Create;
        MisRec.FData := TMissile_On_Board(MISSLList[K]).FData;
        if dmTTT.GetHybrid_ByMissile(TMissile_On_Board(MISSLList[K]).FDef.Missile_Index,Hybrid_miss) then
        begin
          //using hybrid ID
          MisRec.FData.Hybrid_Index := Hybrid_miss.FData.Hybrid_Index;
          //~~dmTTT.InsertFitted_Weapon_On_Board(4,MisRec);
        end
        else
        begin
          //~~dmTTT.InsertFitted_Weapon_On_Board(1,MisRec);
        end;

        //~~dmTTT.DeleteFitted_Weap_Launcher_On_Board(0,IntToStr(MisRec.FData.Fitted_Weap_Index),'');
        for L := 0 to TMissile_On_Board(MISSLList[K]).FLaunchs.Count - 1 do
        begin
          LaunchRec := TFitted_Weap_Launcher_On_Board.Create;
          LaunchRec := TMissile_On_Board(MISSLList[K]).FLaunchs[L];
          LaunchRec.FData.Fitted_Weap_Index := MisRec.FData.Fitted_Weap_Index;
          //~~dmTTT.InsertFitted_Weap_Launcher_On_Board(LaunchRec.FData);
        end;
      end;
    end;
  end
  else
  begin
    for K := 0 to MISSLList.Count - 1 do
    begin
      MisRec := TFitted_Weapon_On_Board.Create;
      MisRec.FData := TMissile_On_Board(MISSLList[K]).FData;
      MisRec.FData.Vehicle_Index := v_id;
      if dmTTT.GetHybrid_ByMissile(TMissile_On_Board(MISSLList[K]).FDef.Missile_Index,Hybrid_miss) then
      begin
        //using hybrid ID
        MisRec.FData.Hybrid_Index := Hybrid_miss.FData.Hybrid_Index;
        //~~dmTTT.InsertFitted_Weapon_On_Board(4,MisRec);
      end
      else
      begin
        //~~dmTTT.InsertFitted_Weapon_On_Board(1,MisRec);
      end;

      //~~dmTTT.DeleteFitted_Weap_Launcher_On_Board(0,IntToStr(MisRec.FData.Fitted_Weap_Index),'');
      for L := 0 to TMissile_On_Board(MISSLList[K]).FLaunchs.Count - 1 do
      begin
        LaunchRec := TFitted_Weap_Launcher_On_Board.Create;
        LaunchRec := TMissile_On_Board(MISSLList[K]).FLaunchs[L];
        LaunchRec.FData.Fitted_Weap_Index := MisRec.FData.Fitted_Weap_Index;
        //~~dmTTT.InsertFitted_Weap_Launcher_On_Board(LaunchRec.FData);
      end;
    end;
  end;
end;

procedure TfrmSummaryResourceAllocation.getOverlay;
var  I,K,id_OvLay : Integer;
     MList: TList;
     idOver : string;
     OVERLAYrec: TOverlay_Definition;
     isSaved : Boolean;
begin
  if not isNew then
  begin
    MList := TList.Create;
    dmTTT.GetOverlay_Definition(id_OvLay,MList);
    if MList.Count > 0 then
    begin
      for I := 0 to MList.Count - 1 do
      begin
        isSaved := False;
        for K := 0 to OVERList.Count - 1 do
        begin
         // OVERLAYrec := TOverlay_Definition(OVERList[K]).FData.Overlay_Index;
         { if OVERLAYrec = TOverlay_Definition(MList[I]).FData.Overlay_Index then
          begin
            //update
            OVERLAYrec := TOverlay_Definition.Create;
            OVERLAYrec.FData := TOverlay_Definition(OVERList[K]).FData;
         //   dmTTT.updateOverlay_Definition(IntToStr(OVERLAYrec.FData.Overlay_Index),idOver);

            isSaved := True;
            if I < MList.Count - 1 then
              Break;
          end
          else if id_OvLay = 0 then
          begin
           // if not dmTTT.GetOverlay_Definition(StrToInt(idOver),OVERList) then
            begin
              //insert
              OVERLAYrec := TOverlay_Definition.Create;
              OVERLAYrec.FData := TOverlay_Definition(OVERList[K]).FData;
             // dmTTT.insertOverlay_Definition();

              isSaved := True;
            end;
          end;  }
        end;
        if not isSaved then
        begin
          //delete
          dmTTT.DeleteOverlay_Definition(IntToStr(TOverlay_Definition(MList[I]).FData.Overlay_Index));
        end;
      end;
    end
    else
    begin
      for K := 0 to OVERList.Count - 1 do
      begin
        //insert
        OVERLAYrec := TOverlay_Definition.Create;
        OVERLAYrec.FData := TOverlay_Definition(OVERList[K]).FData;
      //  dmTTT.insertOverlay_Definition(OVERLAYrec);
      end;
    end;
  end
  else
  begin
    for K := 0 to OVERList.Count - 1 do
    begin
      //insert
      OVERLAYrec := TOverlay_Definition.Create;
      OVERLAYrec.FData := TOverlay_Definition(OVERList[K]).FData;
      OVERLAYrec.FData.Overlay_Index := id_OvLay;
     // dmTTT.insertOverlay_Definition(OVERLAYrec);
    end;
  end;
end;

procedure TfrmSummaryResourceAllocation.getPredefined;
var  I,K,id_PreFined : Integer;
     MList: TList;
     PreFinrec: TPredefined_Pattern;
     isSaved : Boolean;
begin
  if not isNew then
  begin
    MList := TList.Create;
    dmTTT.GetPredefined_Pattern(v_id,MList,PreFinrec);
    if MList.Count > 0 then
    begin
      for I := 0 to MList.Count - 1 do
      begin
        isSaved := False;
        for K := 0 to PREList.Count - 1 do
        begin
          id_PreFined := TPredefined_Pattern(PREList[K]).FData.Pattern_Index;
          if id_PreFined = TPredefined_Pattern(MList[I]).FData.Pattern_Index then
          begin
            //update
            PreFinrec := TPredefined_Pattern.Create;
            PreFinrec.FData := TPredefined_Pattern(PREList[K]).FData;
            dmTTT.UpdatePredefined_Pattern(IntToStr(PreFinrec.FData.Pattern_Index),PreFinrec);

            isSaved := True;
            if I < MList.Count - 1 then
              Break;
          end
          else if id_PreFined = 0 then
          begin
            if not (dmTTT.getWeapon_On_Board(1,v_id,TMine_On_Board(PREList[K]).FData.Instance_Identifier)) then
            begin
              //insert
              PreFinrec := TPredefined_Pattern.Create;
              PreFinrec.FData := TPredefined_Pattern(PREList[K]).FData;
              dmTTT.insertPredifened_Pattern(PreFinrec);

              isSaved := True;
            end;
          end;
        end;
        if not isSaved then
        begin
          //delete
          dmTTT.DeleteFitted_Weapon_On_Board(IntToStr(TMine_On_Board(MList[I]).FData.Fitted_Weap_Index));
        end;
      end;
    end
    else
    begin
      for K := 0 to PREList.Count - 1 do
      begin
        //insert
        PreFinrec := TPredefined_Pattern.Create;
        PreFinrec.FData := TPredefined_Pattern(PREList[K]).FData;
        dmTTT.insertPredifened_Pattern(PreFinrec);
      end;
    end;
  end
  else
  begin
    for K := 0 to PREList.Count - 1 do
    begin
      //insert
      PreFinrec := TPredefined_Pattern.Create;
      PreFinrec.FData := TPredefined_Pattern(PREList[K]).FData;
      PreFinrec.FData.Vehicle_Index := v_id;
      dmTTT.insertPredifened_Pattern(PreFinrec);
    end;
  end;
end;

procedure TfrmSummaryResourceAllocation.btnOverlaysResourcesClick(
  Sender: TObject);
begin
  colorOfForce := getForcedesignation;
  frmOverlayResourceAllocationPickList.ShowModal;
end;

procedure TfrmSummaryResourceAllocation.btnPredifenedPatternsClick(Sender: TObject);
begin
  fPredefinedSelect.ShowModal;
end;

procedure TfrmSummaryResourceAllocation.getAllPlatform;
begin
   getRuntimePlatform;
   getVehicle;
   getWeapon;
   getSattelite;
   getSonobuoy;
end;

procedure TfrmSummaryResourceAllocation.getAllResource;
begin
   getReferencePoint;  //masih ada cendol
   getPredefined;
   getOverlay;
   getIntervaList;
   getCommchanel;
end;

procedure TfrmSummaryResourceAllocation.getCommchanel;
var  I,K,id_CommList : Integer;
     MList: TList;
     Commrec: TExternal_Communication_Channel;
     extrec : TRecExternal_Communication_Channel;
     isSaved : Boolean;
     id_comm : string;
begin
  if not isNew then
  begin
    MList := TList.Create;
    dmTTT.GetExternal_Communication_Channel(MList
    ,'',IntToStr(id_CommList),Commrec);
    if MList.Count > 0 then
    begin
      for I := 0 to MList.Count - 1 do
      begin
        isSaved := False;
        for K := 0 to CommList.Count - 1 do
        begin
          id_CommList := TExternal_Communication_Channel(CommList[K]).FData.Comms_Channel_Index;
          if id_CommList = TExternal_Communication_Channel(MList[I]).FData.Comms_Channel_Index then
          begin
            //update
            Commrec := TExternal_Communication_Channel.Create;
            Commrec.FData := TExternal_Communication_Channel(CommList[K]).FData;
            dmTTT.updateComm(extrec,id_comm);

            isSaved := True;
            if I < MList.Count - 1 then
              Break;
          end
          else if id_CommList = 0 then
          begin
            {if not (dmTTT.GetExternal_Communication_Channel(MList,'',IntToStr(id_CommList),Commrec)) then
            begin
              //insert
              Commrec := TExternal_Communication_Channel.Create;
              Commrec.FData := TExternal_Communication_Channel(CommList[K]).FData;
              dmTTT.insertComm(extrec);

              isSaved := True;
            end; }
          end;
        end;
        if not isSaved then
        begin
          //delete
          dmTTT.DeleteExternal_Communication_Channel(IntToStr(TExternal_Communication_Channel(MList[I]).FData.Comms_Channel_Index));
        end;
      end;
    end
    else
    begin
      for K := 0 to CommList.Count - 1 do
      begin
        //insert
        Commrec := TExternal_Communication_Channel.Create;
        Commrec.FData := TExternal_Communication_Channel(CommList[K]).FData;
        dmTTT.insertComm(extrec);
      end;
    end;
  end
  else
  begin
    for K := 0 to CommList.Count - 1 do
    begin
      //insert
      Commrec := TExternal_Communication_Channel.Create;
      Commrec.FData := TExternal_Communication_Channel(TERVAList[K]).FData;
      Commrec.FData.Comms_Channel_Index := id_CommList;
      dmTTT.insertComm(extrec);
    end;
  end;
end;

procedure TfrmSummaryResourceAllocation.getData;
var game_start : TDateTime; fmt: TFormatSettings;
begin
  with ra.FData do begin
    Allocation_Identifier  := edtName.Text;
    if idEnvi <> '' then
      Game_Enviro_Index      := StrToInt(idEnvi)
    else
      Game_Enviro_Index      := ra.FData.Game_Enviro_Index;

    if idGDef <> '' then
      Defaults_Index         := StrToInt(idGDef)
    else
      Defaults_Index         := ra.FData.Defaults_Index;

    if idStuRole <> '' then
      Role_List_Index        := StrToInt(idStuRole)
    else
      Role_List_Index        := ra.FData.Role_List_Index;

    fmt.ShortDateFormat := 'dd/mm/yyyy';
    fmt.DateSeparator   := '/';
    fmt.LongTimeFormat  := 'hh:nn:ss';
    fmt.TimeSeparator   := ':';
    game_start          := StrToDateTime(edtStartTime.Text, fmt);
    Game_Start_Time     := game_start;
    lbTextTime.Caption  := FormatDateTime('ddd, dd mmmm yyyy hh:nn:ss', StrToDateTime(edtStartTime.Text, fmt));
  end;
end;

procedure TfrmSummaryResourceAllocation.btnRadarIntervalListsClick(Sender: TObject);
begin
 { fDBEditor.index := 3;
  fOtherSingle.Show; }
  fRadarIntervalSelect.ShowModal;
end;

procedure TfrmSummaryResourceAllocation.btnReferencePointsResourcesClick(
  Sender: TObject);
var id_envi: Integer;
begin

  if idEnvi <> '' then
    id_envi := StrToInt(idEnvi)
  else
    id_envi := ra.FData.Game_Enviro_Index;

  fReferencePointEditor.rList.Clear;
  dmTTT.getGame_Area_By_Envi(IntToStr(id_envi), fReferencePointEditor.rList, fReferencePointEditor.game_area);

  fReferencePointEditor.ra_id := ra_id;
  fReferencePointEditor.force := getForcedesignation;
  fReferencePointEditor.ShowModal;
end;

procedure TfrmSummaryResourceAllocation.btnRuntimePlatformLibrariesClick(
  Sender: TObject);
begin
  frmRPLResourceAllocationPickList.ShowModal;
end;

procedure TfrmSummaryResourceAllocation.btnSateliteClick(Sender: TObject);
begin
  ForceChoose;
  fSatellite.show_from := fromRA;
  fSatellite.ShowModal;
end;

procedure TfrmSummaryResourceAllocation.btnSonobuoyClick(Sender: TObject);
begin
  ForceChoose;
  fSonobuoySelect.show_from := fromRA;
  fSonobuoySelect.ShowModal;
end;

procedure TfrmSummaryResourceAllocation.btnStudentRoleListClick(Sender: TObject);
begin
  with fStudentRole do
  begin
    ShowModal;
  end;
end;

procedure TfrmSummaryResourceAllocation.btnTorpedoClick(Sender: TObject);
begin
  ForceChoose;
//  frmTorpedoOnBoardPickList.show_from := fromRA;
  frmTorpedoOnBoardPickList.ShowModal;
end;

procedure TfrmSummaryResourceAllocation.btnVehicleClick(Sender: TObject);
begin
//  fVehicleSelect.fromRuntime := False;
  ForceChoose;
  fVehicleSelect.id_form := fromRA;
  //fVehicleAttributeWindow.fromVehicle := False;
  fVehicleSelect.ShowModal;
end;

procedure TfrmSummaryResourceAllocation.edtNameChange(Sender: TObject);
begin
  if (edtName.Text = '[Noname]') or (edtName.Text = '') or (idEnvi = '') or (idGDef = '') or (idStuRole = '') then
  begin
    btnApply.Enabled := False;
    btnOK.Enabled := False;
  end
  else
    btnApply.Enabled  := True;
end;

procedure TfrmSummaryResourceAllocation.ForceChoose;
begin
  if rbRedPlatforms.Checked = true then
    begin
      force := 1;
    end
  else if rbAmberPlatforms.Checked = true then
    begin
      force := 2;
    end
  else if rbBluePlatforms.Checked = true then
    begin
      force :=3;
    end
  else if rbGreenPlatforms.Checked = true then
    begin
      force := 4;
    end
  else if rbNoPlatforms.Checked = true then
    begin
      force := 6;
    end;
end;

procedure TfrmSummaryResourceAllocation.ForceChooseResources;
begin
  if rbRedResources.Checked = true then
    begin
      fChannelComList.Caption := 'Red Communication Channel';
    end
  else if rbAmberResources.Checked = true then
    begin
      fChannelComList.Caption := 'Amber Communication Channel';
    end
  else if rbBlueResources.Checked = true then
    begin
      fChannelComList.Caption := 'Blue Communication Channel';
    end
  else if rbGreenResources.Checked = true then
    begin
      fChannelComList.Caption := 'Green Communication Channel';
    end
  else if rbNoForceResources.Checked = true then
    begin
      fChannelComList.Caption := 'No Force Communication Channel';
    end;
end;

procedure TfrmSummaryResourceAllocation.FormCreate(Sender: TObject);
begin
  GameEnviroDef := TGame_Environment_Definition.Create;
  Role_List     := TStudent_Role_List.Create;
  ra            := TResource_Allocation.Create;
end;

procedure TfrmSummaryResourceAllocation.FormShow(Sender: TObject);
begin
  PageControl1.Pages[0].Show;
  getRAData;
  edtNameChange(Sender);
  if isNew = False then
    EnableButton;
end;

procedure TfrmSummaryResourceAllocation.getRA;
begin
  dmTTT.GetResourceAlloc(ra_id, ra);
end;

procedure TfrmSummaryResourceAllocation.getEnvironment;
begin
  with SIMMgr do
  begin
    GetGame_Environment_Definition(ra.FData.Game_Enviro_Index, GameEnviroDef);
  end;
end;

procedure TfrmSummaryResourceAllocation.getDefault;
begin
  dmTTT.GetGame_Defaults(ra.FData.Resource_Alloc_Index, Default);
end;

procedure TfrmSummaryResourceAllocation.getRAData;
var
  I: Integer;
begin
  if isNew then
  begin
    LoadFF_dBaseSetting(vSettingFile, vDBSetting);
    dmTTT.GetAllGame_Defaults(StrToInt(vDBSetting.dbGameDefault),fGameDefaults.sList);

    ra := TResource_Allocation.Create;
    edtName.Text := '[Noname]';
    lbTextTime.Caption := formatdatetime('ddd, dd mmmm yyyy hh:nn:ss',now);
    edtStartTime.Text := formatdatetime('dd/mm/yyyy hh:nn:ss', now);
    edtEnvironment.Text := '[None]';
    edtDefaults.Text := '[None]';
    idEnvi := '';
    idGDef := '';
    idStuRole := '';
   { for I := 0 to fGameDefaults.sList.Count - 1 do
    begin
      edtDefaults.Text := TGame_Defaults(fGameDefaults.sList[I]).FData.Defaults_Identifier;
      idGDef := IntToStr(TGame_Defaults(fGameDefaults.sList[I]).FData.Defaults_Index);
    end;    }
  end
  else
  begin
    {
    getRA;
    edtName.Text := ra.FData.Allocation_Identifier;
    //edtStartTime.Text := FloatToStr(ra.FData.Game_Start_Time);
    }
    getRA;
    with ra.FData do
    begin

      lbTextTime.Caption := formatdatetime('ddd, dd mmmm yyyy hh:nn:ss', Game_Start_Time);
      edtStartTime.Text := formatdatetime('dd/mm/yyyy hh:nn:ss', Game_Start_Time);

      getEnvironment;
      if Game_Enviro_Index > 1 then
      begin
        edtEnvironment.Text := GameEnviroDef.FData.Game_Enviro_Identifier;
        idEnvi := IntToStr(Game_Enviro_Index);
      end
      else begin
        edtEnvironment.Text := '[None]';
        idEnvi := '';
      end;

      getDefault;
      if Defaults_Index > 1 then
      begin
        edtDefaults.Text := Default.Defaults_Identifier;
        idGDef := IntToStr(Defaults_Index);
      end
      else begin
        edtDefaults.Text := '[None]';
        idGDef := '';
      end;

      idStuRole := IntToStr(Role_List_Index);

      if isCopy then
      begin
        edtName.Text := 'Copy of '+ ra.FData.Allocation_Identifier;
        isNew := True;
        btnApply.Enabled  := true;
      end
      else begin
        edtName.Text := ra.FData.Allocation_Identifier;
        btnApply.Enabled  := false;
      end;
    end;

//    getEnvironment;
//    edtEnvironment.Text := GameEnviroDef.FData.Game_Enviro_Identifier;
//    getDefault;
//    edtDefaults.Text := Default.Defaults_Identifier;
    fGameDefaults.idGDSelected := IntToStr(Default.Defaults_Index);
  end;
end;

procedure TfrmSummaryResourceAllocation.getReferencePoint;
var  I,K,id_RefPoin : Integer;
     MList: TList;
     RefPorec: TReference_Point;
     isSaved : Boolean;
     idRef : string;
     ra_id,force : Integer;
     ref_point: TRecReference_Point;
begin
  if not isNew then
  begin
    MList := TList.Create;
    dmTTT.getAllReference_Point(ra_id,force,MList);
    if MList.Count > 0 then
    begin
      for I := 0 to MList.Count - 1 do
      begin
        isSaved := False;
        for K := 0 to REFList.Count - 1 do
        begin
          id_RefPoin := TReference_Point(REFList[K]).FData.Reference_Index;
          if id_RefPoin = TReference_Point(MList[I]).FData.Reference_Index then
          begin
            //update
            RefPorec := TReference_Point.Create;
            RefPorec := TReference_Point(REFList[K]);
            dmTTT.updateReference(ref_point,idRef);

            isSaved := True;
            if I < MList.Count - 1 then
              Break;
          end
          else if id_RefPoin = 0 then
          begin
           { if not dmTTT.getAllReference_Point(ra_id,force,MList) then }
            begin
              //insert
              RefPorec := TReference_Point.Create;
              RefPorec := TReference_Point(REFList[K]);
              dmTTT.insertReference(ref_point);

              isSaved := True;
            end;
          end;
        end;
        if not isSaved then
        begin
          //delete
          dmTTT.DeleteReference_Point(ra_id, force);
        end;
      end;
    end
    else
    begin
      for K := 0 to REFList.Count - 1 do
      begin
        //insert
        RefPorec := TReference_Point.Create;
        RefPorec := TReference_Point(REFList[K]);
        dmTTT.insertReference(ref_point);
      end;
    end;
  end
  else
  begin
    for K := 0 to REFList.Count - 1 do
    begin
      //insert
      RefPorec := TReference_Point.Create;
      RefPorec := TReference_Point(REFList[K]);
      RefPorec.FData.Reference_Index := v_id;
      dmTTT.insertReference(ref_point);
    end;
  end;
end;

procedure TfrmSummaryResourceAllocation.getRuntimePlatform;
var  I,K,L,id_RPlatform : Integer;
     MList,tempList,RPList   : TList;
     RP_id  : string;
     rec_rplib        : TRuntime_Platform_Library;
     RPrec            : TResource_Library_Mapping;
     isSaved          : Boolean;
begin
  if not isNew then
  begin
    MList := TList.Create;
    RPrec := TResource_Library_Mapping.Create;
    dmTTT.GetLibrary_MappingByRA(0,v_id,MList);
    if MList.Count > 0 then
    begin
      for I := 0 to MList.Count - 1 do
      begin
        isSaved := False;
        for K := 0 to RPList.Count - 1 do
        begin
          id_RPlatform := TResource_Library_Mapping(RPList[K]).FData.Library_Index;
          if id_RPlatform = TResource_Library_Mapping(MList[I]).FData.Library_Index then
          begin
            //tdk ada update,langsung insert
            isSaved := True;
            if I < MList.Count - 1 then
              Break;
          end
          else if id_RPlatform = 0 then
          begin
            RPrec := TResource_Library_Mapping.Create;
            if not dmTTT.GetLibrary_MappingByRA(0,v_id,MList) then
            begin
              //insert
              RPrec := TResource_Library_Mapping.Create;
              RPrec := TResource_Library_Mapping(RPList[K]);
              dmTTT.InsertRuntime_Platform_LibraryByResourceAlloc(IntToStr(ra_id),rec_rplib);

              isSaved := True;
            end;
          end;
        end;
        if not isSaved then
        begin
          //delete
          dmTTT.DeleteRuntime_Platform_LibraryByResourceAlloc(RP_id);
        end;
      end;
    end
    else
    begin
      for K := 0 to RPList.Count - 1 do
      begin
        //insert
        RPrec := TResource_Library_Mapping.Create;
        RPrec := TResource_Library_Mapping(RPList[K]);
        dmTTT.InsertRuntime_Platform_LibraryByResourceAlloc(IntToStr(ra_id),rec_rplib);
      end;
    end;
  end
  else
  begin
    for K := 0 to RPList.Count - 1 do
    begin
      RPrec := TResource_Library_Mapping.Create;
      RPrec := TResource_Library_Mapping(RPList[K]);
      RPrec.FData.Library_Index := v_id;
      dmTTT.InsertRuntime_Platform_LibraryByResourceAlloc(IntToStr(ra_id),rec_rplib);
    end;
  end;
end;

procedure TfrmSummaryResourceAllocation.getSattelite;
var  I,K,id_Sat : Integer;
     MList : TList;
     Satrec: TSatellite_Definition;
     isSaved : Boolean;
     pi      : TPlatform_Instance;
begin
  if not isNew then
  begin
    MList := TList.Create;
//    dmTTT.GetSatellite_Definition(pi.Satellite.FData.Satellite_Index, Pi.Satellite);
    if MList.Count > 0 then
    begin
      for I := 0 to MList.Count - 1 do
      begin
        isSaved := False;
        for K := 0 to SATList.Count - 1 do
        begin
          id_Sat := TSatellite_Definition(SATList[K]).FPI.Satellite_Index;
          if id_Sat = TSatellite_Definition(MList[I]).FPI.Satellite_Index then
          begin
            //update
            Satrec := TSatellite_Definition.Create;
            Satrec := TSatellite_Definition(SATList[K]);
//            dmTTT.updateSatellite_Def(Satrec,idSat);

            isSaved := True;
            if I < MList.Count - 1 then
              Break;
          end
          else if id_Sat = 0 then
          begin
//            if not (dmTTT.GetSatellite_Definition(pi.Satellite.FData.Satellite_Index, Pi.Satellite)) then
//            begin
//              //insert
//              Satrec := TSatellite_Definition.Create;
//              Satrec := TSatellite_Definition(SATList[K]);
//              dmTTT.insertSatellite_Def(Satrec);
//
//              isSaved := True;
//            end;
          end;
        end;
        if not isSaved then
        begin
          //delete
//          dmTTT.deleteSatellite_Def(id_Sat);
        end;
      end;
    end
    else
    begin
      for K := 0 to SONOList.Count - 1 do
      begin
        //insert
        Satrec := TSatellite_Definition.Create;
        Satrec := TSatellite_Definition(SATList[K]);
//        dmTTT.insertSatellite_Def(Satrec);
      end;
    end;
  end
  else
  begin
    for K := 0 to SONOList.Count - 1 do
    begin
      //insert
      Satrec := TSatellite_Definition.Create;
      Satrec := TSatellite_Definition(SATList[K]);
      Satrec.FData.Satellite_Index := v_id;
//      dmTTT.insertSatellite_Def(Satrec);
    end;
  end;
end;

procedure TfrmSummaryResourceAllocation.getSonobuoy;
var  I,K,id_SonoInstance : Integer;
     MList: TList;
     Sonorec: TSonobuoy_On_Board;
     isSaved : Boolean;
begin
  if not isNew then
  begin
    MList := TList.Create;
    dmTTT.getAllSonobuoy_On_Board(v_id, 0, MList);
    if MList.Count > 0 then
    begin
      for I := 0 to MList.Count - 1 do
      begin
        isSaved := False;
        for K := 0 to SONOList.Count - 1 do
        begin
          id_SonoInstance := TSonobuoy_On_Board(SONOList[K]).FData.Sonobuoy_Instance_Index;
          if id_SonoInstance = TSonobuoy_On_Board(MList[I]).FData.Sonobuoy_Instance_Index then
          begin
            //update
            Sonorec := TSonobuoy_On_Board.Create;
            Sonorec := TSonobuoy_On_Board(SONOList[K]);
            dmTTT.UpdateSonobuoy_On_Board(IntToStr(id_SonoInstance),Sonorec);

            isSaved := True;
            if I < MList.Count - 1 then
              Break;
          end
          else if id_SonoInstance = 0 then
          begin
            if not (dmTTT.getSensor_On_Board(8,v_id,TSonobuoy_On_Board(SONOList[K]).FData.Instance_Identifier)) then
            begin
              //insert
              Sonorec := TSonobuoy_On_Board.Create;
              Sonorec := TSonobuoy_On_Board(SONOList[K]);
              dmTTT.InsertSonobuoy_On_Board(Sonorec);

              isSaved := True;
            end;
          end;
        end;
        if not isSaved then
        begin
          //delete
          dmTTT.DeleteSonobuoy_On_Board(IntToStr(TSonobuoy_On_Board(MList[I]).FData.Sonobuoy_Instance_Index));
        end;
      end;
    end
    else
    begin
      for K := 0 to SONOList.Count - 1 do
      begin
        //insert
        Sonorec := TSonobuoy_On_Board.Create;
        Sonorec := TSonobuoy_On_Board(SONOList[K]);
        dmTTT.InsertSonobuoy_On_Board(Sonorec);
      end;
    end;
  end
  else
  begin
    for K := 0 to SONOList.Count - 1 do
    begin
      //insert
      Sonorec := TSonobuoy_On_Board.Create;
      Sonorec := TSonobuoy_On_Board(SONOList[K]);
      Sonorec.FData.Vehicle_Index := v_id;
      dmTTT.InsertSonobuoy_On_Board(Sonorec);
    end;
  end;
end;

procedure TfrmSummaryResourceAllocation.getTorpedo;
var  I,K,L,id_TorpInstance : Integer;
     MList            : TList;
     TorRec           : TFitted_Weapon_On_Board;
     LaunchRec        : TFitted_Weap_Launcher_On_Board;
     isSaved          : Boolean;
begin
  if not isNew then
  begin
    MList := TList.Create;
    dmTTT.getAllTorpedo_OnBoard(v_id, 0, MList);
    if MList.Count > 0 then
    begin
      for I := 0 to MList.Count - 1 do
      begin
        isSaved := False;
        for K := 0 to TORPList.Count - 1 do
        begin
          id_TorpInstance := TTorpedo_On_Board(TORPList[K]).FData.Fitted_Weap_Index;
          if id_TorpInstance = TTorpedo_On_Board(MList[I]).FData.Fitted_Weap_Index then
          begin
            //update
            TorRec := TFitted_Weapon_On_Board.Create;
            TorRec.FData := TTorpedo_On_Board(TORPList[K]).FData;
            dmTTT.UpdateFitted_Weapon_OnBoard(IntToStr(id_TorpInstance),2,TorRec.FData);

            //launcher
            dmTTT.DeleteFitted_Weap_Launcher_On_Board(0,IntToStr(id_TorpInstance),'');
            for L := 0 to TTorpedo_On_Board(TORPList[K]).FLaunchs.Count - 1 do
            begin
              LaunchRec := TFitted_Weap_Launcher_On_Board.Create;
              LaunchRec := TTorpedo_On_Board(TORPList[K]).FLaunchs[L];
              dmTTT.InsertFitted_Weap_Launcher_On_Board(LaunchRec.FData);
            end;

            isSaved := True;
            if I < MList.Count - 1 then
              Break;
          end
          else if id_TorpInstance = 0 then
          begin
            if not (dmTTT.getWeapon_On_Board(1,v_id,TTorpedo_On_Board(TORPList[K]).FData.Instance_Identifier)) then
            begin
              //insert
              TorRec := TFitted_Weapon_On_Board.Create;
              TorRec.FData := TTorpedo_On_Board(TORPList[K]).FData;
              //~~dmTTT.InsertFitted_Weapon_On_Board(2,TorRec);

              //~~dmTTT.DeleteFitted_Weap_Launcher_On_Board(0,IntToStr(TorRec.FData.Fitted_Weap_Index),'');
              for L := 0 to TTorpedo_On_Board(TORPList[K]).FLaunchs.Count - 1 do
              begin
                LaunchRec := TFitted_Weap_Launcher_On_Board.Create;
                LaunchRec := TTorpedo_On_Board(TORPList[K]).FLaunchs[L];
                LaunchRec.FData.Fitted_Weap_Index := TorRec.FData.Fitted_Weap_Index;
                //~~dmTTT.InsertFitted_Weap_Launcher_On_Board(LaunchRec.FData);
              end;

              isSaved := True;
            end;
          end;
        end;
        if not isSaved then
        begin
          //delete
          dmTTT.DeleteFitted_Weap_Launcher_On_Board(0,IntToStr(TTorpedo_On_Board(MList[I]).FData.Fitted_Weap_Index),'');
          dmTTT.deleteBlind(6,IntToStr(TTorpedo_On_Board(MList[I]).FData.Fitted_Weap_Index));
          dmTTT.DeleteFitted_Weapon_On_Board(IntToStr(TTorpedo_On_Board(MList[I]).FData.Fitted_Weap_Index));
        end;
      end;
    end
    else
    begin
      for K := 0 to TORPList.Count - 1 do
      begin
        //insert
        TorRec := TFitted_Weapon_On_Board.Create;
        TorRec.FData := TTorpedo_On_Board(TORPList[K]).FData;
        //~~dmTTT.InsertFitted_Weapon_On_Board(2,TorRec);

        //~~dmTTT.DeleteFitted_Weap_Launcher_On_Board(0,IntToStr(TorRec.FData.Fitted_Weap_Index),'');
        for L := 0 to TTorpedo_On_Board(TORPList[K]).FLaunchs.Count - 1 do
        begin
          LaunchRec := TFitted_Weap_Launcher_On_Board.Create;
          LaunchRec := TTorpedo_On_Board(TORPList[K]).FLaunchs[L];
          LaunchRec.FData.Fitted_Weap_Index := TorRec.FData.Fitted_Weap_Index;
          //~~dmTTT.InsertFitted_Weap_Launcher_On_Board(LaunchRec.FData);
        end;
      end;
    end;
  end
  else
  begin
    for K := 0 to TORPList.Count - 1 do
    begin
      TorRec := TFitted_Weapon_On_Board.Create;
      TorRec.FData := TTorpedo_On_Board(TORPList[K]).FData;
      TorRec.FData.Vehicle_Index := v_id;
      //~~dmTTT.InsertFitted_Weapon_On_Board(2,TorRec);

      //~~dmTTT.DeleteFitted_Weap_Launcher_On_Board(0,IntToStr(TorRec.FData.Fitted_Weap_Index),'');
      for L := 0 to TTorpedo_On_Board(TORPList[K]).FLaunchs.Count - 1 do
      begin
        LaunchRec := TFitted_Weap_Launcher_On_Board.Create;
        LaunchRec := TTorpedo_On_Board(TORPList[K]).FLaunchs[L];
        LaunchRec.FData.Fitted_Weap_Index := TorRec.FData.Fitted_Weap_Index;
        //~~dmTTT.InsertFitted_Weap_Launcher_On_Board(LaunchRec.FData);
      end;
    end;
  end;
end;

procedure TfrmSummaryResourceAllocation.getVehicle;
begin
  // underconstruction
end;

procedure TfrmSummaryResourceAllocation.getWeapon;
begin
  // underconstruction
  getMissle;
  getTorpedo;
  getMine;
end;

end.
