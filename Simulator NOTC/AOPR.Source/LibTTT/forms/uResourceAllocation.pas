unit uResourceAllocation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, uDBAssetObject,
  uDBAsset_GameEnvironment, uDBGame_Defaults, tttData, newClassASTT;

type
  TResourceAllocationForm = class(TForm)
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
    rbYellowPlatforms: TRadioButton;
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
    procedure btnApplyClick(Sender: TObject);
    procedure getRAData;

    procedure btnCommunicationResourcesClick(Sender: TObject);
    procedure btnStudentRoleListClick(Sender: TObject);
	procedure btnOverlaysResourcesClick(Sender: TObject);
    procedure btnRuntimePlatformLibrariesClick(Sender: TObject);


  private
    { Private declarations }
  public
 
    force,ra_id,ra_index  : Integer;
    isnew,isCopy,fromRA: boolean;
    ra: TResource_Allocation;
    GameEnviroDef : TGame_Environment_Definition;
    Default : TRecGame_Defaults;
    Role_List : TStudent_Role_List;

    procedure getRA;
    procedure getEnvironment;
    procedure getDefault;
    procedure EnableButton;
    { Public declarations }
  end;

var
  ResourceAllocationForm: TResourceAllocationForm;

implementation

uses uEnvironmentSelect,uGameDefaultSelect,uVehicleSelect,uMissileSelect,
uTorpedoSelect,uSonobuoySelect, uMineSelect, uSatelliteSelect, uReferencePointEditor,
uRAList,uDataModuleTTT, uSimDBEditor, uChannelComList, uOverlay,
  uOverlaySelectListForm, uStudentRoleList, uVehicleAttributeWindow,
  UfPlatformLibrary;


{$R *.dfm}

procedure TResourceAllocationForm.btnApplyClick(Sender: TObject);
begin
  if isNew then
  begin
    EnableButton;
    getData;
    dmTTT.insertResource(ra);
    isNew := False;
    fRAList.getResource;
  end
  else
  begin
    getData;
    dmTTT.updateResource(ra,IntToStr(ra.FData.Resource_Alloc_Index));
    fRAList.getResource;
  end;
end;

procedure TResourceAllocationForm.EnableButton;
begin
  btnVehicle.Enabled  := True;
  btnMissile.Enabled  := True;
  btnTorpedo.Enabled  := True;
  btnSonobuoy.Enabled := True;
  btnMine.Enabled     := True;
  btnSatelite.Enabled := True;
  btnRuntimePlatformLibraries.Enabled := True;
end;

procedure TResourceAllocationForm.btnBrowseDefaultsClick(Sender: TObject);
begin
  fGameDefaults.fromResaourceAlloc := true;
  fGameDefaults.fromCharacteristic := false;
  fGameDefaults.Show;
end;

procedure TResourceAllocationForm.btnBrowseEnvironmentClick(Sender: TObject);
begin
   fEnvironmentSelect.show;
end;

procedure TResourceAllocationForm.btnCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TResourceAllocationForm.btnCommunicationResourcesClick(
  Sender: TObject);
begin
  fChannelComList.Show;
end;

procedure TResourceAllocationForm.btnMineClick(Sender: TObject);
begin
  ForceChoose;
  fromRA := True;
  fMine.Show;
end;

procedure TResourceAllocationForm.btnMissileClick(Sender: TObject);
begin
  ForceChoose;
  fromRA := True;
  fMissileSelect.Show;
end;

procedure TResourceAllocationForm.btnOKClick(Sender: TObject);
var id:integer;
begin
  if isNew then
  begin
    getData;
    dmTTT.insertResource(ra);
  end
  else
  begin
    getData;
    if fRAList.RA_id = '' then
    begin
      dmTTT.GetMaxResource_Allocation(id);
      dmTTT.updateResource(ra,IntToStr(id));
    end
    else
      dmTTT.updateResource(ra,fRAList.RA_id);
  end;
  fRAList.getResource;
  Close;
end;

procedure TResourceAllocationForm.btnOverlaysResourcesClick(
  Sender: TObject);
begin
  //overlay
  fOverlaySelect.Show;
  //fOverlay.Show;
end;

procedure TResourceAllocationForm.getData;
var game_start : TDateTime;
begin
  with ra.FData do begin
    Allocation_Identifier  := edtName.Text;
    if fEnvironmentSelect.idEnvi <> '' then
      Game_Enviro_Index      := StrToInt(fEnvironmentSelect.idEnvi)
    else
      Game_Enviro_Index      := ra.FData.Game_Enviro_Index;

    if fGameDefaults.idGDSelected <> '' then
      Defaults_Index         := StrToInt(fGameDefaults.idGDSelected)
    else
      Defaults_Index         := ra.FData.Defaults_Index;

    if fStudentRole.idStudent <> '' then
      Role_List_Index        := StrToInt(fStudentRole.idStudent)
    else
      Role_List_Index        := ra.FData.Role_List_Index;
    game_start           := StrToDateTime(edtStartTime.Text);
    Game_Start_Time      := game_start;
    lbTextTime.Caption := FormatDateTime('ddd, dd mmmm yyyy hh:mm:ss', StrToDateTime(edtStartTime.Text));
  end;
end;

procedure TResourceAllocationForm.btnReferencePointsResourcesClick(
  Sender: TObject);
begin
  ReferencePointEditorForm.Show;
end;

procedure TResourceAllocationForm.btnRuntimePlatformLibrariesClick(
  Sender: TObject);
begin
  fPlatformLibraryDoublePickList.Show;
end;

procedure TResourceAllocationForm.btnSateliteClick(Sender: TObject);
begin
  ForceChoose;
  fromRA := True;
  fSatellite.Show;
end;

procedure TResourceAllocationForm.btnSonobuoyClick(Sender: TObject);
begin
  ForceChoose;
  fromRA := True;
  fSonobuoy.Show;
end;

procedure TResourceAllocationForm.btnStudentRoleListClick(Sender: TObject);
begin
  with fStudentRole do
  begin
    Show;
  end;
end;

procedure TResourceAllocationForm.btnTorpedoClick(Sender: TObject);
begin
  ForceChoose;
  fromRA := True;
  fTorpedo.Show;
end;

procedure TResourceAllocationForm.btnVehicleClick(Sender: TObject);
begin
  fVehicleSelect.fromRuntime := False;
  ForceChoose;
  fromRA := True;
  fVehicleAttributeWindow.fromVehicle := False;
  fVehicleSelect.Show;
end;

procedure TResourceAllocationForm.ForceChoose;
begin
  if rbRedPlatforms.Checked = true then
    begin
      force := 1;
    end
  else if rbYellowPlatforms.Checked = true then
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

procedure TResourceAllocationForm.ForceChooseResources;
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

procedure TResourceAllocationForm.FormCreate(Sender: TObject);
begin
  GameEnviroDef := TGame_Environment_Definition.Create;
  Role_List     := TStudent_Role_List.Create;
  ra            := TResource_Allocation.Create;
end;

procedure TResourceAllocationForm.FormShow(Sender: TObject);
begin
  getRAData;
  if isNew = False then
    EnableButton;
end;

procedure TResourceAllocationForm.getRA;
begin
  dmTTT.GetResourceAlloc(ra_id, ra);
end;

procedure TResourceAllocationForm.getEnvironment;
begin
  with SIMMgr do
  begin
    GetGame_Environment_Definition(ra.FData.Game_Enviro_Index, GameEnviroDef);
  end;
end;

procedure TResourceAllocationForm.getDefault;
begin
  dmTTT.GetGame_Defaults(ra.FData.Resource_Alloc_Index, Default);
end;

procedure TResourceAllocationForm.getRAData;
begin
  if isnew then
  begin
    ra := TResource_Allocation.Create;
    edtName.Text := '(noname)';
    //edtStartTime.Text := formatdatetime('dddd, dd mmmm yyyy',now);
    lbTextTime.Caption := formatdatetime('ddd, dd mmmm yyyy hh:mm:ss AM/PM',now);
    edtStartTime.Text := DateTimeToStr(now);
    edtEnvironment.Text := 'none';
    edtDefaults.Text := 'none';
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
      if isCopy then
        edtName.Text := 'Copy of '+ ra.FData.Allocation_Identifier
      else
        edtName.Text := ra.FData.Allocation_Identifier;
      //edtName.Text := ;
      //edtStartTime.Text := FormatDateTime('dddd, dd mmmm yyyy',Game_Start_Time);
      lbTextTime.Caption := formatdatetime('ddd, dd mmmm yyyy hh:mm:ss AM/PM', Game_Start_Time);
      edtStartTime.Text := DateTimeToStr(Game_Start_Time);

      getEnvironment;
      edtEnvironment.Text := GameEnviroDef.FData.Game_Enviro_Identifier;

      getDefault;
      edtDefaults.Text := Default.Defaults_Identifier;
    end;

  //edtStartTime.Text := FloatToStr(ra.FData.Game_Start_Time);

    getEnvironment;
    edtEnvironment.Text := GameEnviroDef.FData.Game_Enviro_Identifier;

    getDefault;
    edtDefaults.Text := Default.Defaults_Identifier;
  end;
end;



end.
