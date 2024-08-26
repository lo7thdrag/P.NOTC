unit uSimDBEditor;


interface

 uses  Controls, Classes,uDBAssetObject,tttData,uDBScenario,sysutils,
  uDBFormation,uDBAsset_GameEnvironment,uDBGame_Defaults,uT3SimManager,uDBAsset_Weapon,
  newClassASTT, uDBAsset_Satellite, uDBAsset_MotionCharacteristics,
  uDBAsset_Radar, uDBAsset_Sensor, uDBAsset_Sonobuoy, uDBAsset_Sonar, uDBAsset_Vehicle;//,uDBStudentRole;

 procedure StartInitialize;
 procedure getPLatforms(var sclist:Tlist);
 procedure getEnvironments(var sclist:Tlist);
 procedure getDefaults(var sclist:TList;var rec:TGame_Defaults);
 procedure getAllVehicles(var sclist:Tlist;id:integer;var rec:TVehicle_Definition);
 procedure getAllMissile(const id:integer;var mList:TList;var rec: TMissile_On_Board);
 procedure getAllTorpedo (const id:integer;var mList:TList;var rec: TTorpedo_On_Board);
 procedure getAllMine (const id:integer;var mList:TList;var rec: TMine_On_Board);
 procedure getAllSatellite (const id:integer;var sList:TList;var rec: TSatellite_Definition);
 procedure getRA(const index,ra_id,force:integer;var pList:TList);
 procedure getRAVehicle(const v_id,ra_id:integer;var PLatform_Insts:TList;psForce,psCategory:integer);
 procedure getPIMissile(ra_id,force:integer;const instance:string;var pList:TList);
 procedure getResourceAllocation(var raList:TList);
 procedure getGameArea(id:string;gList:TList;var rec:TGame_Environment_Definition);
 procedure getDBResourceAllocation(id:integer;raList:TList;var rec: TResource_Allocation );
 procedure getDBEnvironments(id:integer;pList:TList;var rec: TGame_Environment_Definition );
 procedure getPlatformInstance(resourceAllocIndex:integer;var PLatform_Insts:TList;psForce,psCategory:integer);
 procedure setFocusedPlatform(idPlatform:integer);
 function getfocusedPlatform: integer;
 procedure updatePlatformInstance(rec: TList);
 procedure deletePlatformInstance(id:string);
 procedure storePlatformInstance(var pf : TRecPlatform_Activation);
 procedure GetGame_Environment_Definition(const id: integer;
        var rec: TGame_Environment_Definition);

 //procedure getGameArea;
 procedure getGameAreaList(var GameArea : TList);
 procedure deleteGameArea(id : Integer);
 //procedure getFormation;
 procedure getFormationAssignment(var fAssign: TFormation; var Formation_Insts:TList);

 procedure insertFormation_Def(formationDef : TFormation);
 procedure updateFormation_Def(formationDef: TFormation; idDeploy: String);
 procedure updateFormation_Assignment(rec: TFormation; form_id: string;pi_id:string);
 procedure deleteFormation_Assignment(form_id: string; pi_id:string);
 procedure insertFormation_Assignment(formationAss : TFormation);
 procedure getFormationDefinition(const id: Integer; var aRec: TList);

 procedure updateGameArea(Game_Area: TGame_Environment_Definition ; id: String);
 procedure updateGameEnvironment(Game_Area: TGame_Environment_Definition ; id: String);

 function insertGameEnvironment(Game_Enf_def: TGame_Environment_Definition): TGame_Environment_Definition;

 //scenario
 procedure insertScenario(rec: TScenario_Definition);
 procedure updateScenario(rec: TScenario_Definition; id: string);

 //resource allocation
 procedure insertResource(rec: TResource_Allocation);

 //insert game_area
 function insertGameAreaDef(rec: TGame_Environment_Definition):Integer;
 procedure updateGameAreaDef(rec: TGame_Environment_Definition; id: string);

 //satellite
 procedure getSatellite_Definition(const id: integer; var rec: TSatellite_Definition);
 procedure insertSatellite_Def(rec: TSatellite_Definition);
 procedure updateSatellite_Def(rec: TSatellite_Definition; id: string);
 procedure deleteSatellite_Def(id : Integer);

 //motion
 procedure getMotion_Characteristics(const id: integer;var rec: TMotion_Characteristics);
 procedure getAllMotion_Characteristics(mList : TList);
 procedure insertMotion(rec: TMotion_Characteristics);
 procedure updateMotion(rec: TMotion_Characteristics; index: string);
 procedure deleteMotion(id : Integer);

 //radar
 procedure getAllRadar_On_Board(const id: integer; var aRec: TList);
 procedure updateRadar_Def(rec: TRadar_On_Board; id:string);
 procedure insertRadar_Def(rec: TRadar_On_Board);
 procedure updateRadar_Interval_Def(rec: TRadar_On_Board;id:string);
 procedure insertRadar_Interval_Def(rec: TRadar_On_Board);
 procedure getAllRadar_Definition(var rec: TList);

 //sonar
 procedure getSonarCategory(var cList: TList);
 procedure getAllSonar(const id:integer;var aRec:TList;var rec: TSonar_On_Board);

 //ESM
 procedure getAllESM_Definition(var rec: TList);
 procedure insertESM_Def(rec: TESM_On_Board);
 procedure updateESM_Def(rec: TESM_On_Board;id:string);

 //sonobuoy
 procedure getAllSonobuoy (const id:integer;var slist: TList;var rec:TSonobuoy_On_Board);
 procedure insertSonobuoy_Def(rec: TSonobuoy_On_Board);
 procedure updateSonobuoy_Def(rec: TSonobuoy_On_Board;id:string);


 //role
// procedure getStudentRole(pList: TList ; var rec:TStudentRole);

 var

 SIMMgr : TT3DBScenario;
 idFocusedPlatform : integer;
 simManager :TT3SimManager;


implementation

uses

uLibSettingTTT,uDataModuleTTT,ufDBSetting, uDBAssets_SubAreaEnviroDefinition;//,uAvailableScenario;

{procedure getStudentRole(pList: TList ; var rec:TStudentRole);
begin
 //dmTTT.GetStudent_Role_List(0,pList,rec);
end;
}
procedure getAllsonobuoy (const id:integer;var slist: TList;var rec:TSonobuoy_On_Board);
begin
  dmTTT.getAllSonobuoy(id,sList,rec);
end;

procedure insertSonobuoy_Def(rec: TSonobuoy_On_Board);
begin
 dmTTT.insertSonobuoy_Def(rec);
end;

procedure updateSonobuoy_Def(rec: TSonobuoy_On_Board;id:string);
begin
 dmTTT.updateSonobuoy_Def(rec,id);
end;

procedure getAllESM_Definition(var rec: TList);
begin
 dmTTT.getESM_Def(rec);
end;

procedure insertESM_Def(rec: TESM_On_Board);
begin
 dmTTT.insertESM_Def(rec);
end;

procedure updateESM_Def(rec: TESM_On_Board;id:string);
begin
  dmTTT.updateESM_Def(rec,id);
end;

procedure getAllRadar_Definition(var rec: Tlist);
begin
 dmTTT.GetRadar_Definition(rec);
end;

procedure storePlatformInstance(var pf: TRecPlatform_Activation);
begin
 with pf do
 begin

 end;
end;

procedure updatePlatformInstance(rec: TList);
begin
 dmTTT.updatePlatformActivation(rec,inttostr(idFocusedPlatform));
end;

procedure deletePlatformInstance(id:string);
begin
  dmTTT.deletePlatformInstance(id);
end;

function getFocusedPlatform:integer;
begin
 result := idFocusedPlatform;
end;

procedure setFocusedPlatform(idPlatform:integer);
begin
 idFocusedPlatform := idPlatform;
end;

procedure getDBResourceAllocation(id:integer;raList:TList;var rec: TResource_Allocation);
var I : integer;
begin


  if not Assigned(rec) then
        rec := TResource_Allocation.Create;

   for I := 0 to raList.Count - 1 do
    begin

     if (TResource_Allocation(raList[i]).FData.Resource_Alloc_Index=id) then

     with rec.FData do begin
        Resource_Alloc_Index   := TResource_Allocation(raList[i]).FData.Resource_Alloc_Index;
        Allocation_Identifier  := TResource_Allocation(raList[i]).FData.Allocation_Identifier;
        Game_Enviro_Index      := TResource_Allocation(raList[i]).FData.Game_Enviro_Index;
        Defaults_Index         := TResource_Allocation(raList[i]).FData.Defaults_Index;
        Role_List_Index        := TResource_Allocation(raList[i]).FData.Role_List_Index;
        Game_Start_Time        := TResource_Allocation(raList[i]).FData.Game_Start_Time;
      end;
    end;
end;

procedure getDBEnvironments(id:integer;pList:TList;var rec: TGame_Environment_Definition );
var I : integer;
begin

  if not Assigned(rec) then
        rec := TGame_Environment_Definition.Create;

   for I := 0 to pList.Count - 1 do
    begin

     if (TGame_Environment_Definition(pList[i]).FData.Game_Enviro_Index=id) then

     with rec.FData do begin
        Game_Enviro_Index       := TGame_Environment_Definition(pList[i]).FData.Game_Enviro_Index;
        Game_Enviro_Identifier  := TGame_Environment_Definition(pList[i]).FData.Game_Enviro_Identifier;
        Game_Area_Index         := TGame_Environment_Definition(pList[i]).FData.Game_Area_Index;
        Wind_Speed                  := TGame_Environment_Definition(pList[i]).FData.Wind_Speed;
        Wind_Direction              := TGame_Environment_Definition(pList[i]).FData.Wind_Direction;
        Daytime_Visual_Modifier     := TGame_Environment_Definition(pList[i]).FData.Daytime_Visual_Modifier ;
        Nighttime_Visual_Modifier   := TGame_Environment_Definition(pList[i]).FData.Nighttime_Visual_Modifier;
        Daytime_Infrared_Modifier   := TGame_Environment_Definition(pList[i]).FData.Daytime_Infrared_Modifier;
        Nighttime_Infrared_Modifier := TGame_Environment_Definition(pList[i]).FData.Nighttime_Infrared_Modifier;
        Sunrise                     := TGame_Environment_Definition(pList[i]).FData.Sunrise;
        Sunset                      := TGame_Environment_Definition(pList[i]).FData.Sunset;
        Period_of_Twilight          := TGame_Environment_Definition(pList[i]).FData.Period_of_Twilight;
        Rain_Rate                   := TGame_Environment_Definition(pList[i]).FData.Rain_Rate;
        Cloud_Base_Height           := TGame_Environment_Definition(pList[i]).FData.Cloud_Base_Height;
        Cloud_Attenuation           := TGame_Environment_Definition(pList[i]).FData.Cloud_Attenuation;
        Sea_State                   := TGame_Environment_Definition(pList[i]).FData.Sea_State;
        Ocean_Current_Speed         := TGame_Environment_Definition(pList[i]).FData.Ocean_Current_Speed;
        Ocean_Current_Direction     := TGame_Environment_Definition(pList[i]).FData.Ocean_Current_Direction;
        Thermal_Layer_Depth         := TGame_Environment_Definition(pList[i]).FData.Thermal_Layer_Depth;
        Sound_Velocity_Type         := TGame_Environment_Definition(pList[i]).FData.Sound_Velocity_Type;
        Surface_Sound_Speed         := TGame_Environment_Definition(pList[i]).FData.Nighttime_Visual_Modifier;
        Layer_Sound_Speed           := TGame_Environment_Definition(pList[i]).FData.Layer_Sound_Speed;
        Bottom_Sound_Speed          := TGame_Environment_Definition(pList[i]).FData.Bottom_Sound_Speed;
        Bottomloss_Coefficient      := TGame_Environment_Definition(pList[i]).FData.Bottomloss_Coefficient;
        Ave_Ocean_Depth             := TGame_Environment_Definition(pList[i]).FData.Ave_Ocean_Depth;
        CZ_Active                   := TGame_Environment_Definition(pList[i]).FData.CZ_Active;
        Surface_Ducting_Active      := TGame_Environment_Definition(pList[i]).FData.Surface_Ducting_Active;
        Upper_Limit_Surface_Duct_Depth := TGame_Environment_Definition(pList[i]).FData.Upper_Limit_Surface_Duct_Depth;
        Lower_Limit_Surface_Duct_Depth := TGame_Environment_Definition(pList[i]).FData.Lower_Limit_Surface_Duct_Depth;
        Sub_Ducting_Active             := TGame_Environment_Definition(pList[i]).FData.Sub_Ducting_Active;
        Upper_Limit_Sub_Duct_Depth     := TGame_Environment_Definition(pList[i]).FData.Upper_Limit_Sub_Duct_Depth;
        Lower_Limit_Sub_Duct_Depth     := TGame_Environment_Definition(pList[i]).FData.Lower_Limit_Sub_Duct_Depth;
        Shipping_Rate                  := TGame_Environment_Definition(pList[i]).FData.Shipping_Rate;
        Shadow_Zone_Trans_Loss         := TGame_Environment_Definition(pList[i]).FData.Shadow_Zone_Trans_Loss;
        Atmospheric_Refract_Modifier   := TGame_Environment_Definition(pList[i]).FData.Atmospheric_Refract_Modifier;
        Barometric_Pressure            := TGame_Environment_Definition(pList[i]).FData.Barometric_Pressure;
        Air_Temperature                := TGame_Environment_Definition(pList[i]).FData.Air_Temperature;
        Surface_Temperature            := TGame_Environment_Definition(pList[i]).FData.Surface_Temperature;
        Start_HF_Range_Gap             := TGame_Environment_Definition(pList[i]).FData.Start_HF_Range_Gap;
        End_HF_Range_Gap               := TGame_Environment_Definition(pList[i]).FData.End_HF_Range_Gap;
        Game_Def_1                     := TGame_Environment_Definition(pList[i]).FData.Game_Def_1;
        Game_Def_2                     := TGame_Environment_Definition(pList[i]).FData.Game_Def_2;
        Game_Def_3                     := TGame_Environment_Definition(pList[i]).FData.Game_Def_3;
     end;
    end;
end;

procedure getPIMissile(ra_id,force:integer;const instance:string;var pList:TList);
begin
  dmTTT.getPlatFormInstance(ra_id,force,instance,pList);
end;

procedure StartInitialize;
var iResult: Integer;
 bResult : Boolean;
begin

  //later ambil dari server, sementara ambil dari file dulu
  vSettingFile := getFileSetting;

  LoadFF_dBaseSetting(vSettingFile, vDBSetting);
  LoadFF_SymbolSetting(vSettingFile, vSymbolSetting);

  frmDBSEtting := TfrmDBSetting.Create(nil);

  iResult := mrNone;
  repeat
    with vDBSetting do
      bResult := dmTTT.InitZDB(dbServer, dbProto, dbName, dbUser, dbPass);

    if not bResult then begin

      with vDBSetting do begin
        frmDBSetting.dbServer := DBServer;
        frmDBSetting.dbName   := DBName;
        frmDBSetting.dbUser   := DBUser;
        frmDBSetting.dbPass   := DBPass;
      end;

      iResult := frmDBSEtting.ShowModal;

      if iResult = mrOk then begin
        vDBSetting.DBServer  := frmDBSetting.dbServer ;
        vDBSetting.DBName    := frmDBSetting.dbName   ;
        vDBSetting.DBUser    := frmDBSetting.dbUser   ;
        vDBSetting.DBPass    := frmDBSetting.dbPass   ;
        vDBSetting.dbProto   := c_defaultDBProto ;
      end;
    end
    else begin
      if (iResult = mrOk) then
        SaveFF_dBaseSetting(vSettingFile, vDBSetting);

    end;
  until  bResult or (iResult = mrCancel);
  frmDBSetting.Free;

  //get message untuk status Scenario Development
  //sementara diskip, anggap tidak ada scenario yg jalan
  //mulai load scenario

   simMgr := TT3DBScenario.Create;

end;

procedure getPLatforms(var sclist:Tlist);
begin
 dmTTT.getAllScenario_Definition(scList);
end;

procedure getEnvironments(var sclist:Tlist);
begin
 dmTTT.GetAllGame_Environment_Definition(sclist);
end;

procedure getDefaults(var sclist:Tlist;var rec:TGame_Defaults);
begin
  dmTTT.GetAllGame_Defaults(0,sclist,rec);
end;

procedure getResourceAllocation(var raList:TList);
begin
 dmTTT.getAllResource_Allocation(raList);
end;

procedure getGameArea(id:string;gList:TList;var rec:TGame_Environment_Definition );
begin
  dmTTT.getGame_Area_Identifier(id,gList,rec);
end;

procedure getAllVehicles(var sclist:Tlist;id:integer;var rec:TVehicle_Definition);
begin
  dmTTT.GetAllVehicle_Def(sclist,id,rec);
end;

procedure getAllMissile(const id:integer;var mList:TList;var rec: TMissile_On_Board);
begin
  dmTTT.getAllMissile(id,mList,rec);
end;

procedure getAllTorpedo(const id:integer;var mList:TList;var rec: TTorpedo_On_Board);
begin
  dmTTT.getAllTorpedo(id,mList,rec);
end;

procedure getAllMine (const id:integer;var mList:TList;var rec: TMine_On_Board);
begin
  dmTTT.getAllMine(id,mList,rec);
end;

procedure getAllSatellite (const id:integer;var sList:TList;var rec: TSatellite_Definition);
begin
  dmTTT.getAllSatellite(id,sList,rec);
end;

procedure getRA(const index,ra_id,force:integer;var pList:TList );
begin
  case index of
    1: dmTTT.getPIMissile(pList,ra_id,force);
    2: dmTTT.getPITorpedo(pList,ra_id,force);
    3: dmTTT.getPISonobuoy(pList,ra_id,force);
    4: dmTTT.getPIMine(pList,ra_id,force);
    5: dmTTT.getPISatellite(pList,ra_id,force);
  end;

end;


procedure getRAvehicle(const v_id,ra_id:integer;var PLatform_Insts:TList;psForce,psCategory:integer);
begin
  dmTTT.getAllPlatFormInstanceForceClassification(v_id,ra_id,PLatform_Insts,psForce,psCategory);
end;

procedure getPlatformInstance(resourceAllocIndex:integer;var PLatform_Insts:TList;psForce,psCategory:integer);
begin
  //dmTTT.getAllPlatFormInstanceForceClassification(resourceAllocIndex, Platform_Insts,psForce,psCategory );
  dmTTT.GetAllPlatformInstance(resourceAllocIndex,PLatform_Insts);
end;

//-----------------------------------------------------------------------------
// get Formation
//-----------------------------------------------------------------------------

procedure getFormationAssignment(var fAssign: TFormation; var Formation_Insts:TList);
begin
    dmTTT.GetFormationAssignment(fAssign, Formation_Insts);
end;

procedure getFormationDefinition(const id: Integer; var aRec: TList);
begin
  if (dmTTT.GetFormationDefinition(id, aRec) <> -1) then
    dmTTT.GetFormationDefinition(id, aRec);
end;

procedure insertFormation_Def(formationDef : TFormation);
begin
  dmTTT.insertFormation_Def(formationDef);
end;

procedure updateFormation_Def(formationDef : TFormation; idDeploy: String);
begin
  dmTTT.updateFormation_Def(formationDef, idDeploy);
end;

procedure insertFormation_Assignment(formationAss : TFormation);
begin
  dmTTT.insertFormation_Assign(formationAss);
end;

procedure updateFormation_Assignment(rec: TFormation; form_id: string;pi_id:string);
begin
  dmTTT.updateFormation_Assign(rec, form_id, pi_id);
end;

procedure deleteFormation_Assignment(form_id: string; pi_id:string);
begin
  dmTTT.deleteFormation_Assign(form_id, pi_id);
end;

//-----------------------------------------------------------------------------
// get Environment
//-----------------------------------------------------------------------------
procedure getEnvironment(const idPlatform: Integer; Elist: TGame_Environment_Definition);
begin
  //get Environment
end;

procedure getGameAreaList(var GameArea : TList);
begin
 dmTTT.GetGame_Area_Def(gameArea);
end;

procedure deleteGameArea(id : Integer);
begin
  dmTTT.deleteGame_Area_Def(id);
end;

procedure updateGameArea(Game_Area: TGame_Environment_Definition ; id: String);
begin
  dmTTT.updateGame_Area_Def(Game_Area,id);
end;

procedure updateGameEnvironment(Game_Area: TGame_Environment_Definition ; id: String);
begin
  dmTTT.updateGame_Environment_Def(Game_Area,id);
end;

procedure updateScenario(rec: TScenario_Definition; id: string);
begin
   dmTTT.updateScenario(rec,id);
end;

procedure insertScenario(rec: TScenario_Definition);
begin
  dmTTT.insertScenario(rec);
end;

procedure insertResource(rec: TResource_Allocation);
begin
  dmTTT.insertResource(rec);
end;

function insertGameAreaDef(rec: TGame_Environment_Definition):integer;
begin
  Result := dmTTT.insertGame_Area_Def(rec);
end;

procedure updateGameAreaDef(rec: TGame_Environment_Definition; id: string);
begin
  dmTTT.updateGame_Area_Def(rec, id);
end;

function insertGameEnvironment(Game_Enf_def: TGame_Environment_Definition): TGame_Environment_Definition;
begin
  Result := dmTTT.insertGame_Environment_Def(Game_Enf_def);
end;

procedure getSatellite_Definition(const id: integer; var rec: TSatellite_Definition);
begin
  dmTTT.GetSatellite_Definition(id, rec);
end;

procedure insertSatellite_Def(rec: TSatellite_Definition);
begin
  dmTTT.insertSatellite_Def(rec);
end;

procedure updateSatellite_Def(rec: TSatellite_Definition; id: string);
begin
  dmTTT.updateSatellite_Def(rec, id);
end;

procedure deleteSatellite_Def(id : Integer);
begin
  dmTTT.deleteSatellite_Def(id);
end;

procedure getMotion_Characteristics(const id: integer;var rec: TMotion_Characteristics);
begin
  dmTTT.GetMotionCharacteristicDef(id, rec);
end;

procedure getAllMotion_Characteristics(mList : TList);
begin
  dmTTT.getAllMotion_Characteristics(mList);
end;

procedure insertMotion(rec: TMotion_Characteristics);
begin
  dmTTT.insertMotion(rec);
end;

procedure updateMotion(rec: TMotion_Characteristics; index: string);
begin
  dmTTT.updateMotion(rec, index);
end;

procedure deleteMotion(id : Integer);
begin
  dmTTT.deleteMotion(id);
end;

procedure getAllRadar_On_Board(const id: integer; var aRec: TList);
begin
  dmTTT.getAllRadar_On_Board(id,0, aRec);
end;

procedure updateRadar_Def(rec: TRadar_On_Board; id:string);
begin
  dmTTT.updateRadar_Def(rec, id);
end;

procedure insertRadar_Def(rec: TRadar_On_Board);
begin
  dmTTT.insertRadar_Def(rec);
end;

procedure updateRadar_Interval_Def(rec: TRadar_On_Board;id:string);
begin
  dmTTT.updateRadar_Interval_Def(rec, id);
end;

procedure insertRadar_Interval_Def(rec: TRadar_On_Board);
begin
  dmTTT.insertRadar_Interval_Def(rec);
end;

procedure GetGame_Environment_Definition(const id: integer;
        var rec: TGame_Environment_Definition);
begin
  dmTTT.GetGame_Environment_Definition(id,
        rec);
end;

procedure getSonarCategory(var cList: TList);
begin
  dmTTT.getAllSonarCategory(cList);
end;

procedure getAllSonar(const id:integer;var aRec:TList;var rec: TSonar_On_Board);
begin
  dmTTT.getSonar_Def(id,aRec,rec);
end;

procedure DeleteSubArea_Enviro_Definition(const id_enviro: Integer; const id_gameArea: Integer);
begin
  dmTTT.DeleteSubArea_Enviro_Definition(id_enviro, id_gameArea);
end;
procedure UpdateSubArea_Enviro_Definition(const id: string;
  var rec: TSubArea_Enviro_Definition);
begin
  dmTTT.UpdateSubArea_Enviro_Definition(id, rec);
end;
procedure InsertSubArea_Enviro_Definition(
  var rec: TSubArea_Enviro_Definition);
begin
  dmTTT.InsertSubArea_Enviro_Definition(rec);
end;

procedure GetSubArea_Enviro_Definition(const id: integer;
  var rectList: TList);
begin
  dmTTT.GetSubArea_Enviro_Definition(id, rectList);
end;

end.
