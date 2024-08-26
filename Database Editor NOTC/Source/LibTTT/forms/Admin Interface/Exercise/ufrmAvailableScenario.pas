unit ufrmAvailableScenario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDBAssetObject, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmAvailableScenario = class(TForm)
    lbScenarioList: TListBox;
    btNew: TButton;
    btEdit: TButton;
    lbScenarioListIndex: TListBox;
    btCopy: TButton;
    btRemove: TButton;
    btUsage: TButton;
    btClose: TButton;
    btFilter: TButton;
    btnNew: TImage;
    btnCopy: TImage;
    btnEdit: TImage;
    btnUsage: TImage;
    btnDelete: TImage;
    procedure FormShow(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btCopyClick(Sender: TObject);
    procedure getScenario;
    procedure FormCreate(Sender: TObject);
    procedure btRemoveClick(Sender: TObject);
    procedure lbScenarioListClick(Sender: TObject);
    procedure btUsageClick(Sender: TObject);
    procedure lbScenarioListDblClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
    { Private declarations }
    procedure getDataScenario;
  public
    { Public declarations }

  end;

var
  frmAvailableScenario: TfrmAvailableScenario;
  scenarioList      : TList;
  id_scenario : string;
  scenario          : TScenario_Definition;

implementation

uses uSimDBEditor,ufrmSummaryScenario, uDataModuleTTT, uDBAsset_Deploy,
  uDBAsset_Cubicle, uDBFormation, ufrmUsage;

{$R *.dfm}

procedure TfrmAvailableScenario.btCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvailableScenario.btCopyClick(Sender: TObject);
begin
 if lbScenarioList.ItemIndex = -1 then
 begin
   Exit;
 end
 else begin
//  frmSummaryScenario.isCopy := True;
//  frmSummaryScenario.isNew := True;
  getDataScenario;
 end;

end;

procedure TfrmAvailableScenario.btEditClick(Sender: TObject);
begin
 //ambil nilai point scenario yg diload saja
 //CurrentClient := lstClients.Items.Objects [lstClients.ItemIndex] as TClient;
// frmSummaryScenario.isCopy := False;
 //id_scenario := lbScenarioListIndex.Items.Strings[lbScenarioList.ItemIndex];
 getDataScenario;
end;

procedure TfrmAvailableScenario.getDataScenario;
begin
//  with frmSummaryScenario do begin
//   isNew               := False;
//   id_scenario         := lbScenarioListIndex.Items.Strings[lbScenarioList.ItemIndex];
//   if isCopy then
//   begin
//      edScenarioName.Text := 'Copy Of ' + lbScenarioList.Items.Strings[lbScenarioList.ItemIndex];
//      isNew := True;
//      frmSummaryScenario.Apply.Enabled := true;
//   end
//   else begin
//      edScenarioName.Text := lbScenarioList.Items.Strings[lbScenarioList.ItemIndex];
//      frmSummaryScenario.Apply.Enabled := false;
//      edResourceAllocation.Text:=IntToStr(ResourceAllocation.FData.Resource_Alloc_Index);
//   end;
//   selectedScenario    := StrToInt(lbScenarioListIndex.Items.Strings[lbScenarioList.ItemIndex]);
//   Showmodal;
// end;
end;

procedure TfrmAvailableScenario.btNewClick(Sender: TObject);
begin
//  with frmSummaryScenario do begin
//    edScenarioName.Text := '[Noname]';
//    edResourceAllocation.Text := '[None]';
//    isNew := True;
//    btGroups.Enabled := False;
//    btLinks.Enabled  := False;
//
//    ShowModal;
//  end;
end;

procedure TfrmAvailableScenario.btRemoveClick(Sender: TObject);
var
  mList : TList;
  asset : TAsset_Deployment;
  cubicle : TCubicle_Group;
  I: Integer;
  warning: Integer;
begin
  if lbScenarioList.ItemIndex <> -1 then
  begin
    warning := MessageDlg('Are you sure you want to delete this item?',mtConfirmation,mbOKCancel,0);
    if warning = mrOK then
    begin
      mList := TList.Create;
      asset := TAsset_Deployment.Create;
      cubicle := TCubicle_Group.Create;
      dmTTT.GetAssetDeployment(StrToInt(lbScenarioListIndex.Items.Strings[lbScenarioList.ItemIndex]),asset);
      dmTTT.getAllCubicle_Groups(asset.FData.Deployment_Index, 0, mList, cubicle);
      for I := 0 to mList.Count - 1 do
      begin
        dmTTT.deleteCubicle_Group(IntToStr(TCubicle_Group(mList[I]).FData.Group_Index));
      end;
      mList.Clear;
      dmTTT.deleteAllLink_Part(IntToStr(asset.FData.Deployment_Index));
      dmTTT.deleteAllLink_Def(IntToStr(asset.FData.Deployment_Index));
      dmTTT.getFormationDefinition(asset.FData.Deployment_Index, mList);
      for I := 0 to mList.Count - 1 do
      begin
        dmTTT.deleteAllFormation_Assign(IntToStr(TFormation(mList[I]).FFormation_Def.Formation_Index));
        dmTTT.deleteFormation_Def(IntToStr(TFormation(mList[I]).FFormation_Def.Formation_Index));
      end;
      dmTTT.deletePlatformActivationByDeploy(IntToStr(asset.FData.Deployment_Index));
      dmTTT.DeleteAsset_Deployment_Definition(IntToStr(asset.FData.Deployment_Index));
      dmTTT.DeleteScenario_Definition(IntToStr(asset.FData.Scenario_Index));

      getScenario;
    end;
  end;
end;

procedure TfrmAvailableScenario.btUsageClick(Sender: TObject);
begin
  if lbScenarioList.ItemIndex <> -1 then begin
    with frmUsage do begin
      UIndex  := -1;
      ShowModal;
    end;
  end;
end;

procedure TfrmAvailableScenario.FormCreate(Sender: TObject);
begin
  scenarioList := Tlist.Create;
  scenario     := TScenario_Definition.Create;
end;

procedure TfrmAvailableScenario.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
  if GetKeyState(VK_ESCAPE)< 0 then
  begin
    case Msg.CharCode of
     VK_ESCAPE:
     begin
       btClose.Click;
     end;
    end;
  end;
end;

procedure TfrmAvailableScenario.FormShow(Sender: TObject);
begin
   getScenario;
   btEdit.Enabled := False;
   btCopy.Enabled := False;
   btRemove.Enabled := False;
   btUsage.Enabled  := False;
   btFilter.Enabled := False;

end;

procedure TfrmAvailableScenario.getScenario;
var I : integer;
begin

//get all scenario name
 uSimDBEditor.getPLatforms(scenarioList);

 lbScenarioList.Clear;
 lbScenarioListIndex.Clear;

 for I := 0 to scenarioList.Count - 1 do
 begin
  lbScenarioList.Items.Add(TScenario_Definition(scenarioList[i]).FData.Scenario_Identifier);
  lbScenarioListIndex.Items.Add(IntToStr(TScenario_Definition(scenarioList[I]).FData.Scenario_Index));
 end;

end;


procedure TfrmAvailableScenario.lbScenarioListClick(Sender: TObject);
begin
  btEdit.Enabled := True;
  btCopy.Enabled := True;
  btRemove.Enabled := True;
  btUsage.Enabled  := True;
end;

procedure TfrmAvailableScenario.lbScenarioListDblClick(Sender: TObject);
begin
  btEdit.Click;
end;

end.
