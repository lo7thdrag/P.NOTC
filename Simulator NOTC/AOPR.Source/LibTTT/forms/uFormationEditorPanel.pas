unit uFormationEditorPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ToolWin, ImgList,
  uDBFormation, uT3Vehicle, uGameData_TTT, System.ImageList;

type
  TfrmFormationEditorPanelForm = class(TForm)
    Panel2: TPanel;
    lblName: TStaticText;
    edtName: TEdit;
    lblForce: TStaticText;
    edtForce: TEdit;
    cbAbsolute: TCheckBox;
    Panel1: TPanel;
    btnCancel: TButton;
    btnOK: TButton;
    StaticText1: TStaticText;
    ImageList1: TImageList;
    lstPlatformSelectedIndex: TListBox;
    lstPlatformSelected: TListBox;
    cbLeader: TComboBox;
    Label1: TLabel;

    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbLeaderChange(Sender: TObject);

  private
    //procedure SetPlatformLeader(const Value: TT3Vehicle);
    procedure EmptyRec(var rec : TRecEditFormation);
    { Private declarations }

  public
    isNew: boolean;
    idFormationSelected: Integer;
    idSelectedPlatformToUpdate: string;
    PlatformLeader   : TT3Vehicle;

    function isSelectedIndex(const indexPlatform:Integer) : Boolean;
    //property PlatformLeader : TT3Vehicle read FPlatformLeader write SetPlatformLeader;
    { Public declarations }

  end;

var
  frmFormationEditorPanelForm: TfrmFormationEditorPanelForm;

implementation

uses
  uSimMgr_Client, uFormationEditorForm, ufTacticalDisplay, uT3Unit;

{$R *.dfm}

procedure TfrmFormationEditorPanelForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFormationEditorPanelForm.btnOKClick(Sender: TObject);
var
  i : Integer;
  rec : TRecEditFormation;
  form : TFormation;
  fm,fm2 : TFormationRefine;
  found : Boolean;
  leaderFormation : TT3Vehicle;
begin
  EmptyRec(rec);

  rec.FormationID := idFormationSelected;
  rec.FormationName := edtName.Text;

  leaderFormation := TT3Vehicle(cbLeader.Items.Objects[cbLeader.ItemIndex]);
  rec.Force  := leaderFormation.Force_Designation;

  if Assigned(leaderFormation) then
    rec.FormationLeader := leaderFormation.InstanceIndex
  else
  begin
    frmTacticalDisplay.addStatus('Leader Formation is not valid');
    Exit;
  end;

  if isNew then
  begin
    // Add New Formation
    // refine version
    found := simMgrClient.Scenario.Formation_List_rev.FormationNameExist(rec.FormationName);

    if found then
    begin
      frmTacticalDisplay.addStatus('Formation name is already in use');
    end
    else
    begin
      rec.OrderID := CORD_ID_AddForm;
      rec.AngelType := 0;

      if Assigned(simMgrClient.Scenario.AssetDeployment) then
        rec.DeploymentId := simMgrClient.Scenario.AssetDeployment.FData.Deployment_Index
      else
        rec.DeploymentId := 0;

      simMgrClient.netSend_CmdEditFormation(rec);
      Close;
    end;

  end
  else
  begin
    // Edit Formation
    // refine
    fm := simMgrClient.Scenario.Formation_List_rev.FormationByIndex(idFormationSelected);
    fm2 := simMgrClient.Scenario.Formation_List_rev.FormationByName(rec.FormationName);

    if Assigned(fm2) and (fm2.FFormation_Def.Formation_Index <> idFormationSelected) then
    begin
      frmTacticalDisplay.addStatus('Formation name is already in use');
      Exit;
    end;

    if Assigned(fm) then
    begin
      rec.OrderID := CORD_ID_EditForm;
      rec.AngelType := fm.FFormation_Def.Angle_Type;

      simMgrClient.netSend_CmdEditFormation(rec);
    end
    else
    begin
      frmTacticalDisplay.addStatus('Formation not defined');
    end;

    Close;
  end;
end;

procedure TfrmFormationEditorPanelForm.cbLeaderChange(Sender: TObject);
var
  leaderFormation : TT3Vehicle;
begin
  if cbLeader.ItemIndex >= 0 then
  begin
    leaderFormation := TT3Vehicle(cbLeader.Items.Objects[cbLeader.ItemIndex]);
    case leaderFormation.Force_Designation of
      1: edtForce.Text  := 'Red';
      2: edtForce.Text  := 'Amber';
      3: edtForce.Text  := 'Blue';
      4: edtForce.Text  := 'Green';
      6: edtForce.Text  := 'No Force';
    end;
  end;
end;

procedure TfrmFormationEditorPanelForm.FormShow(Sender: TObject);
var
  i : Integer;
  aObject : TT3PlatformInstance;
  ve: TT3Vehicle;
  name: string;
  index: Integer;
begin

  if not isNew then
    cbLeader.Enabled := False
  else
    cbLeader.Enabled := True;

  if Assigned(PlatformLeader) then
  begin
    case PlatformLeader.Force_Designation of
      1: edtForce.Text  := 'Red';
      2: edtForce.Text  := 'Amber';
      3: edtForce.Text  := 'Blue';
      4: edtForce.Text  := 'Green';
      6: edtForce.Text  := 'No Force';
    end;
  end;

  cbLeader.Clear;
  for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
  begin
    aObject := simMgrClient.SimPlatforms.getObject(i) as TT3PlatformInstance;
    if not Assigned(aObject) then
      continue;

    if not(aObject is TT3Vehicle) then
      Continue;

    ve := TT3Vehicle(aObject);
    if ve.FreeMe then
       Continue;

    if simMgrClient.Scenario.Formation_List_rev.PlatformExistInFormation(ve.InstanceIndex) then
    begin
      if Assigned(PlatformLeader) then
      begin
        if PlatformLeader.InstanceIndex <> ve.InstanceIndex then
          Continue;
      end
      else
        Continue;
    end;

    name := ve.InstanceName;
    cbLeader.Items.AddObject(name, ve);
  end;

  // Mencari index-nya di cmbLeader
  if Assigned(PlatformLeader) then
  begin
    index := -1;
    for i := 0 to cbLeader.Items.Count - 1 do
    begin
      if TT3Vehicle(cbLeader.Items.Objects[i]).InstanceIndex
         = PlatformLeader.InstanceIndex then
      begin
        index := i;
      end;
    end;

    if cbLeader.Items.Count > 0 then
    begin
      cbLeader.ItemIndex := index
    end;
  end else
  begin
    if cbLeader.Items.Count > 0 then
    begin
      index := 0;
      cbLeader.ItemIndex := index;
    end;
  end;
end;

function TfrmFormationEditorPanelForm.isSelectedIndex(const indexPlatform:Integer) : Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := 0 to lstPlatformSelectedIndex.Count - 1 do
  begin
     if (StrToInt(lstPlatformSelectedIndex.Items.Strings[I]) = indexPlatform) then
     begin
       Result := true;
     end;
  end;
end;

procedure TfrmFormationEditorPanelForm.EmptyRec(var rec : TRecEditFormation);
begin
  with rec do
  begin
    SessionID       := 0;
    OrderID         := 0;
    FormationID     := 0;
    FormationName   := '';
    FormationLeader := 0;
    AngelType       := 0;
    Force           := 0;
    DeploymentId    := 0;

    MemberId        := 0;
    MemberBearing   := 0;
    MemberRange     := 0;
    MemberAltitude  := 0;
  end;
end;

end.
