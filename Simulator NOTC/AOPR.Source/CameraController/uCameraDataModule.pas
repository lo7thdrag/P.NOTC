unit uCameraDataModule;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection;

type
  TdmCamera = class(TDataModule)
    ZConn: TZConnection;
    ZQ: TZQuery;
  private
    { Private declarations }
  public
    function InitZDB(const zDbServer, zDBProto, zDBname, zDBuser,
      zDBPass: string): Boolean;

    function GetPlatformInstance(var aList: TList): Integer;
    function GetVehicleDef(var aList: TList): Integer;
  end;

var
  dmCamera: TdmCamera;

implementation

uses
  Dialogs, uPlatformData;

{$R *.dfm}

{ TDataModule1 }

function TdmCamera.GetPlatformInstance(var aList: TList): Integer;
var
  plat : TPlatform;
  platType : Byte;
begin
  Result := -1;

  if not ZConn.Connected then
    Exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT *');
    SQL.Add('FROM Platform_Instance');
    SQL.Add('ORDER BY Instance_Name');
    Open;

    Result := RecordCount;

    if Assigned(aList) then
      aList.Clear
    else
      aList := TList.Create;

    if not IsEmpty then
    begin
      First;

      while not Eof do
      begin
        plat := TPlatform.Create;

        with plat do
        begin
          InstanceIndex := FieldByName('Platform_Instance_Index').AsInteger;
          InstanceName := FieldByName('Instance_Name').AsString;
          platType := FieldByName('Platform_Type').AsInteger;

          case platType of
            1: ClassIndex := FieldByName('Vehicle_Index').AsInteger;
            2: ClassIndex := FieldByName('Missile_Index').AsInteger;
            3: ClassIndex := FieldByName('Torpedo_Index').AsInteger;
            4: ClassIndex := FieldByName('Sonobuoy_Index').AsInteger;
            5: ClassIndex := FieldByName('Mine_Index').AsInteger;
            6: ClassIndex := FieldByName('Satellite_Index').AsInteger;
          end;
        end;

        aList.Add(plat);
        Next;
      end;

      plat := nil;
      plat.Free;
    end;
  end;
end;

function TdmCamera.GetVehicleDef(var aList: TList): Integer;
var
  rec : TVehicle_Definition;
begin
  Result := -1;

  if not ZConn.Connected then
    Exit;

  with ZQ do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT *');
    SQL.Add('FROM Vehicle_Definition');
    SQL.Add('ORDER BY Vehicle_Identifier');
    Open;

    Result := RecordCount;

    if not IsEmpty then
    begin
      First;

      while not Eof do
      begin
        rec := TVehicle_Definition.Create;

        with rec.FData do
        begin
          Vehicle_Index := FieldByName('Vehicle_Index').AsInteger;
          Vehicle_Identifier := FieldByName('Vehicle_Identifier').AsString;
          Platform_Domain := FieldByName('Platform_Domain').AsInteger;
          Platform_Category := FieldByName('Platform_Category').AsInteger;
          Platform_Type := FieldByName('Platform_Type').AsInteger;
          Motion_Characteristics := FieldByName('Motion_Characteristics')
            .AsInteger;
          Length := FieldByName('Length').AsSingle;
          Width := FieldByName('Width').AsSingle;
          Height := FieldByName('Height').AsSingle;
          Draft := FieldByName('Draft').AsSingle;
          Front_Radar_Cross := FieldByName('Front_Radar_Cross').AsSingle;
          Side_Radar_Cross := FieldByName('Side_Radar_Cross').AsSingle;
          Front_Acoustic_Cross := FieldByName('Front_Acoustic_Cross').AsSingle;
          Side_Acoustic_Cross := FieldByName('Side_Acoustic_Cross').AsSingle;
          Magnetic_Cross := FieldByName('Magnetic_Cross').AsSingle;
          Front_Visual_EO_Cross := FieldByName('Front_Visual_EO_Cross')
            .AsSingle;
          Side_Visual_EO_Cross := FieldByName('Side_Visual_EO_Cross').AsSingle;
          Front_Infrared_Cross := FieldByName('Front_Infrared_Cross').AsSingle;
          Side_Infrared_Cross := FieldByName('Side_Infrared_Cross').AsSingle;
          LSpeed_Acoustic_Intens := FieldByName('LSpeed_Acoustic_Intens')
            .AsSingle;
          Below_Cav_Acoustic_Intens := FieldByName('Below_Cav_Acoustic_Intens')
            .AsSingle;
          Above_Cav_Acoustic_Intens := FieldByName('Above_Cav_Acoustic_Intens')
            .AsSingle;
          HSpeed_Acoustic_Intens := FieldByName('HSpeed_Acoustic_Intens')
            .AsSingle;
          Cavitation_Speed_Switch := FieldByName('Cavitation_Speed_Switch')
            .AsSingle;
          Time_of_Weapon_Impact := FieldByName('Time_of_Weapon_Impact')
            .AsInteger;
          Chaff_Seduction_Capable := FieldByName('Chaff_Seduction_Capable')
            .AsBoolean;
          Seduction_Mode_Prob := FieldByName('Seduction_Mode_Prob').AsSingle;
          Min_Delay_Between_Chaff_Rounds := FieldByName
            ('Min_Delay_Between_Chaff_Rounds').AsInteger;
          Max_Chaff_Salvo_Size := FieldByName('Max_Chaff_Salvo_Size').AsInteger;
          SARH_POH_Modifier := FieldByName('SARH_POH_Modifier').AsSingle;
          CG_POH_Modifier := FieldByName('CG_POH_Modifier').AsSingle;
          TARH_POH_Modifier := FieldByName('TARH_POH_Modifier').AsSingle;
          IR_POH_Modifier := FieldByName('IR_POH_Modifier').AsSingle;
          AR_POH_Modifier := FieldByName('AR_POH_Modifier').AsSingle;
          Active_Acoustic_Tor_POH_Mod := FieldByName
            ('Active_Acoustic_Tor_POH_Mod').AsSingle;
          Passive_Acoustic_Tor_POH_Mod := FieldByName
            ('Passive_Acoustic_Tor_POH_Mod').AsSingle;
          Active_Passive_Tor_POH_Mod := FieldByName
            ('Active_Passive_Tor_POH_Mod').AsSingle;
          Wake_Home_POH_Modifier := FieldByName('Wake_Home_POH_Modifier')
            .AsSingle;
          Wire_Guide_POH_Modifier := FieldByName('Wire_Guide_POH_Modifier')
            .AsSingle;
          Mag_Mine_POH_Modifier := FieldByName('Mag_Mine_POH_Modifier')
            .AsSingle;
          Press_Mine_POH_Modifier := FieldByName('Press_Mine_POH_Modifier')
            .AsSingle;
          Impact_Mine_POH_Modifier := FieldByName('Impact_Mine_POH_Modifier')
            .AsSingle;
          Acoustic_Mine_POH_Modifier := FieldByName
            ('Acoustic_Mine_POH_Modifier').AsSingle;
          Sub_Comm_Antenna_Height := FieldByName('Sub_Comm_Antenna_Height')
            .AsSingle;
          Rel_Comm_Antenna_Height := FieldByName('Rel_Comm_Antenna_Height')
            .AsSingle;
          Max_Comm_Operating_Depth := FieldByName('Max_Comm_Operating_Depth')
            .AsSingle;
          HF_Link_Capable := FieldByName('HF_Link_Capable').AsBoolean;
          UHF_Link_Capable := FieldByName('UHF_Link_Capable').AsBoolean;
          HF_Voice_Capable := FieldByName('HF_Voice_Capable').AsBoolean;
          VHF_Voice_Capable := FieldByName('VHF_Voice_Capable').AsBoolean;
          UHF_Voice_Capable := FieldByName('UHF_Voice_Capable').AsBoolean;
          SATCOM_Voice_Capable := FieldByName('SATCOM_Voice_Capable').AsBoolean;
          UWT_Voice_Capable := FieldByName('UWT_Voice_Capable').AsBoolean;
          HF_MHS_Capable := FieldByName('HF_MHS_Capable').AsBoolean;
          UHF_MHS_Capable := FieldByName('UHF_MHS_Capable').AsBoolean;
          SATCOM_MHS_Capable := FieldByName('SATCOM_MHS_Capable').AsBoolean;
          Damage_Capacity := FieldByName('Damage_Capacity').AsInteger;
          Plat_Basing_Capability := FieldByName('Plat_Basing_Capability')
            .AsBoolean;
          Chaff_Capability := FieldByName('Chaff_Capability').AsBoolean;
          Readying_Time := FieldByName('Readying_Time').AsInteger;
          Sonobuoy_Capable := FieldByName('Sonobuoy_Capable').AsBoolean;
          Nav_Light_Capable := FieldByName('Nav_Light_Capable').AsBoolean;
          Periscope_Depth := FieldByName('Periscope_Depth').AsSingle;
          Periscope_Height_Above_Water := FieldByName
            ('Periscope_Height_Above_Water').AsSingle;
          Periscope_Front_Radar_Xsection := FieldByName
            ('Periscope_Front_Radar_Xsection').AsSingle;
          Periscope_Side_Radar_Xsection := FieldByName
            ('Periscope_Side_Radar_Xsection').AsSingle;
          Periscope_Front_Vis_Xsection := FieldByName
            ('Periscope_Front_Vis_Xsection').AsSingle;
          Periscope_Side_Vis_Xsection := FieldByName
            ('Periscope_Side_Vis_Xsection').AsSingle;
          Periscope_Front_IR_Xsection := FieldByName
            ('Periscope_Front_IR_Xsection').AsSingle;
          Periscope_Side_IR_Xsection := FieldByName
            ('Periscope_Side_IR_Xsection').AsSingle;
          Engagement_Range := FieldByName('Engagement_Range').AsSingle;
          Auto_Air_Defense_Capable := FieldByName('Auto_Air_Defense_Capable')
            .AsBoolean;
          Alert_State_Time := FieldByName('Alert_State_Time').AsSingle;
          Detectability_Type := FieldByName('Detectability_Type').AsInteger;
          Max_Sonobuoys_To_Monitor := FieldByName('Max_Sonobuoys_To_Monitor')
            .AsInteger;
          Sonobuoy_Deploy_Max_Altitude := FieldByName
            ('Sonobuoy_Deploy_Max_Altitude').AsInteger;
          Sonobuoy_Deploy_Min_Altitude := FieldByName
            ('Sonobuoy_Deploy_Min_Altitude').AsInteger;
          Sonobuoy_Deploy_Max_Speed := FieldByName('Sonobuoy_Deploy_Max_Speed')
            .AsInteger;
          Air_Drop_Torpedo_Max_Altitude := FieldByName
            ('Air_Drop_Torpedo_Max_Altitude').AsInteger;
          Air_Drop_Torpedo_Min_Altitude := FieldByName
            ('Air_Drop_Torpedo_Min_Altitude').AsInteger;
          Air_Drop_Torpedo_Max_Speed := FieldByName
            ('Air_Drop_Torpedo_Max_Speed')
            .AsInteger;
          TMA_Rate_Factor := FieldByName('TMA_Rate_Factor').AsSingle;
          HMS_Noise_Reduction_Factor := FieldByName
            ('HMS_Noise_Reduction_Factor').AsSingle;
          TAS_Noise_Reduction_Factor := FieldByName
            ('TAS_Noise_Reduction_Factor').AsSingle;
          Infrared_Decoy_Capable := FieldByName('Infrared_Decoy_Capable')
            .AsBoolean;
          HF_Mid_Course_Update_Capable := FieldByName
            ('HF_Mid_Course_Update_Capable').AsBoolean;
          UHF_Mid_Course_Update_Capable := FieldByName
            ('UHF_Mid_Course_Update_Capable').AsBoolean;
//          SATCOM_Mid_Course_Update_Capable := FieldByName
//            ('SATCOM_Mid_Course_Update_Capable').AsBoolean;
        end;

        aList.Add(rec);
        Next;
      end;
    end;
  end;
end;

function TdmCamera.InitZDB(const zDbServer, zDBProto, zDBname, zDBuser,
  zDBPass: string): Boolean;
begin
  Result := False;

  with ZConn do
  begin
    HostName := zDbServer;
    Protocol := zDBProto;
    Database := zDBname;
    User := zDBuser;
    Password := zDBPass;
  end;

  try
    ZConn.Connect;
    Result := ZConn.Connected;
  except
    on Exception do
    begin
      MessageDlg('Error Database Connection on ' + zDbServer, mtError, [mbOK],
        0);
      Result := false;
      Exit;
    end
  end;

  ZQ.Connection := ZConn;
end;

end.
