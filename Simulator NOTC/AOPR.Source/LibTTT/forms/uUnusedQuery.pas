unit uUnusedQuery;

interface

uses
  Dialogs, SysUtils, Classes, ZConnection, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, tttData, newClassASTT, uDBAssetObject, uDBAsset_Vehicle,
  uDBAsset_Radar, uDBAsset_Sonar;

type

  TDMQuery = class
  private
    ZConn: TZConnection;
    ZQ: TZQuery;
  public
    //--- 2.1.1 -- Platform Instance Detail --------------------------------------

    function GetMissile_Definition(const id: integer;
      var rec: TMissile_Definition): boolean;

    function GetTorpedo_Definition(const id: integer;
      var rec: TTorpedo_Definition): boolean;

    function GetMine_Definition(const id: integer;
      var rec: TMine_Definition): boolean;

    function GetHybrid_Definition(const id: integer;
      var rec: THybrid_Definition): boolean;

    function GetSatellite_Definition(const id: integer;
      var rec: TSatellite_Definition): boolean;

    function GetSonobuoy_Definition(const id: integer;
      var rec: TSonobuoy_Definition): boolean;

//---------------------------------------------------------------


  function GetEO_Detection_Definition(const id: integer;
    var rec: TEO_Detection_Definition): boolean;

  function GetNote_Storage(const id: integer;
    var rec: TNote_Storage): boolean;

  function GetMotion_Characteristics(const id: integer;
    var rec: TMotion_Characteristics): boolean;

  function GetFitted_Weapon_On_Board(const id: integer;
    var rec: TFitted_Weapon_On_Board): boolean;


  function GetPredefined_Pattern(const id: integer;
    var rec: TPredefined_Pattern): boolean;


  function GetPlatform_Instance_Identifier(const id: integer;
    var rec: TPlatform_Instance_Identifier): boolean;

  function GetPlatform_Library_Entry(const id: integer;
    var rec: TPlatform_Library_Entry): boolean;

  function GetSonobuoy_On_Board(const id: integer;
    var rec: TSonobuoy_On_Board): boolean;

{  function GetFloating_Decoy_On_Board(const id: integer;
    var rec: TFloating_Decoy_On_Board): boolean;
}
  function GetHelicopter_Land_Launch_Limits(const id: integer;
    var rec: THelicopter_Land_Launch_Limits): boolean;

  function GetHosted_Platform(const id: integer;
    var rec: THosted_Platform): boolean;

 { function GetInfrared_Decoy_On_Board(const id: integer;
    var rec: TInfrared_Decoy_On_Board): boolean;

  function GetJammer_On_Board(const id: integer;
    var rec: TJammer_On_Board): boolean;
}

  function GetPlatform_DIS_Definition(const id: integer;
    var rec: TPlatform_DIS_Definition): boolean;

  function GetSonar_Definition(const id: integer;
    var rec: TSonar_Definition): boolean;

     // ---- 3 Acoustic ------------------------------------------------------------
    function GetAcoustic_Decoy_Definition(const id: integer;
      var rec: TAcoustic_Decoy_Definition): boolean;

    function GetAcoustic_Decoy_POH_Modifier(const id: integer;
      var rec: TAcoustic_Decoy_POH_Modifier): boolean;

    // ---- 4 Air Bubble-----------------------------------------------------------
    function GetAir_Bubble_Definition(const id: integer;
      var rec: TAir_Bubble_Definition): boolean;

    // ---- 5 Asset ---------------------------------------------------------------
    function GetAsset_Deployment_Definition(const id: integer;
      var rec: TAsset_Deployment_Definition): boolean;

    function GetBlind_Zone_Definition(const id: integer;
      var rec: TBlind_Zone_Definition): boolean;

    // ---- 6 Bomb ----------------------------------------------------------------
    function GetBomb_Definition(const id: integer; var rec: TBomb_Definition)
      : boolean;

    function GetBomb_POH_vs_Range(const id: integer;
      var rec: TBomb_POH_vs_Range): boolean;

    // ---- 7 Chaff ---------------------------------------------------------------
    function GetChaff_Definition(const id: integer; var rec: TChaff_Definition)
      : boolean;


    function GetChaff_On_Board(const id: integer; var rec: TChaff_On_Board)
      : boolean;

    // ---- 8 Cloud ---------------------------------------------------------------
    function GetCloud_Effects_On_ESM(const id: integer;
      var rec: TCloud_Effects_On_ESM): boolean;

    function GetCloud_Effects_On_Radar(const id: integer;
      var rec: TCloud_Effects_On_Radar): boolean;

    function GetConditional_Event_Definition(const id: integer;
      var rec: TConditional_Event_Definition): boolean;

    function GetConditional_Event_List(const id: integer;
      var rec: TConditional_Event_List): boolean;

    function GetCubicle_Group(const id: integer; var rec: TCubicle_Group)
      : boolean;

    function GetCubicle_Group_Assignment(const id: integer;
      var rec: TCubicle_Group_Assignment): boolean;

    function GetCubicle_Group_Channel_Assgnmnt(const id: integer;
      var rec: TCubicle_Group_Channel_Assgnmnt): boolean;

    function GetDIS_Category_Definition(const id: integer;
      var rec: TDIS_Category_Definition): boolean;

    function GetDIS_Country_Definition(const id: integer;
      var rec: TDIS_Country_Definition): boolean;

    function GetDIS_Domain_Country_Mapping(const id: integer;
      var rec: TDIS_Domain_Country_Mapping): boolean;

    function GetDIS_Domain_Definition(const id: integer;
      var rec: TDIS_Domain_Definition): boolean;

    function GetDIS_Kind_Definition(const id: integer;
      var rec: TDIS_Kind_Definition): boolean;

    function GetDIS_Kind_Domain_Mapping(const id: integer;
      var rec: TDIS_Kind_Domain_Mapping): boolean;

    function GetDIS_Specific_Definition(const id: integer;
      var rec: TDIS_Specific_Definition): boolean;

    function GetDIS_Subcategory_Definition(const id: integer;
      var rec: TDIS_Subcategory_Definition): boolean;

    function GetDefault_Definition(const id: integer;
      var rec: TDefault_Definition): boolean;

    function GetDefault_IFF_Mode_Code(const id: integer;
      var rec: TDefault_IFF_Mode_Code): boolean;

    function GetDefensive_Jammer_Definition(const id: integer;
      var rec: TDefensive_Jammer_Definition): boolean;


    function GetFormation_Definition(const id: integer;
      var rec: TFormation_Definition): boolean;

    function GetLink_Definition(const id: integer; var rec: TLink_Definition)
      : boolean;

    function GetLink_Participant(const id: integer; var rec: TLink_Participant)
      : boolean;


    function GetPattern_Chaff_Event(const id: integer;
      var rec: TPattern_Chaff_Event): boolean;

    function GetScripted_Chaff_Event(const id: integer;
      var rec: TScripted_Chaff_Event): boolean;

    function GetResource_Cond_List_Mapping(const id: integer;
      var rec: TResource_Cond_List_Mapping): boolean;

    function GetGeo_Area_Definition(const id: integer;
      var rec: TGeo_Area_Definition): boolean;

    function GetExternal_Communication_Channel(const id: integer;
      var rec: TExternal_Communication_Channel): boolean;


    function GetTowed_Jammer_Decoy_Definition(const id: integer;
      var rec: TTowed_Jammer_Decoy_Definition): boolean;

    function GetESM_Definition(const id: integer; var rec: TESM_Definition)
      : boolean;

    function GetFCR_Definition(const id: integer; var rec: TFCR_Definition)
      : boolean;

    function GetFitted_Weap_Launcher_On_Board(const id: integer;
      var rec: TFitted_Weap_Launcher_On_Board): boolean;

    function GetFloating_Decoy_Definition(const id: integer;
      var rec: TFloating_Decoy_Definition): boolean;

    function GetFormation_Assignment(const id: integer;
      var rec: TFormation_Assignment): boolean;

    function GetGame_Area_Definition(const id: integer;
      var rec: TGame_Area_Definition): boolean;

    function GetGame_Cloud_On_ESM(const id: integer;
      var rec: TGame_Cloud_On_ESM): boolean;

    function GetGame_Default_IFF_Mode_Code(const id: integer;
      var rec: TGame_Default_IFF_Mode_Code): boolean;

    function GetGame_Defaults(const id: integer; var rec: TGame_Defaults)
      : boolean;

    function GetGame_Rainfall_On_ESM(const id: integer;
      var rec: TGame_Rainfall_On_ESM): boolean;

    function GetGame_Rainfall_On_Missile_Seeker(const id: integer;
      var rec: TGame_Rainfall_On_Missile_Seeker): boolean;

    function GetGame_Rainfall_On_Radar(const id: integer;
      var rec: TGame_Rainfall_On_Radar): boolean;

    function GetGame_Rainfall_On_Sonar(const id: integer;
      var rec: TGame_Rainfall_On_Sonar): boolean;

    function GetGame_Sea_On_Missile_Safe_Altitude(const id: integer;
      var rec: TGame_Sea_On_Missile_Safe_Altitude): boolean;

    function GetGame_Sea_On_Radar(const id: integer;
      var rec: TGame_Sea_On_Radar): boolean;

    function GetGame_Sea_On_Sonar(const id: integer;
      var rec: TGame_Sea_On_Sonar): boolean;

    function GetGame_Ship_On_Sonar(const id: integer;
      var rec: TGame_Ship_On_Sonar): boolean;

    function GetGeo_Area_Point(const id: integer;
      var rec: TGeo_Area_Point): boolean;

    function GetGlobal_Convergence_Zone(const id: integer;
    var rec: TGlobal_Convergence_Zone): boolean;

    function GetInfrared_Decoy_Definition(const id: integer;
    var rec: TInfrared_Decoy_Definition): boolean;

    function GetJammer_Definition(const id: integer;
    var rec: TJammer_Definition): boolean;

    function GetMAD_Definition(const id: integer;
    var rec: TMAD_Definition): boolean;

    function GetMine_POD_vs_Range(const id: integer;
    var rec: TMine_POD_vs_Range): boolean;

   function GetOverlay_Definition(const id: integer;
    var rec: TOverlay_Definition): boolean;

    function GetPattern_IFF_Event(const id: integer;
    var rec: TPattern_IFF_Event): boolean;

    function GetPattern_Infrared_Decoy_Event(const id: integer;
    var rec: TPattern_Infrared_Decoy_Event): boolean;

    function GetPattern_Point(const id: integer;
    var rec: TPattern_Point): boolean;

    function GetPattern_Radar_Event(const id: integer;
    var rec: TPattern_Radar_Event): boolean;

    function GetPattern_Weapon_Event(const id: integer;
    var rec: TPattern_Weapon_Event): boolean;

    function GetPlatform_IFF_Activation(const id: integer;
    var rec: TPlatform_IFF_Activation): boolean;

    function GetPlatform_IFF_Mode_Code(const id: integer;
    var rec: TPlatform_IFF_Mode_Code): boolean;

    function GetRainfall_On_ESM(const id: integer;
    var rec: TRainfall_On_ESM): boolean;

    function GetRainfall_On_Radar(const id: integer;
    var rec: TRainfall_On_Radar): boolean;

    function GetRainfall_On_Sonar(const id: integer;
    var rec: TRainfall_On_Sonar): boolean;

    function GetReference_Point(const id: integer;
    var rec: TReference_Point): boolean;

    function GetResource_Geo_Area_Mapping(const id: integer;
    var rec: TResource_Geo_Area_Mapping): boolean;

    function GetResource_Interval_List_Mapping(const id: integer;
    var rec: TResource_Interval_List_Mapping): boolean;

    function GetResource_Library_Mapping(const id: integer;
    var rec: TResource_Library_Mapping): boolean;

    function GetResource_Overlay_Mapping(const id: integer;
    var rec: TResource_Overlay_Mapping): boolean;

    function GetResource_Pattern_Mapping(const id: integer;
    var rec: TResource_Pattern_Mapping): boolean;

    function GetResource_Sonobuoy_Mapping(const id: integer;
    var rec: TResource_Sonobuoy_Mapping): boolean;

    function GetResource_Template_Mapping(const id: integer;
    var rec: TResource_Template_Mapping): boolean;

    function GetRuntime_Platform_Library(const id: integer;
    var rec: TRuntime_Platform_Library): boolean;

    function GetScripted_Behav_Definition(const id: integer;
    var rec: TScripted_Behav_Definition): boolean;

    function GetScripted_IFF_Event(const id: integer;
    var rec: TScripted_IFF_Event): boolean;

    function GetScripted_Infrared_Decoy_Event(const id: integer;
    var rec: TScripted_Infrared_Decoy_Event): boolean;

    function GetScripted_Pattern_Point(const id: integer;
    var rec: TScripted_Pattern_Point): boolean;

    function GetScripted_Sonar_Event(const id: integer;
    var rec: TScripted_Sonar_Event): boolean;

    function GetScripted_Radar_Event(const id: integer;
    var rec: TScripted_Radar_Event): boolean;

    function GetScripted_Weapon_Event(const id: integer;
    var rec: TScripted_Weapon_Event): boolean;

    function GetSea_State_On_Missile_Safe_Altitude(const id: integer;
    var rec: TSea_State_On_Missile_Safe_Altitude): boolean;

    function GetSea_State_On_Radar(const id: integer;
    var rec: TSea_State_On_Radar): boolean;

    function GetSea_State_On_Sonar(const id: integer;
    var rec: TSea_State_On_Sonar): boolean;

    function GetShip_Noise_On_Sonar(const id: integer;
    var rec: TShip_Noise_On_Sonar): boolean;

    function GetStudent_Role_Definition(const id: integer;
    var rec: TStudent_Role_Definition): boolean;

    function GetStudent_Role_List(const id: integer;
    var rec: TStudent_Role_List): boolean;

    function GetSubArea_Enviro_Definition(const id: integer;
    var rec: TSubArea_Enviro_Definition): boolean;

    function GetText_Message_Template(const id: integer;
    var rec: TText_Message_Template): boolean;

    function GetTorpedo_POH_Modifier(const id: integer;
    var rec: TTorpedo_POH_Modifier): boolean;

      function GetPattern_Sonar_Event(const id: integer;
    var rec: TPattern_Sonar_Event): boolean;

      function GetRainfall_On_Missile_Seeker(const id: integer;
    var rec: TRainfall_On_Missile_Seeker): boolean;


  end;


implementation

{ TUnuseQuery }


  function TDMQuery.GetMissile_Definition(const id: integer;
    var rec: TMissile_Definition): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Missile_Definition ' );

      SQL.Add('WHERE (Vehicle_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TMissile_Definition.Create;
        with rec.FData do begin
          Missile_Index                     := FieldByName('Missile_Index').AsInteger;
          Class_Identifier                  := FieldByName('Class_Identifier').AsString;
          Platform_Domain                   := FieldByName('Platform_Domain').AsInteger;
          Platform_Category                 := FieldByName('Platform_Category').AsInteger;
          Platform_Type                     := FieldByName('Platform_Type').AsInteger;
          Max_Range                         := FieldByName('Max_Range').AsSingle;
          Min_Range                         := FieldByName('Min_Range').AsSingle;
          Motion_Index                      := FieldByName('Motion_Index').AsInteger;
          Seeker_TurnOn_Range               := FieldByName('Seeker_TurnOn_Range').AsSingle;
          Second_Seeker_Pattern_Capable     := FieldByName('Second_Seeker_Pattern_Capable').AsInteger;
          Seeker_Bias_Capable               := FieldByName('Seeker_Bias_Capable').AsInteger;
          Fixed_Seeker_Turn_On_Range        := FieldByName('Fixed_Seeker_Turn_On_Range').AsInteger;
          Lethality                         := FieldByName('Lethality').AsInteger;
          Prob_of_Hit                       := FieldByName('Prob_of_Hit').AsSingle;
          Damage_Capacity                   := FieldByName('Damage_Capacity').AsInteger;
          Default_Altitude                  := FieldByName('Default_Altitude').AsSingle;
          Length                            := FieldByName('Length').AsSingle;
          Width                             := FieldByName('Width').AsSingle;
          Height                            := FieldByName('Height').AsSingle;
          Front_Radar_Cross                 := FieldByName('Front_Radar_Cross').AsSingle;
          Side_Radar_Cross                  := FieldByName('Side_Radar_Cross').AsSingle;
          Front_Visual_Cross                := FieldByName('Front_Visual_Cross').AsSingle;
          Side_Visual_Cross                 := FieldByName('Side_Visual_Cross').AsSingle;
          Front_Infrared_Cross              := FieldByName('Front_Infrared_Cross').AsSingle;
          Side_Infrared_Cross               := FieldByName('Side_Infrared_Cross').AsSingle;
          Pursuit_Guide_Type                := FieldByName('Pursuit_Guide_Type').AsInteger;
          Primary_Guide_Type                := FieldByName('Primary_Guide_Type').AsInteger;
          Secondary_Guide_Type              := FieldByName('Secondary_Guide_Type').AsInteger;
          Anti_Air_Capable                  := FieldByName('Anti_Air_Capable').AsInteger;
          Anti_Sur_Capable                  := FieldByName('Anti_Sur_Capable').AsInteger;
          Anti_SubSur_Capable               := FieldByName('Anti_SubSur_Capable').AsInteger;
          Anti_Land_Capable                 := FieldByName('Anti_Land_Capable').AsInteger;
          Primary_Target_Domain             := FieldByName('Primary_Target_Domain').AsInteger;
          SARH_POH_Modifier                 := FieldByName('SARH_POH_Modifier').AsSingle;
          CG_POH_Modifier                   := FieldByName('CG_POH_Modifier').AsSingle;
          TARH_POH_Modifier                 := FieldByName('TARH_POH_Modifier').AsSingle;
          IR_POH_Modifier                   := FieldByName('IR_POH_Modifier').AsSingle;
          AR_POH_Modifier                   := FieldByName('AR_POH_Modifier').AsSingle;
          Transmitted_Frequency             := FieldByName('Transmitted_Frequency').AsFloat;
          Scan_Rate                         := FieldByName('Scan_Rate').AsSingle;
          Pulse_Rep_Freq                    := FieldByName('Pulse_Rep_Freq').AsSingle;
          Pulse_Width                       := FieldByName('Pulse_Width').AsSingle;
          Xmit_Power                        := FieldByName('Xmit_Power').AsSingle;
          TARH_Jamming_A_Probability        := FieldByName('TARH_Jamming_A_Probability').AsSingle;
          TARH_Jamming_B_Probability        := FieldByName('TARH_Jamming_B_Probability').AsSingle;
          TARH_Jamming_C_Probability        := FieldByName('TARH_Jamming_C_Probability').AsSingle;
          Wpt_Capable                       := FieldByName('Wpt_Capable').AsInteger;
          Max_Num_Wpts                      := FieldByName('Max_Num_Wpts').AsInteger;
          Min_Final_Leg_Length              := FieldByName('Min_Final_Leg_Length').AsSingle;
          Engagement_Range                  := FieldByName('Engagement_Range').AsSingle;
          Max_Firing_Depth                  := FieldByName('Max_Firing_Depth').AsSingle;
          Upper_Received_Freq               := FieldByName('Upper_Received_Freq').AsFloat;
          Lower_Received_Freq               := FieldByName('Lower_Received_Freq').AsFloat;
          Fly_Out_Required                  := FieldByName('Fly_Out_Required').AsInteger;
          Fly_Out_Range                     := FieldByName('Fly_Out_Range').AsSingle;
          Fly_Out_Altitude                  := FieldByName('Fly_Out_Altitude').AsSingle;
          Booster_Separation_Required       := FieldByName('Booster_Separation_Required').AsInteger;
          Booster_Separation_Range          := FieldByName('Booster_Separation_Range').AsSingle;
          Booster_Separation_Box_Width      := FieldByName('Booster_Separation_Box_Width').AsSingle;
          Booster_Separation_Box_Length     := FieldByName('Booster_Separation_Box_Length').AsSingle;
          Term_Guide_Azimuth                := FieldByName('Term_Guide_Azimuth').AsSingle;
          Term_Guide_Elevation              := FieldByName('Term_Guide_Elevation').AsSingle;
          Term_Guide_Range                  := FieldByName('Term_Guide_Range').AsSingle;
          Terminal_Guidance_Capability      := FieldByName('Terminal_Guidance_Capability').AsInteger;
          Terminal_Altitude_Required        := FieldByName('Terminal_Altitude_Required').AsInteger;
          Terminal_Acquisition_Altitude     := FieldByName('Terminal_Acquisition_Altitude').AsSingle;
          Terminal_Sinuation_Start_Range    := FieldByName('Terminal_Sinuation_Start_Range').AsSingle;
          Terminal_Sinuation_Period         := FieldByName('Terminal_Sinuation_Period').AsSingle;
          Terminal_Sinuation_Amplitude      := FieldByName('Terminal_Sinuation_Amplitude').AsSingle;
          Terminal_Pop_Up_Range             := FieldByName('Terminal_Pop_Up_Range').AsSingle;
          Terminal_Pop_Up_Altitude          := FieldByName('Terminal_Pop_Up_Altitude').AsSingle;
          Mid_Course_Update_Mode            := FieldByName('Mid_Course_Update_Mode').AsInteger;
          Home_On_Jam_Type_A_Capable        := FieldByName('Home_On_Jam_Type_A_Capable').AsInteger;
          Home_On_Jam_Type_B_Capable        := FieldByName('Home_On_Jam_Type_B_Capable').AsInteger;
          Home_On_Jam_Type_C_Capable        := FieldByName('Home_On_Jam_Type_C_Capable').AsInteger;
          Launch_Method                     := FieldByName('Launch_Method').AsInteger;
          Data_Entry_Method                 := FieldByName('Data_Entry_Method').AsInteger;
          Launch_Speed                      := FieldByName('Launch_Speed').AsInteger;
          Max_Target_Altitude_Delta         := FieldByName('Max_Target_Altitude_Delta').AsInteger;
          Term_Guide_Azimuth_Narrow         := FieldByName('Term_Guide_Azimuth_Narrow').AsSingle;
          Term_Guide_Elevation_Narrow       := FieldByName('Term_Guide_Elevation_Narrow').AsSingle;
          Term_Guide_Range_Narrow           := FieldByName('Term_Guide_Range_Narrow').AsSingle;
          Spot_Number                       := FieldByName('Spot_Number').AsInteger;
          ECCM_Type                         := FieldByName('ECCM_Type').AsInteger;
          ECM_Detonation                    := FieldByName('ECM_Detonation').AsInteger;
          ECM_Detection                     := FieldByName('ECM_Detection').AsInteger;
          Detectability_Type                := FieldByName('Detectability_Type').AsInteger;
          IRCM_Detonation                   := FieldByName('IRCM_Detonation').AsInteger;
          IRCM_Detection                    := FieldByName('IRCM_Detection').AsInteger;
          Sea_State_Modelling_Capable       := FieldByName('Sea_State_Modelling_Capable').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------
  function TDMQuery.GetTorpedo_Definition(const id: integer;
    var rec: TTorpedo_Definition): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Torpedo_Definition ' );

      SQL.Add('WHERE (Torpedo_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TTorpedo_Definition.Create;
        with rec.FData do begin
          Torpedo_Index                 := FieldByName('Torpedo_Index').AsInteger;
          Class_Identifier              := FieldByName('Class_Identifier').AsString;
          Platform_Domain               := FieldByName('Platform_Domain').AsInteger;
          Platform_Category             := FieldByName('Platform_Category').AsInteger;
          Platform_Type                 := FieldByName('Platform_Type').AsInteger;
          Max_Range                     := FieldByName('Max_Range').AsSingle;
          Min_Range                     := FieldByName('Min_Range').AsSingle;
          Motion_Index                  := FieldByName('Motion_Index').AsInteger;
          Seeker_TurnOn_Range           := FieldByName('Seeker_TurnOn_Range').AsSingle;
          Lethality                     := FieldByName('Lethality').AsInteger;
          Damage_Capacity               := FieldByName('Damage_Capacity').AsInteger;
          Default_Depth                 := FieldByName('Default_Depth').AsSingle;
          Length                        := FieldByName('Length').AsSingle;
          Width                         := FieldByName('Width').AsSingle;
          Height                        := FieldByName('Height').AsSingle;
          Front_Acoustic_Cross          := FieldByName('Front_Acoustic_Cross').AsSingle;
          Side_Acoustic_Cross           := FieldByName('Side_Acoustic_Cross').AsSingle;
          LSpeed_Acoustic_Intens        := FieldByName('LSpeed_Acoustic_Intens').AsSingle;
          Below_Cav_Acoustic_Intens     := FieldByName('Below_Cav_Acoustic_Intens').AsSingle;
          Above_Cav_Acoustic_Intens     := FieldByName('Above_Cav_Acoustic_Intens').AsSingle;
          HSpeed_Acoustic_Intens        := FieldByName('HSpeed_Acoustic_Intens').AsSingle;
          Cavitation_Switch_Point       := FieldByName('Cavitation_Switch_Point').AsSingle;
          Term_Guide_Azimuth            := FieldByName('Term_Guide_Azimuth').AsSingle;
          Term_Guide_Elevation          := FieldByName('Term_Guide_Elevation').AsSingle;
          Term_Guide_Range              := FieldByName('Term_Guide_Range').AsSingle;
          Pursuit_Guidance_Type         := FieldByName('Pursuit_Guidance_Type').AsInteger;
          Air_Drop_Capable              := FieldByName('Air_Drop_Capable').AsInteger;
          Use_Terminal_Circle           := FieldByName('Use_Terminal_Circle').AsInteger;
          Terminal_Circle_Radius        := FieldByName('Terminal_Circle_Radius').AsSingle;
          Fixed_Circle_Radius           := FieldByName('Fixed_Circle_Radius').AsInteger;
          Lateral_Deceleration          := FieldByName('Lateral_Deceleration').AsSingle;
          Airborne_Descent_Rate         := FieldByName('Airborne_Descent_Rate').AsFloat;
          Wire_Angle_Offset             := FieldByName('Wire_Angle_Offset').AsSingle;
          Guidance_Type                 := FieldByName('Guidance_Type').AsInteger;
          Anti_Sur_Capable              := FieldByName('Anti_Sur_Capable').AsInteger;
          Anti_SubSur_Capable           := FieldByName('Anti_SubSur_Capable').AsInteger;
          Primary_Target_Domain         := FieldByName('Primary_Target_Domain').AsInteger;
          Active_Acoustic_POH_Mod       := FieldByName('Active_Acoustic_POH_Mod').AsSingle;
          Passive_Acoustic_POH_Mod      := FieldByName('Passive_Acoustic_POH_Mod').AsSingle;
          Active_Passive_POH_Mod        := FieldByName('Active_Passive_POH_Mod').AsSingle;
          WireGuide_POH_Modifier        := FieldByName('WireGuide_POH_Modifier').AsSingle;
          WakeHome_POH_Modifier         := FieldByName('WakeHome_POH_Modifier').AsSingle;
          Active_Seeker_Power           := FieldByName('Active_Seeker_Power').AsSingle;
          Active_Seeker_Freq            := FieldByName('Active_Seeker_Freq').AsSingle;
          Engagement_Range              := FieldByName('Engagement_Range').AsSingle;
          First_Relative_Gyro_Angle     := FieldByName('First_Relative_Gyro_Angle').AsInteger;
          Second_Relative_Gyro_Angle    := FieldByName('Second_Relative_Gyro_Angle').AsInteger;
          Max_Torpedo_Gyro_Angle        := FieldByName('Max_Torpedo_Gyro_Angle').AsSingle;
          Max_Torpedo_Search_Depth      := FieldByName('Max_Torpedo_Search_Depth').AsSingle;
          Acoustic_Torp_Ceiling_Depth   := FieldByName('Acoustic_Torp_Ceiling_Depth').AsSingle;
          Fixed_Ceiling_Depth           := FieldByName('Fixed_Ceiling_Depth').AsInteger;
          Fixed_Seeker_TurnOn_Range     := FieldByName('Fixed_Seeker_TurnOn_Range').AsInteger;
          Sinuation_Runout              := FieldByName('Sinuation_Runout').AsInteger;
          Runout_Sinuation_Period       := FieldByName('Runout_Sinuation_Period').AsSingle;
          Runout_Sinuation_Amplitude    := FieldByName('Runout_Sinuation_Amplitude').AsSingle;
          Min_Runout_Range              := FieldByName('Min_Runout_Range').AsSingle;
          Launch_Method                 := FieldByName('Launch_Method').AsInteger;
          Data_Entry_Method             := FieldByName('Data_Entry_Method').AsInteger;
          Launch_Speed                  := FieldByName('Launch_Speed').AsInteger;
          Opt_Launch_Range_Nuc_Sub      := FieldByName('Opt_Launch_Range_Nuc_Sub').AsSingle;
          Opt_Launch_Range_Conv_Sub     := FieldByName('Opt_Launch_Range_Conv_Sub').AsSingle;
          Opt_Launch_Range_Other        := FieldByName('Opt_Launch_Range_Other').AsSingle;
          Detectability_Type            := FieldByName('Detectability_Type').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------
  function TDMQuery.GetMine_Definition(const id: integer;
    var rec: TMine_Definition): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Mine_Definition ' );

      SQL.Add('WHERE (Mine_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TMine_Definition.Create;
        with rec.FData do begin
          Mine_Index              := FieldByName('Mine_Index').AsInteger;
          Mine_Identifier         := FieldByName('Mine_Identifier').AsString;
          Platform_Domain         := FieldByName('Platform_Domain').AsInteger;
          Platform_Category       := FieldByName('Platform_Category').AsInteger;
          Platform_Type           := FieldByName('Platform_Type').AsInteger;
          Mine_Classification     := FieldByName('Mine_Classification').AsInteger;
          Length                  := FieldByName('Length').AsSingle;
          Width                   := FieldByName('Width').AsSingle;
          Height                  := FieldByName('Height').AsSingle;
          Mooring_Type            := FieldByName('Mooring_Type').AsInteger;
          Max_Laying_Depth        := FieldByName('Max_Laying_Depth').AsSingle;
          Front_Acoustic_Cross    := FieldByName('Front_Acoustic_Cross').AsSingle;
          Side_Acoustic_Cross     := FieldByName('Side_Acoustic_Cross').AsSingle;
          Mine_Lethality          := FieldByName('Mine_Lethality').AsInteger;
          Engagement_Range        := FieldByName('Engagement_Range').AsSingle;
          Anti_Sur_Capable        := FieldByName('Anti_Sur_Capable').AsInteger;
          Anti_SubSur_Capable     := FieldByName('Anti_SubSur_Capable').AsInteger;
          Detectability_Type      := FieldByName('Detectability_Type').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------
  function TDMQuery.GetHybrid_Definition(const id: integer;
    var rec: THybrid_Definition): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Hybrid_Definition ' );

      SQL.Add('WHERE (Hybrid_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := THybrid_Definition.Create;
        with rec.FData do begin
          Hybrid_Index  := FieldByName('Hybrid_Index').AsInteger;
          Missile_Index := FieldByName('Missile_Index').AsInteger;
          Torpedo_Index := FieldByName('Torpedo_Index').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------
  function TDMQuery.GetSatellite_Definition(const id: integer;
    var rec: TSatellite_Definition): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Satellite_Definition ' );

      SQL.Add('WHERE (Satellite_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TSatellite_Definition.Create;
        with rec.FData do begin
          Satellite_Index               := FieldByName('Satellite_Index').AsInteger;
          Satellite_Identifier          := FieldByName('Satellite_Identifier').AsString;
          Platform_Domain               := FieldByName('Platform_Domain').AsInteger;
          Platform_Category             := FieldByName('Platform_Category').AsInteger;
          Platform_Type                 := FieldByName('Platform_Type').AsInteger;
          Length                        := FieldByName('Length').AsSingle;
          Width                         := FieldByName('Width').AsSingle;
          Height                        := FieldByName('Height').AsSingle;
          Front_Radar_Cross             := FieldByName('Front_Radar_Cross').AsSingle;
          Side_Radar_Cross              := FieldByName('Side_Radar_Cross').AsSingle;
          Orbit_Period                  := FieldByName('Orbit_Period').AsInteger;
          Detection_Range_Radius        := FieldByName('Detection_Range_Radius').AsSingle;
          Altitude                      := FieldByName('Altitude').AsSingle;
          Ground_Speed                  := FieldByName('Ground_Speed').AsSingle;
          Plat_Type_Recog_Capability    := FieldByName('Plat_Type_Recog_Capability').AsInteger;
          Plat_Class_Recog_Capability   := FieldByName('Plat_Class_Recog_Capability').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------
  function TDMQuery.GetSonobuoy_Definition(const id: integer;
    var rec: TSonobuoy_Definition): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Sonobuoy_Definition ' );

      SQL.Add('WHERE (Sonobuoy_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TSonobuoy_Definition.Create;
        with rec.FData do begin
          Sonobuoy_Index          := FieldByName('Sonobuoy_Index').AsInteger;
          Class_Identifier        := FieldByName('Class_Identifier').AsString;
          Sonobuoy_Type           := FieldByName('Sonobuoy_Type').AsInteger;
          Platform_Domain         := FieldByName('Platform_Domain').AsInteger;
          Platform_Category       := FieldByName('Platform_Category').AsInteger;
          Platform_Type           := FieldByName('Platform_Type').AsInteger;
          Endurance_Time          := FieldByName('Endurance_Time').AsInteger;
          Max_Depth               := FieldByName('Max_Depth').AsSingle;
          Length                  := FieldByName('Length').AsSingle;
          Width                   := FieldByName('Width').AsSingle;
          Height                  := FieldByName('Height').AsSingle;
          Front_Acoustic_Cross    := FieldByName('Front_Acoustic_Cross').AsSingle;
          Side_Acoustic_Cross     := FieldByName('Side_Acoustic_Cross').AsSingle;
          Damage_Capacity         := FieldByName('Damage_Capacity').AsInteger;
          CPA_Detection_Capable   := FieldByName('CPA_Detection_Capable').AsInteger;
          CPA_Range_Limit         := FieldByName('CPA_Range_Limit').AsSingle;
          Sonar_Index             := FieldByName('Sonar_Index').AsInteger;
        end;
      end;
    end;
  end;


//-------------------------------------------------------------------
  function TDMQuery.GetEO_Detection_Definition(const id: integer;
    var rec: TEO_Detection_Definition): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM EO_Detection_Definition ' );

      SQL.Add('WHERE (EO_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TEO_Detection_Definition.Create;
        with rec.FData do begin
          EO_Index              := FieldByName('EO_Index').AsInteger;
          Class_Identifier      := FieldByName('Class_Identifier').AsString;
          Sensor_Type           := FieldByName('Sensor_Type').AsInteger;
          Detection_Range       := FieldByName('Detection_Range').AsSingle;
          Known_Cross_Section   := FieldByName('Known_Cross_Section').AsSingle;
          Max_Range             := FieldByName('Max_Range').AsSingle;
          Scan_Rate             := FieldByName('Scan_Rate').AsSingle;
          Num_FC_Channels       := FieldByName('Num_FC_Channels').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------
 ////====================================================

//-------------------------------------------------------------------
 ////====================================================
  function TDMQuery.GetNote_Storage(const id: integer;
    var rec: TNote_Storage): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Note_Storage ' );

      SQL.Add('WHERE (Note_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TNote_Storage.Create;
        with rec.FData do begin
          Note_Index                := FieldByName('Note_Index').AsInteger;
          Note_Type                 := FieldByName('Note_Type').AsInteger;
          Vehicle_Index             := FieldByName('Vehicle_Index').AsInteger;
          Missile_Index             := FieldByName('Missile_Index').AsInteger;
          Mine_Index                := FieldByName('Mine_Index').AsInteger;
          Torpedo_Index             := FieldByName('Torpedo_Index').AsInteger;
          Satellite_Index           := FieldByName('Satellite_Index').AsInteger;
          Sonobuoy_Index            := FieldByName('Sonobuoy_Index').AsInteger;
          Radar_Index               := FieldByName('Radar_Index').AsInteger;
          FCR_Index                 := FieldByName('FCR_Index').AsInteger;
          Sonar_Index               := FieldByName('Sonar_Index').AsInteger;
          ESM_Index                 := FieldByName('ESM_Index').AsInteger;
          MAD_Index                 := FieldByName('MAD_Index').AsInteger;
          EO_Index                  := FieldByName('EO_Index').AsInteger;
          Gun_Index                 := FieldByName('Gun_Index').AsInteger;
          Bomb_Index                := FieldByName('Bomb_Index').AsInteger;
          Jammer_Index              := FieldByName('Jammer_Index').AsInteger;
          Defensive_Jammer_Index    := FieldByName('Defensive_Jammer_Index').AsInteger;
          Towed_Decoy_Index         := FieldByName('Towed_Decoy_Index').AsInteger;
          Floating_Decoy_Index      := FieldByName('Floating_Decoy_Index').AsInteger;
          Chaff_Index               := FieldByName('Chaff_Index').AsInteger;
          Decoy_Index               := FieldByName('Decoy_Index').AsInteger;
          Air_Bubble_Index          := FieldByName('Air_Bubble_Index').AsInteger;
          Pattern_Index             := FieldByName('Pattern_Index').AsInteger;
          Notes                     := FieldByName('Notes').AsString;
          Infrared_Decoy_Index      := FieldByName('Infrared_Decoy_Index').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------
////====================================================
  function TDMQuery.GetMotion_Characteristics(const id: integer;
    var rec: TMotion_Characteristics): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Motion_Characteristics ' );

      SQL.Add('WHERE (Motion_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TMotion_Characteristics.Create;
        with rec.FData do begin
          Motion_Index                := FieldByName('Motion_Index').AsInteger;
          Motion_Identifier           := FieldByName('Motion_Identifier').AsString;
          Motion_Type                 := FieldByName('Motion_Type').AsInteger;
          Max_Altitude                := FieldByName('Max_Altitude').AsSingle;
          Max_Depth                   := FieldByName('Max_Depth').AsSingle;
          Min_Ground_Speed            := FieldByName('Min_Ground_Speed').AsSingle;
          Cruise_Ground_Speed         := FieldByName('Cruise_Ground_Speed').AsSingle;
          High_Ground_Speed           := FieldByName('High_Ground_Speed').AsSingle;
          Max_Ground_Speed            := FieldByName('Max_Ground_Speed').AsSingle;
          Acceleration                := FieldByName('Acceleration').AsSingle;
          Deceleration                := FieldByName('Deceleration').AsSingle;
          Normal_Climb_Rate           := FieldByName('Normal_Climb_Rate').AsSingle;
          Max_Climb_Rate              := FieldByName('Max_Climb_Rate').AsSingle;
          Normal_Descent_Rate         := FieldByName('Normal_Descent_Rate').AsSingle;
          Max_Descent_Rate            := FieldByName('Max_Descent_Rate').AsSingle;
          Vertical_Accel              := FieldByName('Vertical_Accel').AsSingle;
          Standard_Turn_Rate          := FieldByName('Standard_Turn_Rate').AsSingle;
          Tight_Turn_Rate             := FieldByName('Tight_Turn_Rate').AsSingle;
          Max_Helm_Angle              := FieldByName('Max_Helm_Angle').AsSingle;
          Helm_Angle_Rate             := FieldByName('Helm_Angle_Rate').AsSingle;
          Speed_Reduce_In_Turn        := FieldByName('Speed_Reduce_In_Turn').AsSingle;
          Time_To_Reduce_Speed        := FieldByName('Time_To_Reduce_Speed').AsSingle;
          Min_Speed_To_Reduce         := FieldByName('Min_Speed_To_Reduce').AsSingle;
          Rate_of_Turn_Rate_Chg       := FieldByName('Rate_of_Turn_Rate_Chg').AsSingle;
          Min_Pitch_Angle             := FieldByName('Min_Pitch_Angle').AsSingle;
          Max_Pitch_Angle             := FieldByName('Max_Pitch_Angle').AsSingle;
          Max_Roll_Angle              := FieldByName('Max_Roll_Angle').AsSingle;
          Endurance_Type              := FieldByName('Endurance_Type').AsInteger;
          Endurance_Time              := FieldByName('Endurance_Time').AsInteger;
          Max_Effective_Range         := FieldByName('Max_Effective_Range').AsSingle;
          Fuel_Unit_Type              := FieldByName('Fuel_Unit_Type').AsInteger;
          Max_Fuel_Capacity           := FieldByName('Max_Fuel_Capacity').AsSingle;
          Min_Speed_Fuel_Consume      := FieldByName('Min_Speed_Fuel_Consume').AsFloat;
          Cruise_Speed_Fuel_Consume   := FieldByName('Cruise_Speed_Fuel_Consume').AsFloat;
          High_Speed_Fuel_Consume     := FieldByName('High_Speed_Fuel_Consume').AsFloat;
          Max_Speed_Fuel_Consume      := FieldByName('Max_Speed_Fuel_Consume').AsFloat;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------
////====================================================
  function TDMQuery.GetFitted_Weapon_On_Board(const id: integer;
    var rec: TFitted_Weapon_On_Board): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Fitted_Weapon_On_Board ' );

      SQL.Add('WHERE (Fitted_Weap_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TFitted_Weapon_On_Board.Create;
        with rec.FData do begin
          Fitted_Weap_Index       := FieldByName('Fitted_Weap_Index').AsInteger;
          Instance_Identifier     := FieldByName('Instance_Identifier').AsString;
          Instance_Type           := FieldByName('Instance_Type').AsInteger;
          Vehicle_Index           := FieldByName('Vehicle_Index').AsInteger;
          Mount_Type              := FieldByName('Mount_Type').AsInteger;
          Launch_Angle            := FieldByName('Launch_Angle').AsSingle;
          Launch_Angle_Required   := FieldByName('Launch_Angle_Required').AsInteger;
          Quantity                := FieldByName('Quantity').AsInteger;
          Firing_Delay            := FieldByName('Firing_Delay').AsSingle;
          Missile_Index           := FieldByName('Missile_Index').AsInteger;
          Torpedo_Index           := FieldByName('Torpedo_Index').AsInteger;
          Mine_Index              := FieldByName('Mine_Index').AsInteger;
          Hybrid_Index            := FieldByName('Hybrid_Index').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------
////====================================================

//-------------------------------------------------------------------
 ////====================================================
  function TDMQuery.GetPredefined_Pattern(const id: integer;
    var rec: TPredefined_Pattern): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Predefined_Pattern ' );

      SQL.Add('WHERE (Pattern_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TPredefined_Pattern.Create;
        with rec.FData do begin
          Pattern_Index         := FieldByName('Pattern_Index').AsInteger;
          Pattern_Identifier    := FieldByName('Pattern_Identifier').AsString;
          Pattern_Type          := FieldByName('Pattern_Type').AsInteger;
          Vehicle_Index         := FieldByName('Vehicle_Index').AsInteger;
          Pattern_Termination   := FieldByName('Pattern_Termination').AsInteger;
          Termination_Heading   := FieldByName('Termination_Heading').AsSingle;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------
 ////====================================================

//----------------------------------------------------------------

//-------------------------------------------------------------------
////====================================================
  function TDMQuery.GetPlatform_Instance_Identifier(const id: integer;
    var rec: TPlatform_Instance_Identifier): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Platform_Instance_Identifier ' );

      SQL.Add('WHERE (Instance_Ident_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TPlatform_Instance_Identifier.Create;
        with rec.FData do begin
          Instance_Ident_Index    := FieldByName('Instance_Ident_Index').AsInteger;
          Vehicle_Index           := FieldByName('Vehicle_Index').AsInteger;
          Instance_Identifier     := FieldByName('Instance_Identifier').AsString;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------
////====================================================
  function TDMQuery.GetPlatform_Library_Entry(const id: integer;
    var rec: TPlatform_Library_Entry): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Platform_Library_Entry ' );

      SQL.Add('WHERE (Library_Entry_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TPlatform_Library_Entry.Create;
        with rec.FData do begin
          Library_Entry_Index   := FieldByName('Library_Entry_Index').AsInteger;
          Library_Index         := FieldByName('Library_Index').AsInteger;
          Platform_Type         := FieldByName('Platform_Type').AsInteger;
          Vehicle_Index         := FieldByName('Vehicle_Index').AsInteger;
          Missile_Index         := FieldByName('Missile_Index').AsInteger;
          Torpedo_Index         := FieldByName('Torpedo_Index').AsInteger;
          Mine_Index            := FieldByName('Mine_Index').AsInteger;
          Hybrid_Index          := FieldByName('Hybrid_Index').AsInteger;
          Satellite_Index       := FieldByName('Satellite_Index').AsInteger;
          Sonobuoy_Index        := FieldByName('Sonobuoy_Index').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------
////====================================================
  function TDMQuery.GetSonobuoy_On_Board(const id: integer;
    var rec: TSonobuoy_On_Board): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Sonobuoy_On_Board ' );

      SQL.Add('WHERE (Sonobuoy_Instance_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TSonobuoy_On_Board.Create;
        with rec.FData do begin
          Sonobuoy_Instance_Index   := FieldByName('Sonobuoy_Instance_Index').AsInteger;
          Instance_Identifier       := FieldByName('Instance_Identifier').AsString;
          Instance_Type             := FieldByName('Instance_Type').AsInteger;
          Vehicle_Index             := FieldByName('Vehicle_Index').AsInteger;
          Sonobuoy_Index            := FieldByName('Sonobuoy_Index').AsInteger;
          Quantity                  := FieldByName('Quantity').AsInteger;
          Sonar_Instance_Index      := FieldByName('Sonar_Instance_Index').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

//-------------------------------------------------------------------
////====================================================
  function TDMQuery.GetHelicopter_Land_Launch_Limits(const id: integer;
    var rec: THelicopter_Land_Launch_Limits): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Helicopter_Land_Launch_Limits ' );

      SQL.Add('WHERE (Vehicle_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := THelicopter_Land_Launch_Limits.Create;
        with rec.FData do begin
          Vehicle_Index                 := FieldByName('Vehicle_Index').AsInteger;
          Max_Relative_Wind_Magnitude   := FieldByName('Max_Relative_Wind_Magnitude').AsSingle;
          Max_Turn_Rate_To_Launch       := FieldByName('Max_Turn_Rate_To_Launch').AsInteger;
          Max_Turn_Rate_To_Land         := FieldByName('Max_Turn_Rate_To_Land').AsInteger;
          Max_Landing_Altitude          := FieldByName('Max_Landing_Altitude').AsSingle;
          Max_Relative_Speed            := FieldByName('Max_Relative_Speed').AsInteger;
          Approach_Range                := FieldByName('Approach_Range').AsSingle;
          Approach_Center_Bearing       := FieldByName('Approach_Center_Bearing').AsInteger;
          Approach_Sector_Width         := FieldByName('Approach_Sector_Width').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------
 ////====================================================
  function TDMQuery.GetHosted_Platform(const id: integer;
    var rec: THosted_Platform): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Hosted_Platform ' );

      SQL.Add('WHERE (Slave_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := THosted_Platform.Create;
        with rec.FData do begin
          Slave_Index             := FieldByName('Slave_Index').AsInteger;
          Vehicle_Index           := FieldByName('Vehicle_Index').AsInteger;
          Hosted_Vehicle_Index    := FieldByName('Hosted_Vehicle_Index').AsInteger;
          Quantity                := FieldByName('Quantity').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------
////====================================================
////====================================================

//-------------------------------------------------------------------
////====================================================

 ////====================================================
  function TDMQuery.GetPlatform_DIS_Definition(const id: integer;
    var rec: TPlatform_DIS_Definition): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Platform_DIS_Definition ' );

      SQL.Add('WHERE (Platform_DIS_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TPlatform_DIS_Definition.Create;
        with rec.FData do begin
          Platform_DIS_Index    := FieldByName('Platform_DIS_Index').AsInteger;
          DIS_Type              := FieldByName('DIS_Type').AsInteger;
          Vehicle_Index         := FieldByName('Vehicle_Index').AsInteger;
          Missile_Index         := FieldByName('Missile_Index').AsInteger;
          Mine_Index            := FieldByName('Mine_Index').AsInteger;
          Torpedo_Index         := FieldByName('Torpedo_Index').AsInteger;
          Hybrid_Index          := FieldByName('Hybrid_Index').AsInteger;
          Satellite_Index       := FieldByName('Satellite_Index').AsInteger;
          Sonobuoy_Index        := FieldByName('Sonobuoy_Index').AsInteger;
          DIS_Kind              := FieldByName('DIS_Kind').AsInteger;
          DIS_Domain            := FieldByName('DIS_Domain').AsInteger;
          DIS_Country           := FieldByName('DIS_Country').AsInteger;
          DIS_Category          := FieldByName('DIS_Category').AsInteger;
          DIS_Subcategory       := FieldByName('DIS_Subcategory').AsInteger;
          DIS_Specific          := FieldByName('DIS_Specific').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------
////====================================================
  function TDMQuery.GetSonar_Definition(const id: integer;
    var rec: TSonar_Definition): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Sonar_Definition ' );

      SQL.Add('WHERE (Sonar_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TSonar_Definition.Create;
        with rec.FData do begin
          Sonar_Index                       := FieldByName('Sonar_Index').AsInteger;
          Sonar_Identifier                  := FieldByName('Sonar_Identifier').AsString;
          Sonar_Category_Index              := FieldByName('Sonar_Category_Index').AsInteger;
          Sonar_Classification              := FieldByName('Sonar_Classification').AsInteger;
          Passive_Int_Period                := FieldByName('Passive_Int_Period').AsInteger;
          Active_Int_Period                 := FieldByName('Active_Int_Period').AsInteger;
          TIOW_Short_Range                  := FieldByName('TIOW_Short_Range').AsSingle;
          TIOW_Medium_Range                 := FieldByName('TIOW_Medium_Range').AsSingle;
          TIOW_Long_Range                   := FieldByName('TIOW_Long_Range').AsSingle;
          Passive_Detect_Range              := FieldByName('Passive_Detect_Range').AsSingle;
          Active_Detect_Range               := FieldByName('Active_Detect_Range').AsSingle;
          Max_Detect_Range                  := FieldByName('Max_Detect_Range').AsSingle;
          Known_Signal_Source               := FieldByName('Known_Signal_Source').AsSingle;
          Known_Cross_Section               := FieldByName('Known_Cross_Section').AsSingle;
          Sonar_Directivity_Index           := FieldByName('Sonar_Directivity_Index').AsSingle;
          Active_Operating_Power            := FieldByName('Active_Operating_Power').AsSingle;
          Active_Freq_of_Op                 := FieldByName('Active_Freq_of_Op').AsSingle;
          Passive_Freq_of_Op                := FieldByName('Passive_Freq_of_Op').AsSingle;
          Max_Operating_Depth               := FieldByName('Max_Operating_Depth').AsSingle;
          Sonar_Depth_Rate_of_Change        := FieldByName('Sonar_Depth_Rate_of_Change').AsSingle;
          Depth_per_Speed                   := FieldByName('Depth_per_Speed').AsSingle;
          Kinking_Processing                := FieldByName('Kinking_Processing').AsBoolean;
          Turn_Rate_2_Kink                  := FieldByName('Turn_Rate_2_Kink').AsSingle;
          Time_2_Settle_Kinked              := FieldByName('Time_2_Settle_Kinked').AsInteger;
          Bearing_Processing                := FieldByName('Bearing_Processing').AsBoolean;
          Time_2_Resolve_Bearing            := FieldByName('Time_2_Resolve_Bearing').AsInteger;
          Passive_Processing                := FieldByName('Passive_Processing').AsBoolean;
          Target_Identification             := FieldByName('Target_Identification').AsBoolean;
          Time_2_Identify                   := FieldByName('Time_2_Identify').AsInteger;
          Curve_Detection_Index             := FieldByName('Curve_Detection_Index').AsInteger;
          Track_Analysis                    := FieldByName('Track_Analysis').AsInteger;
          Time_2_Provide_Track              := FieldByName('Time_2_Provide_Track').AsInteger;
          Ownship_Increase_due_to_Active    := FieldByName('Ownship_Increase_due_to_Active').AsSingle;
          Tow_Speed                         := FieldByName('Tow_Speed').AsSingle;
          Minimum_Depth                     := FieldByName('Minimum_Depth').AsSingle;
          Maximum_Tow_Speed                 := FieldByName('Maximum_Tow_Speed').AsSingle;
          Maximum_Sonar_Speed               := FieldByName('Maximum_Sonar_Speed').AsSingle;
          Depth_Finding_Capable             := FieldByName('Depth_Finding_Capable').AsBoolean;
          Tracking_Capable                  := FieldByName('Tracking_Capable').AsBoolean;
          Surface_Detection_Capable         := FieldByName('Surface_Detection_Capable').AsBoolean;
          SubSurface_Detection_Capable      := FieldByName('SubSurface_Detection_Capable').AsBoolean;
          Torpedo_Detection_Capable         := FieldByName('Torpedo_Detection_Capable').AsBoolean;
          Mine_Detection_Capable            := FieldByName('Mine_Detection_Capable').AsBoolean;
          Cable_Length                      := FieldByName('Cable_Length').AsSingle;
          Maximum_Reported_Bearing_Error    := FieldByName('Maximum_Reported_Bearing_Error').AsSingle;
          Average_Beam_Width                := FieldByName('Average_Beam_Width').AsSingle;
          Counter_Detection_Factor          := FieldByName('Counter_Detection_Factor').AsSingle;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------
/// /====================================================
function TDMQuery.GetAcoustic_Decoy_Definition(const id: integer;
  var rec: TAcoustic_Decoy_Definition): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Acoustic_Decoy_Definition ');

    SQL.Add('WHERE (Decoy_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TAcoustic_Decoy_Definition.Create;
      with rec.FData do
      begin
        Decoy_Index := FieldByName('Decoy_Index').AsInteger;
        Decoy_Identifier := FieldByName('Decoy_Identifier').AsString;
        Acoustic_Intensity_Increase := FieldByName
          ('Acoustic_Intensity_Increase').AsSingle;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
// -------------------------------------------------------------------//-------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetAcoustic_Decoy_POH_Modifier(const id: integer;
  var rec: TAcoustic_Decoy_POH_Modifier): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Acoustic_Decoy_POH_Modifier ');

    SQL.Add('WHERE (Decoy_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TAcoustic_Decoy_POH_Modifier.Create;
      with rec.FData do
      begin
        Decoy_Index := FieldByName('Decoy_Index').AsInteger;
        Torpedo_Guidance_Type := FieldByName('Torpedo_Guidance_Type').AsInteger;
        Aspect_Angle := FieldByName('Aspect_Angle').AsInteger;
        POH_Modifier := FieldByName('POH_Modifier').AsSingle;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetAir_Bubble_Definition(const id: integer;
  var rec: TAir_Bubble_Definition): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Air_Bubble_Definition ');

    SQL.Add('WHERE (Air_Bubble_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TAir_Bubble_Definition.Create;
      with rec.FData do
      begin
        Air_Bubble_Index := FieldByName('Air_Bubble_Index').AsInteger;
        Air_Bubble_Identifier := FieldByName('Air_Bubble_Identifier').AsString;
        Platform_Domain := FieldByName('Platform_Domain').AsInteger;
        Platform_Category := FieldByName('Platform_Category').AsInteger;
        Platform_Type := FieldByName('Platform_Type').AsInteger;
        Max_Acoustic_Cross := FieldByName('Max_Acoustic_Cross').AsSingle;
        Dissipation_Time := FieldByName('Dissipation_Time').AsSingle;
        Ascent_Rate := FieldByName('Ascent_Rate').AsSingle;
        Descent_Rate := FieldByName('Descent_Rate').AsSingle;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
{function TDMQuery.GetAir_Bubble_Mount(const id: integer;
  var rec: TAir_Bubble_Mount): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Air_Bubble_Mount ');

    SQL.Add('WHERE (Air_Bubble_Instance_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TAir_Bubble_Mount.Create;
      with rec.FData do
      begin
        Air_Bubble_Instance_Index := FieldByName('Air_Bubble_Instance_Index')
          .AsInteger;
        Instance_Identifier := FieldByName('Instance_Identifier').AsString;
        Instance_Type := FieldByName('Instance_Type').AsInteger;
        Bubble_Qty_On_Board := FieldByName('Bubble_Qty_On_Board').AsInteger;
        Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
        Air_Bubble_Index := FieldByName('Air_Bubble_Index').AsInteger;
      end;
    end;
  end;
end;

}
// -------------------------------------------------------------------
////====================================================

  //------------------------------------------------------------------------------


/// /====================================================
function TDMQuery.GetAsset_Deployment_Definition(const id: integer;
  var rec: TAsset_Deployment_Definition): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Asset_Deployment_Definition ');

    SQL.Add('WHERE (Deployment_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TAsset_Deployment_Definition.Create;
      with rec.FData do
      begin
        Deployment_Index := FieldByName('Deployment_Index').AsInteger;
        Deployment_Identifier := FieldByName('Deployment_Identifier').AsString;
        Scenario_Index := FieldByName('Scenario_Index').AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetBlind_Zone_Definition(const id: integer;
  var rec: TBlind_Zone_Definition): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Blind_Zone_Definition ');

    SQL.Add('WHERE (Blind_Zone_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TBlind_Zone_Definition.Create;
      with rec.FData do
      begin
        Blind_Zone_Index := FieldByName('Blind_Zone_Index').AsInteger;
        Blind_Zone_Type := FieldByName('Blind_Zone_Type').AsInteger;
        BlindZone_Number := FieldByName('BlindZone_Number').AsInteger;
        FCR_Instance_Index := FieldByName('FCR_Instance_Index').AsInteger;
        ESM_Instance_Index := FieldByName('ESM_Instance_Index').AsInteger;
        EO_Instance_Index := FieldByName('EO_Instance_Index').AsInteger;
        Visual_Instance_Index := FieldByName('Visual_Instance_Index').AsInteger;
        Point_Effect_Index := FieldByName('Point_Effect_Index').AsInteger;
        Fitted_Weap_Index := FieldByName('Fitted_Weap_Index').AsInteger;
        Sonar_Instance_Index := FieldByName('Sonar_Instance_Index').AsInteger;
        Radar_Instance_Index := FieldByName('Radar_Instance_Index').AsInteger;
        Start_Angle := FieldByName('Start_Angle').AsSingle;
        End_Angle := FieldByName('End_Angle').AsSingle;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetBomb_Definition(const id: integer; var rec: TBomb_Definition)
  : boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Bomb_Definition ');

    SQL.Add('WHERE (Bomb_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TBomb_Definition.Create;
      with rec.FData do
      begin
        Bomb_Index := FieldByName('Bomb_Index').AsInteger;
        Bomb_Identifier := FieldByName('Bomb_Identifier').AsString;
        Bomb_Type := FieldByName('Bomb_Type').AsInteger;
        Lethality := FieldByName('Lethality').AsInteger;
        Min_Range := FieldByName('Min_Range').AsSingle;
        Max_Range := FieldByName('Max_Range').AsSingle;
        Anti_Sur_Capable := FieldByName('Anti_Sur_Capable').AsInteger;
        Anti_SubSur_Capable := FieldByName('Anti_SubSur_Capable').AsInteger;
        Anti_Land_Capable := FieldByName('Anti_Land_Capable').AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetBomb_POH_vs_Range(const id: integer;
  var rec: TBomb_POH_vs_Range): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Bomb_POH_vs_Range ');

    SQL.Add('WHERE (List_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TBomb_POH_vs_Range.Create;
      with rec.FData do
      begin
        List_Index := FieldByName('List_Index').AsInteger;
        Bomb_Index := FieldByName('Bomb_Index').AsInteger;
        Prob_of_Hit := FieldByName('Prob_of_Hit').AsSingle;
        Range := FieldByName('Range').AsSingle;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetChaff_Definition(const id: integer;
  var rec: TChaff_Definition): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Chaff_Definition ');

    SQL.Add('WHERE (Chaff_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TChaff_Definition.Create;
      with rec.FData do
      begin
        Chaff_Index := FieldByName('Chaff_Index').AsInteger;
        Chaff_Identifier := FieldByName('Chaff_Identifier').AsString;
        Platform_Domain := FieldByName('Platform_Domain').AsInteger;
        Platform_Category := FieldByName('Platform_Category').AsInteger;
        Platform_Type := FieldByName('Platform_Type').AsInteger;
        Max_Radar_Cross := FieldByName('Max_Radar_Cross').AsSingle;
        Bloom_Time := FieldByName('Bloom_Time').AsInteger;
        Max_Dissipation_Time := FieldByName('Max_Dissipation_Time').AsInteger;
        Min_Dissipation_Time := FieldByName('Min_Dissipation_Time').AsInteger;
        Descent_Rate := FieldByName('Descent_Rate').AsSingle;
        Max_Radius := FieldByName('Max_Radius').AsSingle;
        Max_Radar_Attenuation := FieldByName('Max_Radar_Attenuation').AsSingle;
        Radar_Affect_Lower_Freq := FieldByName('Radar_Affect_Lower_Freq')
          .AsSingle;
        Radar_Affect_Upper_Freq := FieldByName('Radar_Affect_Upper_Freq')
          .AsSingle;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetChaff_On_Board(const id: integer; var rec: TChaff_On_Board)
  : boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Chaff_On_Board ');

    SQL.Add('WHERE (vehicle_index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TChaff_On_Board.Create;
      with rec.FData do
      begin
        Chaff_Instance_Index := FieldByName('Chaff_Instance_Index').AsInteger;
        Instance_Identifier := FieldByName('Instance_Identifier').AsString;
        Instance_Type := FieldByName('Instance_Type').AsInteger;
        Chaff_Qty_On_Board := FieldByName('Chaff_Qty_On_Board').AsInteger;
        Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
        Chaff_Index := FieldByName('Chaff_Index').AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetCloud_Effects_On_ESM(const id: integer;
  var rec: TCloud_Effects_On_ESM): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Cloud_Effects_On_ESM ');

    SQL.Add('WHERE (Radar_Frequency = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TCloud_Effects_On_ESM.Create;
      with rec.FData do
      begin
        Radar_Frequency := FieldByName('Radar_Frequency').AsSingle;
        Cloud_0_Effect := FieldByName('Cloud_0_Effect').AsSingle;
        Cloud_1_Effect := FieldByName('Cloud_1_Effect').AsSingle;
        Cloud_2_Effect := FieldByName('Cloud_2_Effect').AsSingle;
        Cloud_3_Effect := FieldByName('Cloud_3_Effect').AsSingle;
        Cloud_4_Effect := FieldByName('Cloud_4_Effect').AsSingle;
        Cloud_5_Effect := FieldByName('Cloud_5_Effect').AsSingle;
        Cloud_6_Effect := FieldByName('Cloud_6_Effect').AsSingle;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetCloud_Effects_On_Radar(const id: integer;
  var rec: TCloud_Effects_On_Radar): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Cloud_Effects_On_Radar ');

    SQL.Add('WHERE (Radar_Frequency = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TCloud_Effects_On_Radar.Create;
      with rec.FData do
      begin
        Radar_Frequency := FieldByName('Radar_Frequency').AsSingle;
        Cloud_0_Effect := FieldByName('Cloud_0_Effect').AsSingle;
        Cloud_1_Effect := FieldByName('Cloud_1_Effect').AsSingle;
        Cloud_2_Effect := FieldByName('Cloud_2_Effect').AsSingle;
        Cloud_3_Effect := FieldByName('Cloud_3_Effect').AsSingle;
        Cloud_4_Effect := FieldByName('Cloud_4_Effect').AsSingle;
        Cloud_5_Effect := FieldByName('Cloud_5_Effect').AsSingle;
        Cloud_6_Effect := FieldByName('Cloud_6_Effect').AsSingle;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetConditional_Event_Definition(const id: integer;
  var rec: TConditional_Event_Definition): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Conditional_Event_Definition ');

    SQL.Add('WHERE (Conditional_Event_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TConditional_Event_Definition.Create;
      with rec.FData do
      begin
        Conditional_Event_Index := FieldByName('Conditional_Event_Index')
          .AsInteger;
        Conditional_Identifier := FieldByName('Conditional_Identifier')
          .AsString;
        Conditional_Event_Type := FieldByName('Conditional_Event_Type')
          .AsInteger;
        Response_Speed := FieldByName('Response_Speed').AsInteger;
        Response_Altitude := FieldByName('Response_Altitude').AsInteger;
        Response_Range := FieldByName('Response_Range').AsSingle;
        Cleared_2_Attack := FieldByName('Cleared_2_Attack').AsInteger;
        Check_Fuel := FieldByName('Check_Fuel').AsInteger;
        Fuel_Condition := FieldByName('Fuel_Condition').AsInteger;
        Fuel_Threshold := FieldByName('Fuel_Threshold').AsSingle;
        Check_Weapons := FieldByName('Check_Weapons').AsInteger;
        Weapons_Condition := FieldByName('Weapons_Condition').AsInteger;
        Weapons_Inventory := FieldByName('Weapons_Inventory').AsInteger;
        Check_Damage := FieldByName('Check_Damage').AsInteger;
        Damage_Condition := FieldByName('Damage_Condition').AsInteger;
        Current_Damage_State := FieldByName('Current_Damage_State').AsSingle;
        Hit_By_Weapon := FieldByName('Hit_By_Weapon').AsInteger;
        Lock_By_FCR_or_Weap := FieldByName('Lock_By_FCR_or_Weap').AsInteger;
        Check_Target_Domain := FieldByName('Check_Target_Domain').AsInteger;
        Target_Plat_Domain := FieldByName('Target_Plat_Domain').AsInteger;
        Check_Target_Type := FieldByName('Check_Target_Type').AsInteger;
        Target_Plat_Type := FieldByName('Target_Plat_Type').AsInteger;
        Check_Target_Threat := FieldByName('Check_Target_Threat').AsInteger;
        Target_Plat_Threat_Class := FieldByName('Target_Plat_Threat_Class')
          .AsInteger;
        Check_Target_Duration := FieldByName('Check_Target_Duration').AsInteger;
        Target_Duration_State := FieldByName('Target_Duration_State').AsInteger;
        Target_Range_Duration := FieldByName('Target_Range_Duration').AsInteger;
        Check_Target_Range := FieldByName('Check_Target_Range').AsInteger;
        Target_Range_Condition := FieldByName('Target_Range_Condition')
          .AsInteger;
        Target_Plat_Range := FieldByName('Target_Plat_Range').AsSingle;
        Check_Target_Delta := FieldByName('Check_Target_Delta').AsInteger;
        Target_Delta_Condition := FieldByName('Target_Delta_Condition')
          .AsInteger;
        Target_Plat_Altitude_Delta := FieldByName('Target_Plat_Altitude_Delta')
          .AsSingle;
        Check_Target_Altitude := FieldByName('Check_Target_Altitude').AsInteger;
        Target_Altitude_Condition := FieldByName('Target_Altitude_Condition')
          .AsInteger;
        Target_Platform_Altitude := FieldByName('Target_Platform_Altitude')
          .AsSingle;
        Check_Target_Speed := FieldByName('Check_Target_Speed').AsInteger;
        Target_Speed_Condition := FieldByName('Target_Speed_Condition')
          .AsInteger;
        Target_Platform_Speed := FieldByName('Target_Platform_Speed').AsSingle;
        Check_Own_Position := FieldByName('Check_Own_Position').AsInteger;
        Own_In_Geo := FieldByName('Own_In_Geo').AsInteger;
        Check_Encountered_Position := FieldByName('Check_Encountered_Position')
          .AsInteger;
        Encountered_In_Geo := FieldByName('Encountered_In_Geo').AsInteger;
        Geo_Area_Index := FieldByName('Geo_Area_Index').AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetConditional_Event_List(const id: integer;
  var rec: TConditional_Event_List): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Conditional_Event_List ');

    SQL.Add('WHERE (Event_List_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TConditional_Event_List.Create;
      with rec.FData do
      begin
        Event_List_Index := FieldByName('Event_List_Index').AsInteger;
        Event_List_Identifier := FieldByName('Event_List_Identifier').AsString;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetCubicle_Group(const id: integer; var rec: TCubicle_Group)
  : boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Cubicle_Group ');

    SQL.Add('WHERE (Group_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TCubicle_Group.Create;
      with rec.FData do
      begin
        Group_Index := FieldByName('Group_Index').AsInteger;
        Deployment_Index := FieldByName('Deployment_Index').AsInteger;
        Group_Identifier := FieldByName('Group_Identifier').AsString;
        Force_Designation := FieldByName('Force_Designation').AsInteger;
        Tracks_Block := FieldByName('Tracks_Block').AsInteger;
        Track_Block_Start := FieldByName('Track_Block_Start').AsInteger;
        Track_Block_End := FieldByName('Track_Block_End').AsInteger;
        Zulu_Zulu := FieldByName('Zulu_Zulu').AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetCubicle_Group_Assignment(const id: integer;
  var rec: TCubicle_Group_Assignment): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Cubicle_Group_Assignment ');

    SQL.Add('WHERE (Platform_Instance_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TCubicle_Group_Assignment.Create;
      with rec.FData do
      begin
        Platform_Instance_Index := FieldByName('Platform_Instance_Index')
          .AsInteger;
        Group_Index := FieldByName('Group_Index').AsInteger;
        Command_Priority := FieldByName('Command_Priority').AsInteger;
        Deployment_Index := FieldByName('Deployment_Index').AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetCubicle_Group_Channel_Assgnmnt(const id: integer;
  var rec: TCubicle_Group_Channel_Assgnmnt): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Cubicle_Group_Channel_Assgnmnt ');

    SQL.Add('WHERE (Group_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TCubicle_Group_Channel_Assgnmnt.Create;
      with rec.FData do
      begin
        Group_Index := FieldByName('Group_Index').AsInteger;
        Channel_Slot := FieldByName('Channel_Slot').AsInteger;
        Comms_Channel_Index := FieldByName('Comms_Channel_Index').AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetDIS_Category_Definition(const id: integer;
  var rec: TDIS_Category_Definition): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM DIS_Category_Definition ');

    SQL.Add('WHERE (DIS_Category_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TDIS_Category_Definition.Create;
      with rec.FData do
      begin
        DIS_Category_Index := FieldByName('DIS_Category_Index').AsInteger;
        DIS_Category_Enumeration := FieldByName('DIS_Category_Enumeration')
          .AsInteger;
        DIS_Category_Identifier := FieldByName('DIS_Category_Identifier')
          .AsString;
        DIS_Country_Index := FieldByName('DIS_Country_Index').AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetDIS_Country_Definition(const id: integer;
  var rec: TDIS_Country_Definition): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM DIS_Country_Definition ');

    SQL.Add('WHERE (DIS_Country_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TDIS_Country_Definition.Create;
      with rec.FData do
      begin
        DIS_Country_Index := FieldByName('DIS_Country_Index').AsInteger;
        DIS_Country_Identifier := FieldByName('DIS_Country_Identifier')
          .AsString;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetDIS_Domain_Country_Mapping(const id: integer;
  var rec: TDIS_Domain_Country_Mapping): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM DIS_Domain_Country_Mapping ');

    SQL.Add('WHERE (DIS_Domain_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TDIS_Domain_Country_Mapping.Create;
      with rec.FData do
      begin
        DIS_Domain_Index := FieldByName('DIS_Domain_Index').AsInteger;
        DIS_Country_Index := FieldByName('DIS_Country_Index').AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetDIS_Domain_Definition(const id: integer;
  var rec: TDIS_Domain_Definition): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM DIS_Domain_Definition ');

    SQL.Add('WHERE (DIS_Domain_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TDIS_Domain_Definition.Create;
      with rec.FData do
      begin
        DIS_Domain_Index := FieldByName('DIS_Domain_Index').AsInteger;
        DIS_Domain_Identifier := FieldByName('DIS_Domain_Identifier').AsString;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetDIS_Kind_Definition(const id: integer;
  var rec: TDIS_Kind_Definition): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM DIS_Kind_Definition ');

    SQL.Add('WHERE (DIS_Kind_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TDIS_Kind_Definition.Create;
      with rec.FData do
      begin
        DIS_Kind_Index := FieldByName('DIS_Kind_Index').AsInteger;
        DIS_Kind_Identifier := FieldByName('DIS_Kind_Identifier').AsString;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetDIS_Kind_Domain_Mapping(const id: integer;
  var rec: TDIS_Kind_Domain_Mapping): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM DIS_Kind_Domain_Mapping ');

    SQL.Add('WHERE (DIS_Kind_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TDIS_Kind_Domain_Mapping.Create;
      with rec.FData do
      begin
        DIS_Kind_Index := FieldByName('DIS_Kind_Index').AsInteger;
        DIS_Domain_Index := FieldByName('DIS_Domain_Index').AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetDIS_Specific_Definition(const id: integer;
  var rec: TDIS_Specific_Definition): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM DIS_Specific_Definition ');

    SQL.Add('WHERE (DIS_Specific_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TDIS_Specific_Definition.Create;
      with rec.FData do
      begin
        DIS_Specific_Index := FieldByName('DIS_Specific_Index').AsInteger;
        DIS_Specific_Enumeration := FieldByName('DIS_Specific_Enumeration')
          .AsInteger;
        DIS_Specific_Identifier := FieldByName('DIS_Specific_Identifier')
          .AsString;
        DIS_Subcategory_Index := FieldByName('DIS_Subcategory_Index').AsInteger;
        SARH_POH_Modifier := FieldByName('SARH_POH_Modifier').AsSingle;
        CG_POH_Modifier := FieldByName('CG_POH_Modifier').AsSingle;
        TARH_POH_Modifier := FieldByName('TARH_POH_Modifier').AsSingle;
        IR_POH_Modifier := FieldByName('IR_POH_Modifier').AsSingle;
        AR_POH_Modifier := FieldByName('AR_POH_Modifier').AsSingle;
        Active_Acoustic_Tor_POH_Mod := FieldByName
          ('Active_Acoustic_Tor_POH_Mod').AsSingle;
        Passive_Acoustic_Tor_POH_Mod := FieldByName
          ('Passive_Acoustic_Tor_POH_Mod').AsSingle;
        Active_Passive_Tor_POH_Mod := FieldByName('Active_Passive_Tor_POH_Mod')
          .AsSingle;
        Wake_Home_POH_Modifier := FieldByName('Wake_Home_POH_Modifier')
          .AsSingle;
        Wire_Guide_POH_Modifier := FieldByName('Wire_Guide_POH_Modifier')
          .AsSingle;
        Mag_Mine_POH_Modifier := FieldByName('Mag_Mine_POH_Modifier').AsSingle;
        Press_Mine_POH_Modifier := FieldByName('Press_Mine_POH_Modifier')
          .AsSingle;
        Impact_Mine_POH_Modifier := FieldByName('Impact_Mine_POH_Modifier')
          .AsSingle;
        Acoustic_Mine_POH_Modifier := FieldByName('Acoustic_Mine_POH_Modifier')
          .AsSingle;
        Engagement_Range := FieldByName('Engagement_Range').AsSingle;
        Damage_Capacity := FieldByName('Damage_Capacity').AsInteger;
        Lethality := FieldByName('Lethality').AsInteger;
        Prob_of_Hit := FieldByName('Prob_of_Hit').AsSingle;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetDIS_Subcategory_Definition(const id: integer;
  var rec: TDIS_Subcategory_Definition): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM DIS_Subcategory_Definition ');

    SQL.Add('WHERE (DIS_Subcategory_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TDIS_Subcategory_Definition.Create;
      with rec.FData do
      begin
        DIS_Subcategory_Index := FieldByName('DIS_Subcategory_Index').AsInteger;
        DIS_Subcategory_Enumeration := FieldByName
          ('DIS_Subcategory_Enumeration').AsInteger;
        DIS_Subcategory_Identifier := FieldByName('DIS_Subcategory_Identifier')
          .AsString;
        DIS_Category_Index := FieldByName('DIS_Category_Index').AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetDefault_Definition(const id: integer;
  var rec: TDefault_Definition): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Default_Definition ');

    SQL.Add('WHERE (Init_AOP = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TDefault_Definition.Create;
      with rec.FData do
      begin
        Init_AOP := FieldByName('Init_AOP').AsInteger;
        AOP_Decrease_Rate := FieldByName('AOP_Decrease_Rate').AsSingle;
        Sono_Num_2_Initiate := FieldByName('Sono_Num_2_Initiate').AsInteger;
        Trans_Range_2_Air := FieldByName('Trans_Range_2_Air').AsSingle;
        Trans_Range_2_Sur := FieldByName('Trans_Range_2_Sur').AsSingle;
        Init_AOP_Modifier := FieldByName('Init_AOP_Modifier').AsSingle;
        Visual_Detect_Range := FieldByName('Visual_Detect_Range').AsSingle;
        Known_Cross_Section := FieldByName('Known_Cross_Section').AsSingle;
        Max_Visual_Range := FieldByName('Max_Visual_Range').AsSingle;
        EO_Detection_Factor := FieldByName('EO_Detection_Factor').AsSingle;
        Visual_Detection_Factor := FieldByName('Visual_Detection_Factor')
          .AsSingle;
        EO_Ident_Factor := FieldByName('EO_Ident_Factor').AsSingle;
        Visual_Ident_Factor := FieldByName('Visual_Ident_Factor').AsSingle;
        Sine_Period_Distance := FieldByName('Sine_Period_Distance').AsSingle;
        Sine_Period_Amplitude := FieldByName('Sine_Period_Amplitude').AsSingle;
        Short_Period_Distance := FieldByName('Short_Period_Distance').AsSingle;
        Short_Period_Amplitude := FieldByName('Short_Period_Amplitude')
          .AsSingle;
        Long_Period_Distance := FieldByName('Long_Period_Distance').AsSingle;
        Long_Period_Amplitude := FieldByName('Long_Period_Amplitude').AsSingle;
        Very_Period_Distance := FieldByName('Very_Period_Distance').AsSingle;
        Very_Period_Amplitude := FieldByName('Very_Period_Amplitude').AsSingle;
        Air_Lost_Time := FieldByName('Air_Lost_Time').AsInteger;
        Sur_Lost_Time := FieldByName('Sur_Lost_Time').AsInteger;
        Sub_Lost_Time := FieldByName('Sub_Lost_Time').AsInteger;
        ESM_Bearing_Lost_Time := FieldByName('ESM_Bearing_Lost_Time').AsInteger;
        Sonar_Bearing_Lost_Time := FieldByName('Sonar_Bearing_Lost_Time')
          .AsInteger;
        Stale_Air_Time := FieldByName('Stale_Air_Time').AsInteger;
        Stale_Sur_Time := FieldByName('Stale_Sur_Time').AsInteger;
        Stale_Sub_Time := FieldByName('Stale_Sub_Time').AsInteger;
        Stale_ESM_Bearing_Time := FieldByName('Stale_ESM_Bearing_Time')
          .AsInteger;
        Stale_Sonar_Bearing_Time := FieldByName('Stale_Sonar_Bearing_Time')
          .AsInteger;
        POD_Check_Time := FieldByName('POD_Check_Time').AsInteger;
        TMA_Range_Rate := FieldByName('TMA_Range_Rate').AsSingle;
        Frequency_Identity_Weighting := FieldByName
          ('Frequency_Identity_Weighting').AsSingle;
        PRF_Identity_Weighting := FieldByName('PRF_Identity_Weighting')
          .AsSingle;
        Pulsewidth_Identity_Weighting := FieldByName
          ('Pulsewidth_Identity_Weighting').AsSingle;
        Scan_Period_Identity_Weighting := FieldByName
          ('Scan_Period_Identity_Weighting').AsSingle;
        Crew_Eff_Heading_Error := FieldByName('Crew_Eff_Heading_Error')
          .AsSingle;
        Crew_Eff_Speed_Error := FieldByName('Crew_Eff_Speed_Error').AsSingle;
        TMA_Relative_Bearing_Rate := FieldByName('TMA_Relative_Bearing_Rate')
          .AsSingle;
        Passive_Sonar_Max_Course_Error := FieldByName
          ('Passive_Sonar_Max_Course_Error').AsSingle;
        Passive_Sonar_Max_Speed_Error := FieldByName
          ('Passive_Sonar_Max_Speed_Error').AsSingle;
        ESM_Error_Corr_Rate := FieldByName('ESM_Error_Corr_Rate').AsSingle;
        Chaff_Altitude_Threshold := FieldByName('Chaff_Altitude_Threshold')
          .AsSingle;
        MHS_Flash_Delay_Time := FieldByName('MHS_Flash_Delay_Time').AsSingle;
        MHS_Immed_Delay_Time := FieldByName('MHS_Immed_Delay_Time').AsSingle;
        MHS_Priority_Delay_Time := FieldByName('MHS_Priority_Delay_Time')
          .AsSingle;
        MHS_Routine_Delay_Time := FieldByName('MHS_Routine_Delay_Time')
          .AsSingle;
        Max_UWT_Range := FieldByName('Max_UWT_Range').AsSingle;
        Max_HF_Detect_Range := FieldByName('Max_HF_Detect_Range').AsSingle;
        Max_UHF_Detect_Range := FieldByName('Max_UHF_Detect_Range').AsSingle;
        Max_IFF_Range := FieldByName('Max_IFF_Range').AsSingle;
        Track_History_Air_Sample_Rate := FieldByName
          ('Track_History_Air_Sample_Rate').AsInteger;
        Track_History_Air_Max_Points := FieldByName
          ('Track_History_Air_Max_Points').AsInteger;
        Track_History_Sample_Rate := FieldByName('Track_History_Sample_Rate')
          .AsInteger;
        Track_History_Max_Points := FieldByName('Track_History_Max_Points')
          .AsInteger;
        Auto_Gun_Interception_Range := FieldByName
          ('Auto_Gun_Interception_Range').AsSingle;
        Auto_Gun_Threshold_Speed := FieldByName('Auto_Gun_Threshold_Speed')
          .AsSingle;
        Clutter_Reduction_Scale := FieldByName('Clutter_Reduction_Scale')
          .AsSingle;
        Jam_Break_Lock_Time_Interval := FieldByName
          ('Jam_Break_Lock_Time_Interval').AsInteger;
        Missile_Reacquisition_Time := FieldByName('Missile_Reacquisition_Time')
          .AsInteger;
        Seduction_Bloom_Altitude := FieldByName('Seduction_Bloom_Altitude')
          .AsInteger;
        Seduction_Bloom_Range := FieldByName('Seduction_Bloom_Range').AsSingle;
        HF_Datalink_MHS_Trans_Freq := FieldByName('HF_Datalink_MHS_Trans_Freq')
          .AsSingle;
        UHF_Datalink_MHS_Trans_Freq := FieldByName
          ('UHF_Datalink_MHS_Trans_Freq').AsSingle;
        Max_Num_Radar_Classes := FieldByName('Max_Num_Radar_Classes').AsInteger;
        Max_Num_Sonar_Classes := FieldByName('Max_Num_Sonar_Classes').AsInteger;
        Max_Num_Sonobuoy_Classes := FieldByName('Max_Num_Sonobuoy_Classes')
          .AsInteger;
        Max_Num_EO_Classes := FieldByName('Max_Num_EO_Classes').AsInteger;
        Max_Num_ESM_Classes := FieldByName('Max_Num_ESM_Classes').AsInteger;
        Max_Num_MAD_Classes := FieldByName('Max_Num_MAD_Classes').AsInteger;
        Max_Num_Fitted_Weap_Classes := FieldByName
          ('Max_Num_Fitted_Weap_Classes').AsInteger;
        Max_Num_Point_Effect_Classes := FieldByName
          ('Max_Num_Point_Effect_Classes').AsInteger;
        HAFO_Min_Range := FieldByName('HAFO_Min_Range').AsSingle;
        HAFO_Max_Range := FieldByName('HAFO_Max_Range').AsSingle;
        Engage_Guide_Stale_Target_Time := FieldByName
          ('Engage_Guide_Stale_Target_Time').AsInteger;
        Outrun_Guide_Stale_Target_Time := FieldByName
          ('Outrun_Guide_Stale_Target_Time').AsInteger;
        Shadow_Guide_Stale_Target_Time := FieldByName
          ('Shadow_Guide_Stale_Target_Time').AsInteger;
        Sonobuoy_Air_Deceleration := FieldByName('Sonobuoy_Air_Deceleration')
          .AsSingle;
        Sonobuoy_Air_Descent_Rate := FieldByName('Sonobuoy_Air_Descent_Rate')
          .AsSingle;
        Depth_Charge_Air_Deceleration := FieldByName
          ('Depth_Charge_Air_Deceleration').AsSingle;
        Depth_Charge_Air_Descent_Rate := FieldByName
          ('Depth_Charge_Air_Descent_Rate').AsSingle;
        Missile_Sea_Check_Interval := FieldByName('Missile_Sea_Check_Interval')
          .AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetDefault_IFF_Mode_Code(const id: integer;
  var rec: TDefault_IFF_Mode_Code): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Default_IFF_Mode_Code ');

    SQL.Add('WHERE (Force_Designation = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TDefault_IFF_Mode_Code.Create;
      with rec.FData do
      begin
        Force_Designation := FieldByName('Force_Designation').AsInteger;
        IFF_Device_Type := FieldByName('IFF_Device_Type').AsInteger;
        IFF_Mode := FieldByName('IFF_Mode').AsInteger;
        IFF_Code := FieldByName('IFF_Code').AsInteger;
        Mode_State := FieldByName('Mode_State').AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetDefensive_Jammer_Definition(const id: integer;
  var rec: TDefensive_Jammer_Definition): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Defensive_Jammer_Definition ');

    SQL.Add('WHERE (Defensive_Jammer_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TDefensive_Jammer_Definition.Create;
      with rec.FData do
      begin
        Defensive_Jammer_Index := FieldByName('Defensive_Jammer_Index')
          .AsInteger;
        Defensive_Jammer_Identifier := FieldByName
          ('Defensive_Jammer_Identifier').AsString;
        Jammer_TARH_Capable := FieldByName('Jammer_TARH_Capable').AsInteger;
        Jammer_SARH_Capable := FieldByName('Jammer_SARH_Capable').AsInteger;
        Type_A_Seducing_Prob := FieldByName('Type_A_Seducing_Prob').AsSingle;
        Type_B_Seducing_Prob := FieldByName('Type_B_Seducing_Prob').AsSingle;
        Type_C_Seducing_Prob := FieldByName('Type_C_Seducing_Prob').AsSingle;
        ECM_Type := FieldByName('ECM_Type').AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

// -------------------------------------------------------------------

////====================================================

  //------------------------------------------------------------------------------
/// /====================================================
function TDMQuery.GetFormation_Definition(const id: integer;
  var rec: TFormation_Definition): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Formation_Definition ');

    SQL.Add('WHERE (Formation_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TFormation_Definition.Create;
      with rec.FData do
      begin
        Formation_Index := FieldByName('Formation_Index').AsInteger;
        Formation_Identifier := FieldByName('Formation_Identifier').AsString;
        Force_Designation := FieldByName('Force_Designation').AsInteger;
        Formation_Leader := FieldByName('Formation_Leader').AsInteger;
        Angle_Type := FieldByName('Angle_Type').AsInteger;
        Deployment_Index := FieldByName('Deployment_Index').AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetLink_Definition(const id: integer; var rec: TLink_Definition)
  : boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Link_Definition ');

    SQL.Add('WHERE (Link_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TLink_Definition.Create;
      with rec.FData do
      begin
        Link_Index := FieldByName('Link_Index').AsInteger;
        Link_Identifier_Num := FieldByName('Link_Identifier_Num').AsInteger;
        Link_Force := FieldByName('Link_Force').AsInteger;
        Link_Controller := FieldByName('Link_Controller').AsInteger;
        Deployment_Index := FieldByName('Deployment_Index').AsInteger;
        Trans_Mode := FieldByName('Trans_Mode').AsInteger;
        Link_Identifier := FieldByName('Link_Identifier').AsString;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetLink_Participant(const id: integer;
  var rec: TLink_Participant): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Link_Participant ');

    SQL.Add('WHERE (Link_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TLink_Participant.Create;
      with rec.FData do
      begin
        Link_Index := FieldByName('Link_Index').AsInteger;
        Participating_Unit := FieldByName('Participating_Unit').AsInteger;
        Deployment_Index := FieldByName('Deployment_Index').AsInteger;
        PU_Octal_Code := FieldByName('PU_Octal_Code').AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================

// -------------------------------------------------------------------

function TDMQuery.GetPattern_Chaff_Event(const id: integer;
  var rec: TPattern_Chaff_Event): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Pattern_Chaff_Event ');

    SQL.Add('WHERE (Scripted_Pattern_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TPattern_Chaff_Event.Create;
      with rec.FData do
      begin
        Scripted_Pattern_Index := FieldByName('Scripted_Pattern_Index')
          .AsInteger;
        Chaff_Instance_Index := FieldByName('Chaff_Instance_Index').AsInteger;
        Chaff_Bloom_Spacing := FieldByName('Chaff_Bloom_Spacing').AsSingle;
        Num_Blooms_2_Release := FieldByName('Num_Blooms_2_Release').AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetScripted_Chaff_Event(const id: integer;
  var rec: TScripted_Chaff_Event): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Scripted_Chaff_Event ');

    SQL.Add('WHERE (Scripted_Event_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TScripted_Chaff_Event.Create;
      with rec.FData do
      begin
        Scripted_Event_Index := FieldByName('Scripted_Event_Index').AsInteger;
        Chaff_Instance_Index := FieldByName('Chaff_Instance_Index').AsInteger;
        Chaff_Bloom_Spacing := FieldByName('Chaff_Bloom_Spacing').AsSingle;
        Num_Blooms_2_Release := FieldByName('Num_Blooms_2_Release').AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetResource_Cond_List_Mapping(const id: integer;
  var rec: TResource_Cond_List_Mapping): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Resource_Cond_List_Mapping ');

    SQL.Add('WHERE (Cond_List_Instance_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TResource_Cond_List_Mapping.Create;
      with rec.FData do
      begin
        Cond_List_Instance_Index := FieldByName('Cond_List_Instance_Index')
          .AsInteger;
        Resource_Alloc_Index := FieldByName('Resource_Alloc_Index').AsInteger;
        Event_List_Index := FieldByName('Event_List_Index').AsInteger;
        Force_Designation := FieldByName('Force_Designation').AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetGeo_Area_Definition(const id: integer;
  var rec: TGeo_Area_Definition): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Geo_Area_Definition ');

    SQL.Add('WHERE (Geo_Area_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TGeo_Area_Definition.Create;
      with rec.FData do
      begin
        Geo_Area_Index := FieldByName('Geo_Area_Index').AsInteger;
        Geo_Area_Identifier := FieldByName('Geo_Area_Identifier').AsString;
        Game_Area_Index := FieldByName('Game_Area_Index').AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------


/// /====================================================
function TDMQuery.GetExternal_Communication_Channel(const id: integer;
  var rec: TExternal_Communication_Channel): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM External_Communication_Channel ');

    SQL.Add('WHERE (Comms_Channel_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TExternal_Communication_Channel.Create;
      with rec.FData do
      begin
        Comms_Channel_Index := FieldByName('Comms_Channel_Index').AsInteger;
        Resource_Alloc_Index := FieldByName('Resource_Alloc_Index').AsInteger;
        Channel_Number := FieldByName('Channel_Number').AsInteger;
        Channel_Identifier := FieldByName('Channel_Identifier').AsString;
        Comms_Band := FieldByName('Comms_Band').AsInteger;
        Channel_Freq := FieldByName('Channel_Freq').AsFloat;
        Channel_Security := FieldByName('Channel_Security').AsInteger;
        Channel_Code := FieldByName('Channel_Code').AsString;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------


/// /====================================================

/// /====================================================
function TDMQuery.GetTowed_Jammer_Decoy_Definition(const id: integer;
  var rec: TTowed_Jammer_Decoy_Definition): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Towed_Jammer_Decoy_Definition ');

    SQL.Add('WHERE (Towed_Decoy_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TTowed_Jammer_Decoy_Definition.Create;
      with rec.FData do
      begin
        Towed_Decoy_Index := FieldByName('Towed_Decoy_Index').AsInteger;
        Towed_Decoy_Identifier := FieldByName('Towed_Decoy_Identifier')
          .AsString;
        Decoy_TARH_Capable := FieldByName('Decoy_TARH_Capable').AsInteger;
        Decoy_SARH_Capable := FieldByName('Decoy_SARH_Capable').AsInteger;
        Platform_Domain := FieldByName('Platform_Domain').AsInteger;
        Platform_Category := FieldByName('Platform_Category').AsInteger;
        Platform_Type := FieldByName('Platform_Type').AsInteger;
        Length := FieldByName('Length').AsSingle;
        Width := FieldByName('Width').AsSingle;
        Height := FieldByName('Height').AsSingle;
        Front_Radar_Cross := FieldByName('Front_Radar_Cross').AsSingle;
        Side_Radar_Cross := FieldByName('Side_Radar_Cross').AsSingle;
        Front_Visual_Cross := FieldByName('Front_Visual_Cross').AsSingle;
        Side_Visual_Cross := FieldByName('Side_Visual_Cross').AsSingle;
        Front_Acoustic_Cross := FieldByName('Front_Acoustic_Cross').AsSingle;
        Side_Acoustic_Cross := FieldByName('Side_Acoustic_Cross').AsSingle;
        Type_A_Seducing_Prob := FieldByName('Type_A_Seducing_Prob').AsSingle;
        Type_B_Seducing_Prob := FieldByName('Type_B_Seducing_Prob').AsSingle;
        Type_C_Seducing_Prob := FieldByName('Type_C_Seducing_Prob').AsSingle;
        Activation_Control_Delay := FieldByName('Activation_Control_Delay')
          .AsSingle;
        Tow_Length := FieldByName('Tow_Length').AsSingle;
        ECM_Type := FieldByName('ECM_Type').AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetESM_Definition(const id: integer; var rec: TESM_Definition)
  : boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM ESM_Definition ');

    SQL.Add('WHERE (ESM_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TESM_Definition.Create;
      with rec.FData do
      begin
        ESM_Index := FieldByName('ESM_Index').AsInteger;
        Class_Identifier := FieldByName('Class_Identifier').AsString;
        Low_Detect_Frequency1 := FieldByName('Low_Detect_Frequency1').AsFloat;
        High_Detect_Frequency1 := FieldByName('High_Detect_Frequency1').AsFloat;
        Low_Detect_Frequency2 := FieldByName('Low_Detect_Frequency2').AsFloat;
        High_Detect_Frequency2 := FieldByName('High_Detect_Frequency2').AsFloat;
        ESM_Classification := FieldByName('ESM_Classification').AsInteger;
        Emitter_Detect_Range_Factor := FieldByName
          ('Emitter_Detect_Range_Factor').AsSingle;
        Comm_Intercept_Capable := FieldByName('Comm_Intercept_Capable')
          .AsInteger;
        Frequency_Identify_Range := FieldByName('Frequency_Identify_Range')
          .AsFloat;
        PRF_Identify_Range := FieldByName('PRF_Identify_Range').AsSingle;
        Pulsewidth_Identify_Range := FieldByName('Pulsewidth_Identify_Range')
          .AsSingle;
        Scan_Period_Identify_Range := FieldByName('Scan_Period_Identify_Range')
          .AsSingle;
        Sector_Blank_Detection_Factor := FieldByName
          ('Sector_Blank_Detection_Factor').AsSingle;
        Identification_Period := FieldByName('Identification_Period').AsSingle;
        Classification_Period := FieldByName('Classification_Period').AsSingle;
        Minimum_Bearing_Error_Variance := FieldByName
          ('Minimum_Bearing_Error_Variance').AsSingle;
        Initial_Bearing_Error_Variance := FieldByName
          ('Initial_Bearing_Error_Variance').AsSingle;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetFCR_Definition(const id: integer; var rec: TFCR_Definition)
  : boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM FCR_Definition ');

    SQL.Add('WHERE (FCR_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TFCR_Definition.Create;
      with rec.FData do
      begin
        FCR_Index := FieldByName('FCR_Index').AsInteger;
        Radar_Identifier := FieldByName('Radar_Identifier').AsString;
        Radar_Emitter := FieldByName('Radar_Emitter').AsString;
        Frequency := FieldByName('Frequency').AsSingle;
        Scan_Rate := FieldByName('Scan_Rate').AsSingle;
        Radar_Power := FieldByName('Radar_Power').AsSingle;
        Pulse_Rep_Freq := FieldByName('Pulse_Rep_Freq').AsSingle;
        Pulse_Width := FieldByName('Pulse_Width').AsSingle;
        Max_Unambig_Detection_Range := FieldByName
          ('Max_Unambig_Detection_Range').AsSingle;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetFitted_Weap_Launcher_On_Board(const id: integer;
  var rec: TFitted_Weap_Launcher_On_Board): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Fitted_Weap_Launcher_On_Board ');

    SQL.Add('WHERE (Fitted_Weap_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TFitted_Weap_Launcher_On_Board.Create;
      with rec.FData do
      begin
        Fitted_Weap_Index := FieldByName('Fitted_Weap_Index').AsInteger;
        Launcher_Type := FieldByName('Launcher_Type').AsInteger;
        Launcher_Angle_Required := FieldByName('Launcher_Angle_Required')
          .AsInteger;
        Launcher_Angle := FieldByName('Launcher_Angle').AsInteger;
        Launcher_Max_Qty := FieldByName('Launcher_Max_Qty').AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetFloating_Decoy_Definition(const id: integer;
  var rec: TFloating_Decoy_Definition): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Floating_Decoy_Definition ');

    SQL.Add('WHERE (Floating_Decoy_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TFloating_Decoy_Definition.Create;
      with rec.FData do
      begin
        Floating_Decoy_Index := FieldByName('Floating_Decoy_Index').AsInteger;
        Floating_Decoy_Identifier := FieldByName('Floating_Decoy_Identifier')
          .AsString;
        Platform_Domain := FieldByName('Platform_Domain').AsInteger;
        Platform_Category := FieldByName('Platform_Category').AsInteger;
        Platform_Type := FieldByName('Platform_Type').AsInteger;
        Length := FieldByName('Length').AsSingle;
        Width := FieldByName('Width').AsSingle;
        Height := FieldByName('Height').AsSingle;
        Front_Radar_Cross := FieldByName('Front_Radar_Cross').AsSingle;
        Side_Radar_Cross := FieldByName('Side_Radar_Cross').AsSingle;
        Front_Visual_Cross := FieldByName('Front_Visual_Cross').AsSingle;
        Side_Visual_Cross := FieldByName('Side_Visual_Cross').AsSingle;
        Front_Acoustic_Cross := FieldByName('Front_Acoustic_Cross').AsSingle;
        Side_Acoustic_Cross := FieldByName('Side_Acoustic_Cross').AsSingle;
        Lifetime_Duration := FieldByName('Lifetime_Duration').AsSingle;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================

/// /====================================================
function TDMQuery.GetFormation_Assignment(const id: integer;
  var rec: TFormation_Assignment): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Formation_Assignment ');

    SQL.Add('WHERE (Platform_Instance_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TFormation_Assignment.Create;
      with rec.FData do
      begin
        Platform_Instance_Index := FieldByName('Platform_Instance_Index')
          .AsInteger;
        Formation_Index := FieldByName('Formation_Index').AsInteger;
        Angle_Offset := FieldByName('Angle_Offset').AsSingle;
        Range_from_Leader := FieldByName('Range_from_Leader').AsSingle;
        Altitude := FieldByName('Altitude').AsSingle;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------


/// /====================================================
function TDMQuery.GetGame_Area_Definition(const id: integer;
  var rec: TGame_Area_Definition): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Area_Definition ');

    SQL.Add('WHERE (Game_Area_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TGame_Area_Definition.Create;
      with rec.FData do
      begin
        Game_Area_Index := FieldByName('Game_Area_Index').AsInteger;
        Game_Area_Identifier := FieldByName('Game_Area_Identifier').AsString;
        Game_Centre_Lat := FieldByName('Game_Centre_Lat').AsFloat;
        Game_Centre_Long := FieldByName('Game_Centre_Long').AsFloat;
        Game_X_Dimension := FieldByName('Game_X_Dimension').AsSingle;
        Game_Y_Dimension := FieldByName('Game_Y_Dimension').AsSingle;
        Use_Real_World := FieldByName('Use_Real_World').AsInteger;
        Use_Artificial_Landmass := FieldByName('Use_Artificial_Landmass')
        .AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetGame_Cloud_On_ESM(const id: integer;
  var rec: TGame_Cloud_On_ESM): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Cloud_On_ESM ');

    SQL.Add('WHERE (Defaults_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TGame_Cloud_On_ESM.Create;
      with rec.FData do
      begin
        Defaults_Index := FieldByName('Defaults_Index').AsInteger;
        Radar_Frequency := FieldByName('Radar_Frequency').AsSingle;
        Cloud_0_Effect := FieldByName('Cloud_0_Effect').AsSingle;
        Cloud_1_Effect := FieldByName('Cloud_1_Effect').AsSingle;
        Cloud_2_Effect := FieldByName('Cloud_2_Effect').AsSingle;
        Cloud_3_Effect := FieldByName('Cloud_3_Effect').AsSingle;
        Cloud_4_Effect := FieldByName('Cloud_4_Effect').AsSingle;
        Cloud_5_Effect := FieldByName('Cloud_5_Effect').AsSingle;
        Cloud_6_Effect := FieldByName('Cloud_6_Effect').AsSingle;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================

/// /====================================================
function TDMQuery.GetGame_Default_IFF_Mode_Code(const id: integer;
  var rec: TGame_Default_IFF_Mode_Code): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Default_IFF_Mode_Code ');

    SQL.Add('WHERE (Defaults_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TGame_Default_IFF_Mode_Code.Create;
      with rec.FData do
      begin
        Defaults_Index := FieldByName('Defaults_Index').AsInteger;
        Force_Designation := FieldByName('Force_Designation').AsInteger;
        IFF_Device_Type := FieldByName('IFF_Device_Type').AsInteger;
        IFF_Mode := FieldByName('IFF_Mode').AsInteger;
        IFF_Code := FieldByName('IFF_Code').AsInteger;
        Mode_State := FieldByName('Mode_State').AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetGame_Defaults(const id: integer; var rec: TGame_Defaults)
  : boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Defaults ');

    SQL.Add('WHERE (Defaults_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TGame_Defaults.Create;
      with rec.FData do
      begin
        Defaults_Index := FieldByName('Defaults_Index').AsInteger;
        Defaults_Identifier := FieldByName('Defaults_Identifier').AsString;
        Init_AOP := FieldByName('Init_AOP').AsInteger;
        AOP_Decrease_Rate := FieldByName('AOP_Decrease_Rate').AsSingle;
        Sono_Num_2_Initiate := FieldByName('Sono_Num_2_Initiate').AsInteger;
        Trans_Range_2_Air := FieldByName('Trans_Range_2_Air').AsSingle;
        Trans_Range_2_Sur := FieldByName('Trans_Range_2_Sur').AsSingle;
        Init_AOP_Modifier := FieldByName('Init_AOP_Modifier').AsSingle;
        Visual_Detect_Range := FieldByName('Visual_Detect_Range').AsSingle;
        Known_Cross_Section := FieldByName('Known_Cross_Section').AsSingle;
        Max_Visual_Range := FieldByName('Max_Visual_Range').AsSingle;
        EO_Detection_Factor := FieldByName('EO_Detection_Factor').AsSingle;
        Visual_Detection_Factor := FieldByName('Visual_Detection_Factor')
          .AsSingle;
        EO_Ident_Factor := FieldByName('EO_Ident_Factor').AsSingle;
        Visual_Ident_Factor := FieldByName('Visual_Ident_Factor').AsSingle;
        Sine_Period_Distance := FieldByName('Sine_Period_Distance').AsSingle;
        Sine_Period_Amplitude := FieldByName('Sine_Period_Amplitude').AsSingle;
        Short_Period_Distance := FieldByName('Short_Period_Distance').AsSingle;
        Short_Period_Amplitude := FieldByName('Short_Period_Amplitude')
          .AsSingle;
        Long_Period_Distance := FieldByName('Long_Period_Distance').AsSingle;
        Long_Period_Amplitude := FieldByName('Long_Period_Amplitude').AsSingle;
        Very_Period_Distance := FieldByName('Very_Period_Distance').AsSingle;
        Very_Period_Amplitude := FieldByName('Very_Period_Amplitude').AsSingle;
        Air_Lost_Time := FieldByName('Air_Lost_Time').AsInteger;
        Sur_Lost_Time := FieldByName('Sur_Lost_Time').AsInteger;
        Sub_Lost_Time := FieldByName('Sub_Lost_Time').AsInteger;
        ESM_Bearing_Lost_Time := FieldByName('ESM_Bearing_Lost_Time').AsInteger;
        Sonar_Bearing_Lost_Time := FieldByName('Sonar_Bearing_Lost_Time')
          .AsInteger;
        Stale_Air_Time := FieldByName('Stale_Air_Time').AsInteger;
        Stale_Sur_Time := FieldByName('Stale_Sur_Time').AsInteger;
        Stale_Sub_Time := FieldByName('Stale_Sub_Time').AsInteger;
        Stale_ESM_Bearing_Time := FieldByName('Stale_ESM_Bearing_Time')
          .AsInteger;
        Stale_Sonar_Bearing_Time := FieldByName('Stale_Sonar_Bearing_Time')
          .AsInteger;
        POD_Check_Time := FieldByName('POD_Check_Time').AsInteger;
        TMA_Range_Rate := FieldByName('TMA_Range_Rate').AsSingle;
        Frequency_Identity_Weighting := FieldByName
          ('Frequency_Identity_Weighting').AsSingle;
        PRF_Identity_Weighting := FieldByName('PRF_Identity_Weighting')
          .AsSingle;
        Pulsewidth_Identity_Weighting := FieldByName
          ('Pulsewidth_Identity_Weighting').AsSingle;
        Scan_Period_Identity_Weighting := FieldByName
          ('Scan_Period_Identity_Weighting').AsSingle;
        Crew_Eff_Heading_Error := FieldByName('Crew_Eff_Heading_Error')
          .AsSingle;
        Crew_Eff_Speed_Error := FieldByName('Crew_Eff_Speed_Error').AsSingle;
        TMA_Relative_Bearing_Rate := FieldByName('TMA_Relative_Bearing_Rate')
          .AsSingle;
        Passive_Sonar_Max_Course_Error := FieldByName
          ('Passive_Sonar_Max_Course_Error').AsSingle;
        Passive_Sonar_Max_Speed_Error := FieldByName
          ('Passive_Sonar_Max_Speed_Error').AsSingle;
        ESM_Error_Corr_Rate := FieldByName('ESM_Error_Corr_Rate').AsSingle;
        Chaff_Altitude_Threshold := FieldByName('Chaff_Altitude_Threshold')
          .AsSingle;
        MHS_Flash_Delay_Time := FieldByName('MHS_Flash_Delay_Time').AsSingle;
        MHS_Immed_Delay_Time := FieldByName('MHS_Immed_Delay_Time').AsSingle;
        MHS_Priority_Delay_Time := FieldByName('MHS_Priority_Delay_Time')
          .AsSingle;
        MHS_Routine_Delay_Time := FieldByName('MHS_Routine_Delay_Time')
          .AsSingle;
        Max_UWT_Range := FieldByName('Max_UWT_Range').AsSingle;
        Max_HF_Detect_Range := FieldByName('Max_HF_Detect_Range').AsSingle;
        Max_UHF_Detect_Range := FieldByName('Max_UHF_Detect_Range').AsSingle;
        Max_IFF_Range := FieldByName('Max_IFF_Range').AsSingle;
        Track_History_Air_Sample_Rate := FieldByName
          ('Track_History_Air_Sample_Rate').AsInteger;
        Track_History_Air_Max_Points := FieldByName
          ('Track_History_Air_Max_Points').AsInteger;
        Track_History_Sample_Rate := FieldByName('Track_History_Sample_Rate')
          .AsInteger;
        Track_History_Max_Points := FieldByName('Track_History_Max_Points')
          .AsInteger;
        Auto_Gun_Interception_Range := FieldByName
          ('Auto_Gun_Interception_Range').AsSingle;
        Auto_Gun_Threshold_Speed := FieldByName('Auto_Gun_Threshold_Speed')
          .AsSingle;
        Clutter_Reduction_Scale := FieldByName('Clutter_Reduction_Scale')
          .AsSingle;
        Jam_Break_Lock_Time_Interval := FieldByName
          ('Jam_Break_Lock_Time_Interval').AsInteger;
        Missile_Reacquisition_Time := FieldByName('Missile_Reacquisition_Time')
          .AsInteger;
        Seduction_Bloom_Altitude := FieldByName('Seduction_Bloom_Altitude')
          .AsInteger;
        Seduction_Bloom_Range := FieldByName('Seduction_Bloom_Range').AsSingle;
        HF_Datalink_MHS_Trans_Freq := FieldByName('HF_Datalink_MHS_Trans_Freq')
          .AsSingle;
        UHF_Datalink_MHS_Trans_Freq := FieldByName
          ('UHF_Datalink_MHS_Trans_Freq').AsSingle;
        Max_Num_Radar_Classes := FieldByName('Max_Num_Radar_Classes').AsInteger;
        Max_Num_Sonar_Classes := FieldByName('Max_Num_Sonar_Classes').AsInteger;
        Max_Num_Sonobuoy_Classes := FieldByName('Max_Num_Sonobuoy_Classes')
          .AsInteger;
        Max_Num_EO_Classes := FieldByName('Max_Num_EO_Classes').AsInteger;
        Max_Num_ESM_Classes := FieldByName('Max_Num_ESM_Classes').AsInteger;
        Max_Num_MAD_Classes := FieldByName('Max_Num_MAD_Classes').AsInteger;
        Max_Num_Fitted_Weap_Classes := FieldByName
          ('Max_Num_Fitted_Weap_Classes').AsInteger;
        Max_Num_Point_Effect_Classes := FieldByName
          ('Max_Num_Point_Effect_Classes').AsInteger;
        HAFO_Min_Range := FieldByName('HAFO_Min_Range').AsSingle;
        HAFO_Max_Range := FieldByName('HAFO_Max_Range').AsSingle;
        Engage_Guide_Stale_Target_Time := FieldByName
          ('Engage_Guide_Stale_Target_Time').AsInteger;
        Outrun_Guide_Stale_Target_Time := FieldByName
          ('Outrun_Guide_Stale_Target_Time').AsInteger;
        Shadow_Guide_Stale_Target_Time := FieldByName
          ('Shadow_Guide_Stale_Target_Time').AsInteger;
        Sonobuoy_Air_Deceleration := FieldByName('Sonobuoy_Air_Deceleration')
          .AsSingle;
        Sonobuoy_Air_Descent_Rate := FieldByName('Sonobuoy_Air_Descent_Rate')
          .AsSingle;
        Depth_Charge_Air_Deceleration := FieldByName
          ('Depth_Charge_Air_Deceleration').AsSingle;
        Depth_Charge_Air_Descent_Rate := FieldByName
          ('Depth_Charge_Air_Descent_Rate').AsSingle;
        Missile_Sea_Check_Interval := FieldByName('Missile_Sea_Check_Interval')
          .AsInteger;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetGame_Rainfall_On_ESM(const id: integer;
  var rec: TGame_Rainfall_On_ESM): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Rainfall_On_ESM ');

    SQL.Add('WHERE (Defaults_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TGame_Rainfall_On_ESM.Create;
      with rec.FData do
      begin
        Defaults_Index := FieldByName('Defaults_Index').AsInteger;
        Radar_Frequency := FieldByName('Radar_Frequency').AsSingle;
        Rain_0_Effect := FieldByName('Rain_0_Effect').AsSingle;
        Rain_1_Effect := FieldByName('Rain_1_Effect').AsSingle;
        Rain_2_Effect := FieldByName('Rain_2_Effect').AsSingle;
        Rain_3_Effect := FieldByName('Rain_3_Effect').AsSingle;
        Rain_4_Effect := FieldByName('Rain_4_Effect').AsSingle;
        Rain_5_Effect := FieldByName('Rain_5_Effect').AsSingle;
        Rain_6_Effect := FieldByName('Rain_6_Effect').AsSingle;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetGame_Rainfall_On_Missile_Seeker(const id: integer;
  var rec: TGame_Rainfall_On_Missile_Seeker): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Rainfall_On_Missile_Seeker ');

    SQL.Add('WHERE (Defaults_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TGame_Rainfall_On_Missile_Seeker.Create;
      with rec.FData do
      begin
        Defaults_Index := FieldByName('Defaults_Index').AsInteger;
        Guide_Type := FieldByName('Guide_Type').AsInteger;
        Rain_0_Effect := FieldByName('Rain_0_Effect').AsSingle;
        Rain_1_Effect := FieldByName('Rain_1_Effect').AsSingle;
        Rain_2_Effect := FieldByName('Rain_2_Effect').AsSingle;
        Rain_3_Effect := FieldByName('Rain_3_Effect').AsSingle;
        Rain_4_Effect := FieldByName('Rain_4_Effect').AsSingle;
        Rain_5_Effect := FieldByName('Rain_5_Effect').AsSingle;
        Rain_6_Effect := FieldByName('Rain_6_Effect').AsSingle;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetGame_Rainfall_On_Radar(const id: integer;
  var rec: TGame_Rainfall_On_Radar): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Rainfall_On_Radar ');

    SQL.Add('WHERE (Defaults_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TGame_Rainfall_On_Radar.Create;
      with rec.FData do
      begin
        Defaults_Index := FieldByName('Defaults_Index').AsInteger;
        Radar_Frequency := FieldByName('Radar_Frequency').AsSingle;
        Rain_0_Effect := FieldByName('Rain_0_Effect').AsSingle;
        Rain_1_Effect := FieldByName('Rain_1_Effect').AsSingle;
        Rain_2_Effect := FieldByName('Rain_2_Effect').AsSingle;
        Rain_3_Effect := FieldByName('Rain_3_Effect').AsSingle;
        Rain_4_Effect := FieldByName('Rain_4_Effect').AsSingle;
        Rain_5_Effect := FieldByName('Rain_5_Effect').AsSingle;
        Rain_6_Effect := FieldByName('Rain_6_Effect').AsSingle;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

/// /====================================================
function TDMQuery.GetGame_Rainfall_On_Sonar(const id: integer;
  var rec: TGame_Rainfall_On_Sonar): boolean;
begin
  result := false;
  if not ZConn.Connected then
    exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM Game_Rainfall_On_Sonar ');

    SQL.Add('WHERE (Defaults_Index = ' + IntToStr(id) + ')');
    Open;

    result := RecordCount > 0;
    if not IsEmpty then
    begin
      First;
      if not Assigned(rec) then
        rec := TGame_Rainfall_On_Sonar.Create;
      with rec.FData do
      begin
        Defaults_Index := FieldByName('Defaults_Index').AsInteger;
        Sonar_Frequency := FieldByName('Sonar_Frequency').AsSingle;
        Rain_0_Effect := FieldByName('Rain_0_Effect').AsSingle;
        Rain_1_Effect := FieldByName('Rain_1_Effect').AsSingle;
        Rain_2_Effect := FieldByName('Rain_2_Effect').AsSingle;
        Rain_3_Effect := FieldByName('Rain_3_Effect').AsSingle;
        Rain_4_Effect := FieldByName('Rain_4_Effect').AsSingle;
        Rain_5_Effect := FieldByName('Rain_5_Effect').AsSingle;
        Rain_6_Effect := FieldByName('Rain_6_Effect').AsSingle;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------

////====================================================
  function TDMQuery.GetGame_Sea_On_Missile_Safe_Altitude(const id: integer;
    var rec: TGame_Sea_On_Missile_Safe_Altitude): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Game_Sea_On_Missile_Safe_Altitude ' );

      SQL.Add('WHERE (Defaults_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TGame_Sea_On_Missile_Safe_Altitude.Create;
        with rec.FData do begin
          Defaults_Index                    := FieldByName('Defaults_Index').AsInteger;
          Sea_State                         := FieldByName('Sea_State').AsInteger;
          Effect_on_Missile_Safe_Altitude   := FieldByName('Effect_on_Missile_Safe_Altitud').AsSingle;
          //Effect_on_Missile_Safe_Altitude   := FieldByName('Effect_on_Missile_Safe_Altitude').AsSingle;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetGame_Sea_On_Radar(const id: integer;
    var rec: TGame_Sea_On_Radar): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Game_Sea_On_Radar ' );

      SQL.Add('WHERE (Defaults_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TGame_Sea_On_Radar.Create;
        with rec.FData do begin
          Defaults_Index    := FieldByName('Defaults_Index').AsInteger;
          Sea_State         := FieldByName('Sea_State').AsInteger;
          Effect_on_Radar   := FieldByName('Effect_on_Radar').AsSingle;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetGame_Sea_On_Sonar(const id: integer;
    var rec: TGame_Sea_On_Sonar): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Game_Sea_On_Sonar ' );

      SQL.Add('WHERE (Defaults_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TGame_Sea_On_Sonar.Create;
        with rec.FData do begin
          Defaults_Index    := FieldByName('Defaults_Index').AsInteger;
          Sonar_Frequency   := FieldByName('Sonar_Frequency').AsSingle;
          Sea_0_Effect      := FieldByName('Sea_0_Effect').AsSingle;
          Sea_1_Effect      := FieldByName('Sea_1_Effect').AsSingle;
          Sea_2_Effect      := FieldByName('Sea_2_Effect').AsSingle;
          Sea_3_Effect      := FieldByName('Sea_3_Effect').AsSingle;
          Sea_4_Effect      := FieldByName('Sea_4_Effect').AsSingle;
          Sea_5_Effect      := FieldByName('Sea_5_Effect').AsSingle;
          Sea_6_Effect      := FieldByName('Sea_6_Effect').AsSingle;
          Sea_7_Effect      := FieldByName('Sea_7_Effect').AsSingle;
          Sea_8_Effect      := FieldByName('Sea_8_Effect').AsSingle;
          Sea_9_Effect      := FieldByName('Sea_9_Effect').AsSingle;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetGame_Ship_On_Sonar(const id: integer;
    var rec: TGame_Ship_On_Sonar): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Game_Ship_On_Sonar ' );

      SQL.Add('WHERE (Defaults_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TGame_Ship_On_Sonar.Create;
        with rec.FData do begin
          Defaults_Index        := FieldByName('Defaults_Index').AsInteger;
          Sonar_Frequency       := FieldByName('Sonar_Frequency').AsSingle;
          Distant_Ship_Effect   := FieldByName('Distant_Ship_Effect').AsSingle;
          Light_Ship_Effect     := FieldByName('Light_Ship_Effect').AsSingle;
          Medium_Ship_Effect    := FieldByName('Medium_Ship_Effect').AsSingle;
          Heavy_Ship_Effect     := FieldByName('Heavy_Ship_Effect').AsSingle;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetGeo_Area_Point(const id: integer;
    var rec: TGeo_Area_Point): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Geo_Area_Point ' );

      SQL.Add('WHERE (Geo_Area_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TGeo_Area_Point.Create;
        with rec.FData do begin
          Geo_Area_Index    := FieldByName('Geo_Area_Index').AsInteger;
          Point_Number      := FieldByName('Point_Number').AsInteger;
          Latitude          := FieldByName('Latitude').AsFloat;
          Longitude         := FieldByName('Longitude').AsFloat;
          X_Position        := FieldByName('X_Position').AsSingle;
          Y_Position        := FieldByName('Y_Position').AsSingle;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetGlobal_Convergence_Zone(const id: integer;
    var rec: TGlobal_Convergence_Zone): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Global_Convergence_Zone ' );

      SQL.Add('WHERE (Converge_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TGlobal_Convergence_Zone.Create;
        with rec.FData do begin
          Converge_Index          := FieldByName('Converge_Index').AsInteger;
          Game_Enviro_Index       := FieldByName('Game_Enviro_Index').AsInteger;
          Occurance_Range         := FieldByName('Occurance_Range').AsSingle;
          Width                   := FieldByName('Width').AsSingle;
          Signal_Reduction_Term   := FieldByName('Signal_Reduction_Term').AsSingle;
          Increase_per_CZ         := FieldByName('Increase_per_CZ').AsSingle;
          Max_Sonar_Depth         := FieldByName('Max_Sonar_Depth').AsSingle;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetInfrared_Decoy_Definition(const id: integer;
    var rec: TInfrared_Decoy_Definition): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Infrared_Decoy_Definition ' );

      SQL.Add('WHERE (Infrared_Decoy_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TInfrared_Decoy_Definition.Create;
        with rec.FData do begin
          Infrared_Decoy_Index        := FieldByName('Infrared_Decoy_Index').AsInteger;
          Infrared_Decoy_Identifier   := FieldByName('Infrared_Decoy_Identifier').AsString;
          Platform_Domain             := FieldByName('Platform_Domain').AsInteger;
          Platform_Category           := FieldByName('Platform_Category').AsInteger;
          Platform_Type               := FieldByName('Platform_Type').AsInteger;
          Max_Infrared_Cross          := FieldByName('Max_Infrared_Cross').AsSingle;
          Bloom_Time                  := FieldByName('Bloom_Time').AsInteger;
          Sustain_Time                := FieldByName('Sustain_Time').AsInteger;
          Max_Dissipation_Time        := FieldByName('Max_Dissipation_Time').AsInteger;
          Min_Dissipation_Time        := FieldByName('Min_Dissipation_Time').AsInteger;
          Descent_Rate                := FieldByName('Descent_Rate').AsSingle;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetJammer_Definition(const id: integer;
    var rec: TJammer_Definition): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Jammer_Definition ' );

      SQL.Add('WHERE (Jammer_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TJammer_Definition.Create;
        with rec.FData do begin
          Jammer_Index                := FieldByName('Jammer_Index').AsInteger;
          Jammer_Type                 := FieldByName('Jammer_Type').AsInteger;
          Jammer_Identifier           := FieldByName('Jammer_Identifier').AsString;
          Lower_Freq_Limit            := FieldByName('Lower_Freq_Limit').AsFloat;
          Upper_Freq_Limit            := FieldByName('Upper_Freq_Limit').AsFloat;
          Jammer_Power_Density        := FieldByName('Jammer_Power_Density').AsFloat;
          Max_Effective_Range         := FieldByName('Max_Effective_Range').AsSingle;
          Max_Sector_Width            := FieldByName('Max_Sector_Width').AsSingle;
          Upper_Vert_Coverage_Angle   := FieldByName('Upper_Vert_Coverage_Angle').AsSingle;
          Lower_Vert_Coverage_Angle   := FieldByName('Lower_Vert_Coverage_Angle').AsSingle;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetMAD_Definition(const id: integer;
    var rec: TMAD_Definition): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM MAD_Definition ' );

      SQL.Add('WHERE (MAD_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TMAD_Definition.Create;
        with rec.FData do begin
          MAD_Index               := FieldByName('MAD_Index').AsInteger;
          Class_Identifier        := FieldByName('Class_Identifier').AsString;
          Baseline_Detect_Range   := FieldByName('Baseline_Detect_Range').AsSingle;
          Known_Cross_Section     := FieldByName('Known_Cross_Section').AsSingle;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetMine_POD_vs_Range(const id: integer;
    var rec: TMine_POD_vs_Range): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Mine_POD_vs_Range ' );

      SQL.Add('WHERE (List_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TMine_POD_vs_Range.Create;
        with rec.FData do begin
          List_Index            := FieldByName('List_Index').AsInteger;
          Mine_Index            := FieldByName('Mine_Index').AsInteger;
          Prob_of_Detonation    := FieldByName('Prob_of_Detonation').AsSingle;
          Range                 := FieldByName('Range').AsSingle;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetOverlay_Definition(const id: integer;
    var rec: TOverlay_Definition): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Overlay_Definition ' );

      SQL.Add('WHERE (Overlay_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TOverlay_Definition.Create;
        with rec.FData do begin
          Overlay_Index         := FieldByName('Overlay_Index').AsInteger;
          Overlay_Identifier    := FieldByName('Overlay_Identifier').AsString;
          Overlay_Filename      := FieldByName('Overlay_Filename').AsString;
          Static_Overlay        := FieldByName('Static_Overlay').AsInteger;
          Game_Area_Index       := FieldByName('Game_Area_Index').AsInteger;
          Domain                := FieldByName('Domain').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------


////====================================================
  function TDMQuery.GetPattern_IFF_Event(const id: integer;
    var rec: TPattern_IFF_Event): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Pattern_IFF_Event ' );

      SQL.Add('WHERE (Scripted_Pattern_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TPattern_IFF_Event.Create;
        with rec.FData do begin
          Scripted_Pattern_Index      := FieldByName('Scripted_Pattern_Index').AsInteger;
          IFF_Instance_Index          := FieldByName('IFF_Instance_Index').AsInteger;
          IFF_Interrogator_Control    := FieldByName('IFF_Interrogator_Control').AsInteger;
          IFF_Transponder_Control     := FieldByName('IFF_Transponder_Control').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetPattern_Infrared_Decoy_Event(const id: integer;
    var rec: TPattern_Infrared_Decoy_Event): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Pattern_Infrared_Decoy_Event ' );

      SQL.Add('WHERE (Scripted_Pattern_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TPattern_Infrared_Decoy_Event.Create;
        with rec.FData do begin
          Scripted_Pattern_Index          := FieldByName('Scripted_Pattern_Index').AsInteger;
          Infrared_Decoy_Instance_Index   := FieldByName('Infrared_Decoy_Instance_Index').AsInteger;
          Infrared_Decoy_Bloom_Spacing    := FieldByName('Infrared_Decoy_Bloom_Spacing').AsSingle;
          Num_Blooms_2_Release            := FieldByName('Num_Blooms_2_Release').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetPattern_Point(const id: integer;
    var rec: TPattern_Point): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Pattern_Point ' );

      SQL.Add('WHERE (Pattern_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TPattern_Point.Create;
        with rec.FData do begin
          Pattern_Index   := FieldByName('Pattern_Index').AsInteger;
          Point_Number    := FieldByName('Point_Number').AsInteger;
          Heading         := FieldByName('Heading').AsSingle;
          Range           := FieldByName('Range').AsSingle;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetPattern_Radar_Event(const id: integer;
    var rec: TPattern_Radar_Event): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Pattern_Radar_Event ' );

      SQL.Add('WHERE (Scripted_Pattern_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TPattern_Radar_Event.Create;
        with rec.FData do begin
          Scripted_Pattern_Index    := FieldByName('Scripted_Pattern_Index').AsInteger;
          Radar_Index               := FieldByName('Radar_Index').AsInteger;
          Radar_Control             := FieldByName('Radar_Control').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetPattern_Sonar_Event(const id: integer;
    var rec: TPattern_Sonar_Event): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Pattern_Sonar_Event ' );

      SQL.Add('WHERE (Scripted_Pattern_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TPattern_Sonar_Event.Create;
        with rec.FData do begin
          Scripted_Pattern_Index    := FieldByName('Scripted_Pattern_Index').AsInteger;
          Sonar_Index               := FieldByName('Sonar_Index').AsInteger;
          Sonar_Control             := FieldByName('Sonar_Control').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetPattern_Weapon_Event(const id: integer;
    var rec: TPattern_Weapon_Event): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Pattern_Weapon_Event ' );

      SQL.Add('WHERE (List_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TPattern_Weapon_Event.Create;
        with rec.FData do begin
          List_Index                := FieldByName('List_Index').AsInteger;
          Scripted_Pattern_Index    := FieldByName('Scripted_Pattern_Index').AsInteger;
          Salvo_Size                := FieldByName('Salvo_Size').AsInteger;
          Number_Layed              := FieldByName('Number_Layed').AsInteger;
          Distance_Between          := FieldByName('Distance_Between').AsSingle;
          Mine_Depth                := FieldByName('Mine_Depth').AsSingle;
          Weapon_Type               := FieldByName('Weapon_Type').AsInteger;
          Point_Effect              := FieldByName('Point_Effect').AsInteger;
          Weapons_Mount             := FieldByName('Weapons_Mount').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------


////====================================================
  function TDMQuery.GetPlatform_IFF_Activation(const id: integer;
    var rec: TPlatform_IFF_Activation): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Platform_IFF_Activation ' );

      SQL.Add('WHERE (IFF_Activation_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TPlatform_IFF_Activation.Create;
        with rec.FData do begin
          IFF_Activation_Index        := FieldByName('IFF_Activation_Index').AsInteger;
          IFF_Interrogator_Control    := FieldByName('IFF_Interrogator_Control').AsInteger;
          IFF_Transponder_Control     := FieldByName('IFF_Transponder_Control').AsInteger;
          Platform_Event_Index        := FieldByName('Platform_Event_Index').AsInteger;
          IFF_Instance_Index          := FieldByName('IFF_Instance_Index').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetPlatform_IFF_Mode_Code(const id: integer;
    var rec: TPlatform_IFF_Mode_Code): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Platform_IFF_Mode_Code ' );

      SQL.Add('WHERE (IFF_Activation_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TPlatform_IFF_Mode_Code.Create;
        with rec.FData do begin
          IFF_Activation_Index    := FieldByName('IFF_Activation_Index').AsInteger;
          IFF_Device_Type         := FieldByName('IFF_Device_Type').AsInteger;
          IFF_Mode                := FieldByName('IFF_Mode').AsInteger;
          IFF_Code                := FieldByName('IFF_Code').AsInteger;
          Mode_State              := FieldByName('Mode_State').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetRainfall_On_ESM(const id: integer;
    var rec: TRainfall_On_ESM): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Rainfall_On_ESM ' );

      SQL.Add('WHERE (Radar_Frequency = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TRainfall_On_ESM.Create;
        with rec.FData do begin
          Radar_Frequency   := FieldByName('Radar_Frequency').AsSingle;
          Rain_0_Effect     := FieldByName('Rain_0_Effect').AsSingle;
          Rain_1_Effect     := FieldByName('Rain_1_Effect').AsSingle;
          Rain_2_Effect     := FieldByName('Rain_2_Effect').AsSingle;
          Rain_3_Effect     := FieldByName('Rain_3_Effect').AsSingle;
          Rain_4_Effect     := FieldByName('Rain_4_Effect').AsSingle;
          Rain_5_Effect     := FieldByName('Rain_5_Effect').AsSingle;
          Rain_6_Effect     := FieldByName('Rain_6_Effect').AsSingle;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetRainfall_On_Missile_Seeker(const id: integer;
    var rec: TRainfall_On_Missile_Seeker): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Rainfall_On_Missile_Seeker ' );

      SQL.Add('WHERE (Guide_Type = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TRainfall_On_Missile_Seeker.Create;
        with rec.FData do begin
          Guide_Type      := FieldByName('Guide_Type').AsInteger;
          Rain_0_Effect   := FieldByName('Rain_0_Effect').AsSingle;
          Rain_1_Effect   := FieldByName('Rain_1_Effect').AsSingle;
          Rain_2_Effect   := FieldByName('Rain_2_Effect').AsSingle;
          Rain_3_Effect   := FieldByName('Rain_3_Effect').AsSingle;
          Rain_4_Effect   := FieldByName('Rain_4_Effect').AsSingle;
          Rain_5_Effect   := FieldByName('Rain_5_Effect').AsSingle;
          Rain_6_Effect   := FieldByName('Rain_6_Effect').AsSingle;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetRainfall_On_Radar(const id: integer;
    var rec: TRainfall_On_Radar): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Rainfall_On_Radar ' );

      SQL.Add('WHERE (Radar_Frequency = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TRainfall_On_Radar.Create;
        with rec.FData do begin
          Radar_Frequency   := FieldByName('Radar_Frequency').AsSingle;
          Rain_0_Effect     := FieldByName('Rain_0_Effect').AsSingle;
          Rain_1_Effect     := FieldByName('Rain_1_Effect').AsSingle;
          Rain_2_Effect     := FieldByName('Rain_2_Effect').AsSingle;
          Rain_3_Effect     := FieldByName('Rain_3_Effect').AsSingle;
          Rain_4_Effect     := FieldByName('Rain_4_Effect').AsSingle;
          Rain_5_Effect     := FieldByName('Rain_5_Effect').AsSingle;
          Rain_6_Effect     := FieldByName('Rain_6_Effect').AsSingle;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetRainfall_On_Sonar(const id: integer;
    var rec: TRainfall_On_Sonar): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Rainfall_On_Sonar ' );

      SQL.Add('WHERE (Sonar_Frequency = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TRainfall_On_Sonar.Create;
        with rec.FData do begin
          Sonar_Frequency   := FieldByName('Sonar_Frequency').AsSingle;
          Rain_0_Effect     := FieldByName('Rain_0_Effect').AsSingle;
          Rain_1_Effect     := FieldByName('Rain_1_Effect').AsSingle;
          Rain_2_Effect     := FieldByName('Rain_2_Effect').AsSingle;
          Rain_3_Effect     := FieldByName('Rain_3_Effect').AsSingle;
          Rain_4_Effect     := FieldByName('Rain_4_Effect').AsSingle;
          Rain_5_Effect     := FieldByName('Rain_5_Effect').AsSingle;
          Rain_6_Effect     := FieldByName('Rain_6_Effect').AsSingle;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetReference_Point(const id: integer;
    var rec: TReference_Point): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Reference_Point ' );

      SQL.Add('WHERE (Reference_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TReference_Point.Create;
        with rec.FData do begin
          Reference_Index         := FieldByName('Reference_Index').AsInteger;
          Resource_Alloc_Index    := FieldByName('Resource_Alloc_Index').AsInteger;
          Reference_Identifier    := FieldByName('Reference_Identifier').AsString;
          Force_Designation       := FieldByName('Force_Designation').AsInteger;
          Track_Type              := FieldByName('Track_Type').AsInteger;
          Symbol_Type             := FieldByName('Symbol_Type').AsInteger;
          Course                  := FieldByName('Course').AsSingle;
          Speed                   := FieldByName('Speed').AsSingle;
          X_Position              := FieldByName('X_Position').AsSingle;
          Y_Position              := FieldByName('Y_Position').AsSingle;
          Latitude                := FieldByName('Latitude').AsFloat;
          Longitude               := FieldByName('Longitude').AsFloat;
          Track_Bearing           := FieldByName('Track_Bearing').AsSingle;
          AOP_Start_Time_Offset   := FieldByName('AOP_Start_Time_Offset').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetResource_Geo_Area_Mapping(const id: integer;
    var rec: TResource_Geo_Area_Mapping): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Resource_Geo_Area_Mapping ' );

      SQL.Add('WHERE (Geo_Area_Instance_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TResource_Geo_Area_Mapping.Create;
        with rec.FData do begin
          Geo_Area_Instance_Index   := FieldByName('Geo_Area_Instance_Index').AsInteger;
          Resource_Alloc_Index      := FieldByName('Resource_Alloc_Index').AsInteger;
          Geo_Area_Index            := FieldByName('Geo_Area_Index').AsInteger;
          Force_Designation         := FieldByName('Force_Designation').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetResource_Interval_List_Mapping(const id: integer;
    var rec: TResource_Interval_List_Mapping): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Resource_Interval_List_Mapping ' );

      SQL.Add('WHERE (Resource_Alloc_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TResource_Interval_List_Mapping.Create;
        with rec.FData do begin
          Resource_Alloc_Index    := FieldByName('Resource_Alloc_Index').AsInteger;
          Interval_List_Index     := FieldByName('Interval_List_Index').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetResource_Library_Mapping(const id: integer;
    var rec: TResource_Library_Mapping): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Resource_Library_Mapping ' );

      SQL.Add('WHERE (Resource_Alloc_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TResource_Library_Mapping.Create;
        with rec.FData do begin
          Resource_Alloc_Index    := FieldByName('Resource_Alloc_Index').AsInteger;
          Library_Index           := FieldByName('Library_Index').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetResource_Overlay_Mapping(const id: integer;
    var rec: TResource_Overlay_Mapping): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Resource_Overlay_Mapping ' );

      SQL.Add('WHERE (Overlay_Instance_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TResource_Overlay_Mapping.Create;
        with rec.FData do begin
          Overlay_Instance_Index    := FieldByName('Overlay_Instance_Index').AsInteger;
          Resource_Alloc_Index      := FieldByName('Resource_Alloc_Index').AsInteger;
          Overlay_Index             := FieldByName('Overlay_Index').AsInteger;
          Force_Designation         := FieldByName('Force_Designation').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetResource_Pattern_Mapping(const id: integer;
    var rec: TResource_Pattern_Mapping): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Resource_Pattern_Mapping ' );

      SQL.Add('WHERE (Pattern_Instance_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TResource_Pattern_Mapping.Create;
        with rec.FData do begin
          Pattern_Instance_Index    := FieldByName('Pattern_Instance_Index').AsInteger;
          Resource_Alloc_Index      := FieldByName('Resource_Alloc_Index').AsInteger;
          Pattern_Index             := FieldByName('Pattern_Index').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetResource_Sonobuoy_Mapping(const id: integer;
    var rec: TResource_Sonobuoy_Mapping): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Resource_Sonobuoy_Mapping ' );

      SQL.Add('WHERE (Sonobuoy_Resource_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TResource_Sonobuoy_Mapping.Create;
        with rec.FData do begin
          Sonobuoy_Resource_Index   := FieldByName('Sonobuoy_Resource_Index').AsInteger;
          Resource_Alloc_Index      := FieldByName('Resource_Alloc_Index').AsInteger;
          Sonobuoy_Index            := FieldByName('Sonobuoy_Index').AsInteger;
          Force_Designation         := FieldByName('Force_Designation').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetResource_Template_Mapping(const id: integer;
    var rec: TResource_Template_Mapping): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Resource_Template_Mapping ' );

      SQL.Add('WHERE (Template_Instance_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TResource_Template_Mapping.Create;
        with rec.FData do begin
          Template_Instance_Index   := FieldByName('Template_Instance_Index').AsInteger;
          Resource_Alloc_Index      := FieldByName('Resource_Alloc_Index').AsInteger;
          Template_Index            := FieldByName('Template_Index').AsInteger;
          Force_Designation         := FieldByName('Force_Designation').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetRuntime_Platform_Library(const id: integer;
    var rec: TRuntime_Platform_Library): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Runtime_Platform_Library ' );

      SQL.Add('WHERE (Platform_Library_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TRuntime_Platform_Library.Create;
        with rec.FData do begin
          Platform_Library_Index    := FieldByName('Platform_Library_Index').AsInteger;
          Library_Name              := FieldByName('Library_Name').AsString;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetScripted_Behav_Definition(const id: integer;
    var rec: TScripted_Behav_Definition): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Scripted_Behav_Definition ' );

      SQL.Add('WHERE (Scripted_Event_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TScripted_Behav_Definition.Create;
        with rec.FData do begin
          Scripted_Event_Index      := FieldByName('Scripted_Event_Index').AsInteger;
          Number_of_Event           := FieldByName('Number_of_Event').AsInteger;
          Platform_Event_Index      := FieldByName('Platform_Event_Index').AsInteger;
          Speed                     := FieldByName('Speed').AsInteger;
          Altitude                  := FieldByName('Altitude').AsSingle;
          Vert_Speed                := FieldByName('Vert_Speed').AsInteger;
          Waypoint_Latitude         := FieldByName('Waypoint_Latitude').AsFloat;
          Waypoint_Longitude        := FieldByName('Waypoint_Longitude').AsFloat;
          Cartesian_Waypoint_X      := FieldByName('Cartesian_Waypoint_X').AsSingle;
          Cartesian_Waypoint_Y      := FieldByName('Cartesian_Waypoint_Y').AsSingle;
          Time_Waypoint             := FieldByName('Time_Waypoint').AsInteger;
          Time_2_Waypoint           := FieldByName('Time_2_Waypoint').AsInteger;
          HF_Datalink_Activate      := FieldByName('HF_Datalink_Activate').AsInteger;
          UHF_Datalink_Activate     := FieldByName('UHF_Datalink_Activate').AsInteger;
          Sonobuoy_Resource_Index   := FieldByName('Sonobuoy_Resource_Index').AsInteger;
          Sonobuoy_Instance_Index   := FieldByName('Sonobuoy_Instance_Index').AsInteger;
          Deploy_Sonobuoys          := FieldByName('Deploy_Sonobuoys').AsInteger;
          Sonobuoy_Spacing          := FieldByName('Sonobuoy_Spacing').AsSingle;
          Num_Sonobuoys_2_Drop      := FieldByName('Num_Sonobuoys_2_Drop').AsInteger;
          Sonobuoy_Depth            := FieldByName('Sonobuoy_Depth').AsSingle;
          Jammer_Control            := FieldByName('Jammer_Control').AsInteger;
          Remove_from_Game          := FieldByName('Remove_from_Game').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetScripted_IFF_Event(const id: integer;
    var rec: TScripted_IFF_Event): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Scripted_IFF_Event ' );

      SQL.Add('WHERE (Scripted_Event_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TScripted_IFF_Event.Create;
        with rec.FData do begin
          Scripted_Event_Index        := FieldByName('Scripted_Event_Index').AsInteger;
          IFF_Instance_Index          := FieldByName('IFF_Instance_Index').AsInteger;
          IFF_Interrogator_Control    := FieldByName('IFF_Interrogator_Control').AsInteger;
          IFF_Transponder_Control     := FieldByName('IFF_Transponder_Control').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetScripted_Infrared_Decoy_Event(const id: integer;
    var rec: TScripted_Infrared_Decoy_Event): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Scripted_Infrared_Decoy_Event ' );

      SQL.Add('WHERE (Scripted_Event_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TScripted_Infrared_Decoy_Event.Create;
        with rec.FData do begin
          Scripted_Event_Index            := FieldByName('Scripted_Event_Index').AsInteger;
          Infrared_Decoy_Instance_Index   := FieldByName('Infrared_Decoy_Instance_Index').AsInteger;
          Infrared_Decoy_Bloom_Spacing    := FieldByName('Infrared_Decoy_Bloom_Spacing').AsSingle;
          Num_Blooms_2_Release            := FieldByName('Num_Blooms_2_Release').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetScripted_Pattern_Point(const id: integer;
    var rec: TScripted_Pattern_Point): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Scripted_Pattern_Point ' );

      SQL.Add('WHERE (Scripted_Pattern_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TScripted_Pattern_Point.Create;
        with rec.FData do begin
          Scripted_Pattern_Index    := FieldByName('Scripted_Pattern_Index').AsInteger;
          Point_Number              := FieldByName('Point_Number').AsInteger;
          Pattern_Index             := FieldByName('Pattern_Index').AsInteger;
          Heading                   := FieldByName('Heading').AsSingle;
          Range                     := FieldByName('Range').AsSingle;
          Speed                     := FieldByName('Speed').AsInteger;
          Altitude                  := FieldByName('Altitude').AsSingle;
          Vert_Speed                := FieldByName('Vert_Speed').AsInteger;
          Time_Waypoint             := FieldByName('Time_Waypoint').AsInteger;
          Time_2_Waypoint           := FieldByName('Time_2_Waypoint').AsInteger;
          HF_Datalink_Activate      := FieldByName('HF_Datalink_Activate').AsInteger;
          UHF_Datalink_Activate     := FieldByName('UHF_Datalink_Activate').AsInteger;
          Sonobuoy_Instance_Index   := FieldByName('Sonobuoy_Instance_Index').AsInteger;
          Deploy_Sonobuoys          := FieldByName('Deploy_Sonobuoys').AsInteger;
          Sonobuoy_Spacing          := FieldByName('Sonobuoy_Spacing').AsSingle;
          Num_Sonobuoys_2_Drop      := FieldByName('Num_Sonobuoys_2_Drop').AsInteger;
          Sonobuoy_Depth            := FieldByName('Sonobuoy_Depth').AsSingle;
          Jammer_Control            := FieldByName('Jammer_Control').AsInteger;
          Remove_from_Game          := FieldByName('Remove_from_Game').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetScripted_Radar_Event(const id: integer;
    var rec: TScripted_Radar_Event): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Scripted_Radar_Event ' );

      SQL.Add('WHERE (Scripted_Event_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TScripted_Radar_Event.Create;
        with rec.FData do begin
          Scripted_Event_Index    := FieldByName('Scripted_Event_Index').AsInteger;
          Radar_Index             := FieldByName('Radar_Index').AsInteger;
          Radar_Control           := FieldByName('Radar_Control').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetScripted_Sonar_Event(const id: integer;
    var rec: TScripted_Sonar_Event): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Scripted_Sonar_Event ' );

      SQL.Add('WHERE (Scripted_Event_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TScripted_Sonar_Event.Create;
        with rec.FData do begin
          Scripted_Event_Index    := FieldByName('Scripted_Event_Index').AsInteger;
          Sonar_Index             := FieldByName('Sonar_Index').AsInteger;
          Sonar_Control           := FieldByName('Sonar_Control').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetScripted_Weapon_Event(const id: integer;
    var rec: TScripted_Weapon_Event): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Scripted_Weapon_Event ' );

      SQL.Add('WHERE (List_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TScripted_Weapon_Event.Create;
        with rec.FData do begin
          List_Index              := FieldByName('List_Index').AsInteger;
          Scripted_Event_Index    := FieldByName('Scripted_Event_Index').AsInteger;
          Salvo_Size              := FieldByName('Salvo_Size').AsInteger;
          Number_Layed            := FieldByName('Number_Layed').AsInteger;
          Distance_Between        := FieldByName('Distance_Between').AsSingle;
          Mine_Depth              := FieldByName('Mine_Depth').AsSingle;
          Target_Index            := FieldByName('Target_Index').AsInteger;
          Weapon_Type             := FieldByName('Weapon_Type').AsInteger;
          Point_Effect            := FieldByName('Point_Effect').AsInteger;
          Weapons_Mount           := FieldByName('Weapons_Mount').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetSea_State_On_Missile_Safe_Altitude(const id: integer;
    var rec: TSea_State_On_Missile_Safe_Altitude): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Sea_State_On_Missile_Safe_Altitude ' );

      SQL.Add('WHERE (Sea_State = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TSea_State_On_Missile_Safe_Altitude.Create;
        with rec.FData do begin
          Sea_State                         := FieldByName('Sea_State').AsInteger;
          Effect_on_Missile_Safe_Altitude   := FieldByName('Effect_on_Missile_Safe_Altitud').AsSingle;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetSea_State_On_Radar(const id: integer;
    var rec: TSea_State_On_Radar): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Sea_State_On_Radar ' );

      SQL.Add('WHERE (Sea_State = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TSea_State_On_Radar.Create;
        with rec.FData do begin
          Sea_State         := FieldByName('Sea_State').AsInteger;
          Effect_on_Radar   := FieldByName('Effect_on_Radar').AsSingle;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetSea_State_On_Sonar(const id: integer;
    var rec: TSea_State_On_Sonar): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Sea_State_On_Sonar ' );

      SQL.Add('WHERE (Sonar_Frequency = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TSea_State_On_Sonar.Create;
        with rec.FData do begin
          Sonar_Frequency   := FieldByName('Sonar_Frequency').AsSingle;
          Sea_0_Effect      := FieldByName('Sea_0_Effect').AsSingle;
          Sea_1_Effect      := FieldByName('Sea_1_Effect').AsSingle;
          Sea_2_Effect      := FieldByName('Sea_2_Effect').AsSingle;
          Sea_3_Effect      := FieldByName('Sea_3_Effect').AsSingle;
          Sea_4_Effect      := FieldByName('Sea_4_Effect').AsSingle;
          Sea_5_Effect      := FieldByName('Sea_5_Effect').AsSingle;
          Sea_6_Effect      := FieldByName('Sea_6_Effect').AsSingle;
          Sea_7_Effect      := FieldByName('Sea_7_Effect').AsSingle;
          Sea_8_Effect      := FieldByName('Sea_8_Effect').AsSingle;
          Sea_9_Effect      := FieldByName('Sea_9_Effect').AsSingle;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetShip_Noise_On_Sonar(const id: integer;
    var rec: TShip_Noise_On_Sonar): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Ship_Noise_On_Sonar ' );

      SQL.Add('WHERE (Sonar_Frequency = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TShip_Noise_On_Sonar.Create;
        with rec.FData do begin
          Sonar_Frequency       := FieldByName('Sonar_Frequency').AsSingle;
          Distant_Ship_Effect   := FieldByName('Distant_Ship_Effect').AsSingle;
          Light_Ship_Effect     := FieldByName('Light_Ship_Effect').AsSingle;
          Medium_Ship_Effect    := FieldByName('Medium_Ship_Effect').AsSingle;
          Heavy_Ship_Effect     := FieldByName('Heavy_Ship_Effect').AsSingle;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetStudent_Role_Definition(const id: integer;
    var rec: TStudent_Role_Definition): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Student_Role_Definition ' );

      SQL.Add('WHERE (Student_Role_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TStudent_Role_Definition.Create;
        with rec.FData do begin
          Student_Role_Index    := FieldByName('Student_Role_Index').AsInteger;
          Role_Identifier       := FieldByName('Role_Identifier').AsString;
          Role_List_Index       := FieldByName('Role_List_Index').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetStudent_Role_List(const id: integer;
    var rec: TStudent_Role_List): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Student_Role_List ' );

      SQL.Add('WHERE (Role_List_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TStudent_Role_List.Create;
        with rec.FData do begin
          Role_List_Index         := FieldByName('Role_List_Index').AsInteger;
          Role_List_Identifier    := FieldByName('Role_List_Identifier').AsString;
        end;
      end;
    end;
  end;

//------------------------------------------------------------------------------

////====================================================
  function TDMQuery.GetSubArea_Enviro_Definition(const id: integer;
    var rec: TSubArea_Enviro_Definition): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM SubArea_Enviro_Definition ' );

      SQL.Add('WHERE (Enviro_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TSubArea_Enviro_Definition.Create;
        with rec.FData do begin
          Enviro_Index                    := FieldByName('Enviro_Index').AsInteger;
          Game_Enviro_Index               := FieldByName('Game_Enviro_Index').AsInteger;
          Enviro_Identifier               := FieldByName('Enviro_Identifier').AsString;
          X_Position_1                    := FieldByName('X_Position_1').AsSingle;
          Y_Position_1                    := FieldByName('Y_Position_1').AsSingle;
          X_Position_2                    := FieldByName('X_Position_2').AsSingle;
          Y_Position_2                    := FieldByName('Y_Position_2').AsSingle;
          Latitude_1                      := FieldByName('Latitude_1').AsFloat;
          Longitude_1                     := FieldByName('Longitude_1').AsFloat;
          Latitude_2                      := FieldByName('Latitude_2').AsFloat;
          Longitude_2                     := FieldByName('Longitude_2').AsFloat;
          Wind_Speed                      := FieldByName('Wind_Speed').AsSingle;
          Wind_Direction                  := FieldByName('Wind_Direction').AsSingle;
          Daytime_Visual_Modifier         := FieldByName('Daytime_Visual_Modifier').AsSingle;
          Nighttime_Visual_Modifier       := FieldByName('Nighttime_Visual_Modifier').AsSingle;
          Daytime_Infrared_Modifier       := FieldByName('Daytime_Infrared_Modifier').AsSingle;
          Nighttime_Infrared_Modifier     := FieldByName('Nighttime_Infrared_Modifier').AsSingle;
          Rain_Rate                       := FieldByName('Rain_Rate').AsInteger;
          Cloud_Base_Height               := FieldByName('Cloud_Base_Height').AsSingle;
          Cloud_Attenuation               := FieldByName('Cloud_Attenuation').AsInteger;
          Sea_State                       := FieldByName('Sea_State').AsInteger;
          Ocean_Current_Speed             := FieldByName('Ocean_Current_Speed').AsSingle;
          Ocean_Current_Direction         := FieldByName('Ocean_Current_Direction').AsSingle;
          Thermal_Layer_Depth             := FieldByName('Thermal_Layer_Depth').AsSingle;
          Sound_Velocity_Type             := FieldByName('Sound_Velocity_Type').AsInteger;
          Surface_Sound_Speed             := FieldByName('Surface_Sound_Speed').AsSingle;
          Layer_Sound_Speed               := FieldByName('Layer_Sound_Speed').AsSingle;
          Bottom_Sound_Speed              := FieldByName('Bottom_Sound_Speed').AsSingle;
          Bottomloss_Coefficient          := FieldByName('Bottomloss_Coefficient').AsInteger;
          Ave_Ocean_Depth                 := FieldByName('Ave_Ocean_Depth').AsSingle;
          CZ_Active                       := FieldByName('CZ_Active').AsInteger;
          Surface_Ducting_Active          := FieldByName('Surface_Ducting_Active').AsInteger;
          Upper_Limit_Sur_Duct_Depth      := FieldByName('Upper_Limit_Sur_Duct_Depth').AsSingle;
          Lower_Limit_Sur_Duct_Depth      := FieldByName('Lower_Limit_Sur_Duct_Depth').AsSingle;
          Sub_Ducting_Active              := FieldByName('Sub_Ducting_Active').AsInteger;
          Upper_Limit_Sub_Duct_Depth      := FieldByName('Upper_Limit_Sub_Duct_Depth').AsSingle;
          Lower_Limit_Sub_Duct_Depth      := FieldByName('Lower_Limit_Sub_Duct_Depth').AsSingle;
          Shipping_Rate                   := FieldByName('Shipping_Rate').AsInteger;
          Shadow_Zone_Trans_Loss          := FieldByName('Shadow_Zone_Trans_Loss').AsSingle;
          Atmospheric_Refract_Modifier    := FieldByName('Atmospheric_Refract_Modifier').AsSingle;
          Barometric_Pressure             := FieldByName('Barometric_Pressure').AsSingle;
          Air_Temperature                 := FieldByName('Air_Temperature').AsSingle;
          Surface_Temperature             := FieldByName('Surface_Temperature').AsSingle;
          HF_Black_Hole                   := FieldByName('HF_Black_Hole').AsInteger;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetText_Message_Template(const id: integer;
    var rec: TText_Message_Template): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Text_Message_Template ' );

      SQL.Add('WHERE (Template_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TText_Message_Template.Create;
        with rec.FData do begin
          Template_Index        := FieldByName('Template_Index').AsInteger;
          Template_Identifier   := FieldByName('Template_Identifier').AsString;
          //    Template_Form   := FieldByName('//    Template_Form').AsString;
          Template_Form         := FieldByName('Template_Form').AsString;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

////====================================================
  function TDMQuery.GetTorpedo_POH_Modifier(const id: integer;
    var rec: TTorpedo_POH_Modifier): boolean;
  begin
    result := false;
    if not zConn.Connected then Exit;

    with ZQ do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * ');
      SQL.Add('FROM Torpedo_POH_Modifier ' );

      SQL.Add('WHERE (Torpedo_Index = ' +  IntToStr(id) + ')' );
      Open;

      result := RecordCount > 0;
      if not IsEmpty then begin
        First;
        if not Assigned(rec) then
          rec := TTorpedo_POH_Modifier.Create;
        with rec.FData do begin
          Torpedo_Index   := FieldByName('Torpedo_Index').AsInteger;
          Aspect_Angle    := FieldByName('Aspect_Angle').AsInteger;
          POH_Modifier    := FieldByName('POH_Modifier').AsSingle;
        end;
      end;
    end;
  end;

//-------------------------------------------------------------------

//-------------------------------------------------------------------
{template

function TdmTTT.Get(const id: integer;
  var rec: T): boolean;
begin
  result := false;
  if not zConn.Connected then Exit;

  with ZQ do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM  ' );
    SQL.Add('WHERE (_Index = ' +  IntToStr(id) + ')' );
    Open;

    result := RecordCount > 0;
    if not IsEmpty then begin
      First;
      if not Assigned(rec) then
        rec := T.Create;
      with rec.FData do begin
           := FieldByName('').AsInteger;
           := FieldByName('').AsString;
           := FieldByName('').AsInteger;
      end;
    end;
  end;
end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TdmTTT.getAll(const id: integer;
      var aRec: TList): Integer;
var i: Integer;
    rec: TPlatform_Instance;
begin
  result := -1;
  if not zConn.Connected then Exit;

  with ZQ do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * ');
    SQL.Add('FROM  PlatFormInstance ' );
    SQL.Add('WHERE (Resource_Alloc_Index = ' +  IntToStr(id) + ')' );
    Open;

    result := RecordCount;
    if not IsEmpty then begin

      First;

      if not Assigned(aRec) then
        aRec := TList.Create
      else
        aRec.Clear;

      while not zq.Eof do begin
        rec := T.Create;
        with rec.FData do begin
            := FieldByName('').AsInteger;
            := FieldByName('').AsInteger;
            := FieldByName('').AsString;
            := FieldByName('').AsString;
            := FieldByName('').AsFloat;
        end;
        aRec.Add(rec);
        Zq.Next;
      end;
    end;
  end;
end;


}

end.
