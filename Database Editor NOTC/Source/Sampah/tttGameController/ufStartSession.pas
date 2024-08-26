unit ufStartSession;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, ZConnection, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type


  TfrmStartSession = class(TForm)
    lvScenario: TListView;
    Panel1: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure lvScenarioChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    FSceneData: TList;
  public
    { Public declarations }

    SelectedSCID  : integer;
    SelectedName  : string;

    procedure DisplaySenarioList;
    procedure ClearScenarioList;

    function StartExcerciseSession(var i: integer): boolean;

  end;

var
  frmStartSession: TfrmStartSession;


implementation
// uDataModuleTTT

uses
  ufStartExerciseWizard, uLibSettingTTT, uDMGC;

{$R *.dfm}

procedure TfrmStartSession.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmStartSession.btnOKClick(Sender: TObject);
//var
begin
  if lvScenario.ItemIndex > -1 then begin
    Close;
    ModalResult := mrOK;
  end
  else
     ModalResult := mrCancel;
end;

procedure TfrmStartSession.ClearScenarioList;
var i: integer;
    li: TListItem;
    scInfo : TScenarioInfo;
begin
  for i := 0 to lvScenario.Items.Count - 1 do  begin
    li := lvScenario.Items[i];
    scInfo := li.Data;
    if scInfo <> nil then
      scInfo.Free;
  end;
  lvScenario.Items.Clear;

end;

procedure TfrmStartSession.DisplaySenarioList;
var i: integer;
    li: TListItem;
    scInfo : TScenarioInfo;
begin
  FSceneData := TList.Create;
  dmGC.GetSenarioListFromDB(FSceneData);

  ClearScenarioList;

  for i := 0 to FSceneData.Count - 1 do begin
    scInfo := FSceneData.Items[i];

    li := lvScenario.Items.Add;
    li.Caption := scInfo.Scenario_Identifier;
    li.SubItems.Add(' Scenario');
    li.SubItems.Add( '');
    li.SubItems.Add( '');
//      li.SubItems.Add(IntToStr(scInfo.Scenario_Index));
//    li.SubItems.Add(IntToStr(scInfo.Resource_Alloc_Index));

    li.Data := scInfo;
  end;

  FSceneData.Clear;
  FSceneData.Free;
end;

procedure TfrmStartSession.FormCreate(Sender: TObject);
begin
//  show;
// load dbsetting from file,

end;

function TfrmStartSession.StartExcerciseSession(var i: integer): boolean;
begin
{
}
end;

procedure TfrmStartSession.lvScenarioChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
var  scInfo: TScenarioInfo;
begin
  if (item <> nil) and (item.Data <> nil) then begin
    scInfo := item.Data;

    SelectedName := scInfo.Scenario_Identifier;
    SelectedSCID := scInfo.Scenario_Index;
  end;

end;

end.
