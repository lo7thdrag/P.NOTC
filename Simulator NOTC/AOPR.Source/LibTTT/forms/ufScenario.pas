unit ufScenario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,uDBAsset_GameEnvironment,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, newClassASTT, uDBAssetObject;

type
  TfrmScenario = class(TForm)
    Label1: TLabel;
    edScenarioName: TEdit;
    pcScenarioTabs: TPageControl;
    tsGeneral: TTabSheet;
    StaticText1: TStaticText;
    tsRelationships: TTabSheet;
    Label95: TLabel;
    edResourceAllocation: TEdit;
    BitBtn1: TBitBtn;
    btDeployPlatforms: TButton;
    btPreplayScenario: TButton;
    btOK: TButton;
    btCancel: TButton;
    Apply: TButton;
    rgforce: TRadioGroup;
    gbPlatformRelationships: TGroupBox;
    btGroups: TButton;
    btLinks: TButton;
    procedure btGroupsClick(Sender: TObject);
    procedure btLinksClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btDeployPlatformsClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure getDetailScenario;
    procedure ForceChoose;
    procedure btPreplayScenarioClick(Sender: TObject);
    procedure ApplyClick(Sender: TObject);
    //procedure insert;
    procedure update;
  private
    { Private declarations }
  public
    { Public declarations }
    selectedScenario, force: Integer;
    fromScenario  : Boolean;
    selectedResourceAllocation : Integer;
    isNew, isCOpy : boolean;
    Scenario : TScenario_Definition;
    ResourceAllocation : TResource_Allocation;
    GameEnvi : TGame_Environment_Definition;
    id_resourceAlloc : Integer;
    centreLong, centreLatt : double;
    id_scenario : string;
    widthGameArea : single;
    {}
    sumOfList : integer;
    tesDraw : Array [0..100] of integer;
    {}
    //procedure getAvailablePlatform;
  end;

var
  frmScenario : TfrmScenario;
  scenario    : TScenario_Definition;
  ra          : TResource_Allocation;

implementation

uses uGroupAllocationWindow,uLinkWindow,uResurceAllocationSelect,uBaseCoordSystem,
uPlatformDeployment, uSimDBEditor, uGroupSelect, uDataModuleTTT,
  uAvailableScenario,shellapi;

{$R *.dfm}

procedure TfrmScenario.ApplyClick(Sender: TObject);
begin
  if isNew then
  begin
    Scenario.FData.Scenario_Identifier := edScenarioName.Text;
    insertScenario(scenario);
    isNew := false;
    btDeployPlatforms.Enabled := true;
    id_scenario := IntToStr(scenario.FData.Scenario_Index);
    selectedScenario := scenario.FData.Scenario_Index;
    id_resourceAlloc := scenario.FData.Resource_Alloc_Index;
    isNew := False;
  end
  else
  begin
    update;
  end;
  uPlatformDeployment.fPlatformDeploytment.Show;
  uPlatformDeployment.fPlatformDeploytment.Close;
end;

procedure TfrmScenario.update;
begin
  //EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Area_Index := id_game_area;
  //EnvironmentCharacteristicsWindowForm.GameEnviroDef.FGameArea.Game_Area_Index := id_game_area;
  scenario.FData.Scenario_Identifier := edScenarioName.Text;

  uSimDBEditor.updateScenario(Scenario, id_scenario);
end;

procedure TfrmScenario.BitBtn1Click(Sender: TObject);
begin
  fromScenario  := True;
 fResorceAllocationSelect.show;
end;

procedure TfrmScenario.btCancelClick(Sender: TObject);
begin
  Self.Close;
end;

{procedure TfrmScenario.getAvailablePlatform;
var
     I : integer;
     InstanceName : Array [0..100] of String;
     PlatformInstanceIndex : Array [0..100] of integer;
     ForceDesignation : Array [0..100] of integer;
     platformList : Array [0..100] of String;

     oriLat, oriLong, stringLat, stringLong : string;

begin
     if id_resourceAlloc <> 0 then
        dmTTT.getPlatFormInstance(frmScenario.id_resourceAlloc,0,'',SIMMgr.Platform_Insts)
     else
        dmTTT.getPlatFormInstance(frmScenario.Scenario.FData.Resource_Alloc_Index,0,'',SIMMgr.Platform_Insts);

     for I := 0 to SIMMgr.Platform_Insts.Count - 1 do
     begin
         InstanceName[I] := TPlatform_Instance(SIMMgr.Platform_Insts[i]).FData.Instance_Name;
         PlatformInstanceIndex[I] := TPlatform_Instance(SIMMgr.Platform_Insts[i]).FData.Platform_Instance_Index;
         ForceDesignation[I] := TPlatform_Instance(SIMMgr.Platform_Insts[i]).FData.Force_Designation;

         with fPlatformDeploytment.platformSelect.FActivation do
         begin
           oriLat := formatDM_latitude(Init_Position_Latitude);
           oriLong := formatDM_longitude(Init_Position_Longitude);
           stringLat := '00° 00.000' + ''' ' + 'N';
           stringLong := '000° 00.000' + ''' ' + 'E';

           //showmessage('orilat = '+oriLat+' ; strlat = '+stringlat);
           //ShowMessage('orilong = '+orilong+' ; strlong = '+stringlong);
           if (oriLat = stringLat) AND (oriLong = stringLong) then
                tesDraw[I] := 1
           else
                tesDraw[I] := 0;
            //showmessage(inttostr(tesDraw));
         end;

         //get platform activation
         dmTTT.GetPlatform_ActivationToPlatformInstance(TPlatform_Instance(SIMMgr.Platform_Insts[i]).FData.Platform_Instance_Index, fPlatformDeploytment.platformSelect);
         //set bitmap posision
         with fPlatformDeploytment.platformObj do
         begin
             Center.X := Round(fPlatformDeploytment.platformSelect.FActivation.Init_Position_Longitude);
             Center.Y := Round(fPlatformDeploytment.platformSelect.FActivation.Init_Position_Latitude);
         end;
         //platformList[I] := fPlatformDeploytment.platformObj;
     end;
     sumOfList := I;
end;   }

procedure TfrmScenario.btDeployPlatformsClick(Sender: TObject);
var
    nameOfMap, ENCGeoset : string;
    oriLat, oriLong, stringLat, stringLong : string;
    tesDraw : integer;
begin
  dmTTT.GetScenario(selectedScenario, Scenario);
  dmTTT.GetResourceAlloc(Scenario.FData.Resource_Alloc_Index, ResourceAllocation);
  dmTTT.GetGame_Environment_Definition(ResourceAllocation.FData.Game_Enviro_Index, GameEnvi);
  dmTTT.GetGame_Area_DefByID(GameEnvi.FData.Game_Area_Index, GameEnvi);

  nameOfMap := GameEnvi.FGameArea.Game_Area_Identifier;
  widthGameArea := GameEnvi.FGameArea.Game_X_Dimension;
  centreLong :=  GameEnvi.FGameArea.Game_Centre_Long;
  centreLatt := GameEnvi.FGameArea.Game_Centre_Lat;

  //getAvailablePlatform;

  if GameEnvi.FGameArea.Detail_Map = 'ENC' then
  begin
       fPlatformDeploytment.Map1.Geoset := '';
       ENCGeoset := ExtractFilePath(Application.ExeName) + 'mapsea\' + nameOfMap + '.gst';
       fPlatformDeploytment.LoadENC(ENCGeoset);
       uPlatformDeployment.fPlatformDeploytment.Map1.ZoomTo(widthGameArea, centreLong, centreLatt); //62
       if (GameEnvi.FGameArea.Game_Centre_Long <> 0) and (GameEnvi.FGameArea.Game_Centre_Lat <> 0) then
       begin
          fPlatformDeploytment.Map1.CenterX := GameEnvi.FGameArea.Game_Centre_Long;
          fPlatformDeploytment.Map1.CenterY := GameEnvi.FGameArea.Game_Centre_Lat;
       end;
       dmTTT.GetGame_Area_DefByID(GameEnvi.FData.Game_Area_Index, GameEnvi);
       uPlatformDeployment.fPlatformDeploytment.setCBScale;
       uPlatformDeployment.fPlatformDeploytment.cbSetScale.ItemIndex := uPlatformDeployment.fPlatformDeploytment.cbSetScale.Items.Count - 1;
       uPlatformDeployment.fPlatformDeploytment.cbSetScaleChange(Sender);
       uPlatformDeployment.fPlatformDeploytment.cbSetScale.Text := uPlatformDeployment.fPlatformDeploytment.cbSetScale.Items.Strings[uPlatformDeployment.fPlatformDeploytment.cbSetScale.Items.Count - 1];

  end
  else
  begin
      fPlatformDeploytment.createGeoset(nameOfMap);
      uPlatformDeployment.fPlatformDeploytment.setCBScale;
      uPlatformDeployment.fPlatformDeploytment.cbSetScale.ItemIndex := uPlatformDeployment.fPlatformDeploytment.cbSetScale.Items.Count - 1;
      uPlatformDeployment.fPlatformDeploytment.cbSetScaleChange(Sender);
      uPlatformDeployment.fPlatformDeploytment.cbSetScale.Text := uPlatformDeployment.fPlatformDeploytment.cbSetScale.Items.Strings[uPlatformDeployment.fPlatformDeploytment.cbSetScale.Items.Count - 1];

  end;

  fPlatformDeploytment.LoadPlatformInstanceAct;
  fPlatformDeploytment.Map1.Refresh;
  fPlatformDeploytment.Show;
end;

procedure TfrmScenario.btGroupsClick(Sender: TObject);
begin
 ForceChoose;
 fGroupSelect.Show;
end;

procedure TfrmScenario.btLinksClick(Sender: TObject);
begin
 LinkWindowForm.Show;
end;

procedure TfrmScenario.btOKClick(Sender: TObject);
begin
  //jika new
if isNew then
  begin
    Scenario.FData.Scenario_Identifier := edScenarioName.Text;
    insertScenario(scenario);
    isNew := false;
    btDeployPlatforms.Enabled := true;
    id_scenario := IntToStr(scenario.FData.Scenario_Index);
    id_resourceAlloc := scenario.FData.Resource_Alloc_Index;
  end
  else
  begin
    update;
  end;
  uPlatformDeployment.fPlatformDeploytment.Show;
  uPlatformDeployment.fPlatformDeploytment.Close;
  fAvailableScenario.Show;
  Self.Close;
end;

procedure TfrmScenario.btPreplayScenarioClick(Sender: TObject);
begin
 ShellExecute(Handle, 'open', PChar(getcurrentdir+'\tttSimClient.exe'), nil, nil, SW_SHOWNORMAL)
end;



procedure TfrmScenario.FormCreate(Sender: TObject);
begin
  Self.pcScenarioTabs.TabIndex := 1;
  scenario := TScenario_Definition.Create;
  ResourceAllocation := TResource_Allocation.Create;
  GameEnvi := TGame_Environment_Definition.Create;
end;

procedure TfrmScenario.FormShow(Sender: TObject);
begin
  Self.pcScenarioTabs.TabIndex := 0;

  if isNew then
    btDeployPlatforms.Enabled := false
  else if isNew = False then
    getDetailScenario;

end;

procedure TfrmScenario.getDetailScenario;
begin

  dmTTT.GetScenario(StrToInt(id_scenario),scenario);
  dmTTT.GetResourceAlloc(scenario.FData.Resource_Alloc_Index,ra);

  edResourceAllocation.Text := ra.FData.Allocation_Identifier;

end;

procedure TfrmScenario.ForceChoose;
var i:integer;
begin
  case rgforce.ItemIndex of
    0: force := 1;
    1: force := 2;
    2: force := 3;
    3: force := 4;
    4: force := 5;
    5: force := 6;

  end;

end;

end.
