unit uAvailableScenario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, newClassASTT;

type
  TfAvailableScenario = class(TForm)
    lbScenarioList: TListBox;
    btNew: TButton;
    btEdit: TButton;
    lbScenarioListIndex: TListBox;
    btCopy: TButton;
    btRemove: TButton;
    btUsage: TButton;
    btClose: TButton;
    btFilter: TButton;
    procedure FormShow(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btCopyClick(Sender: TObject);
    procedure getScenario;
    procedure FormCreate(Sender: TObject);
    procedure btRemoveClick(Sender: TObject);
    procedure lbScenarioListClick(Sender: TObject);
  private
    { Private declarations }
    procedure getDataScenario;
  public
    { Public declarations }

  end;

var
  fAvailableScenario: TfAvailableScenario;
  scenarioList      : TList;
  id_scenario : string;
  scenario          : TScenario_Definition;

implementation

uses uSimDBEditor,ufScenario, uDataModuleTTT;

{$R *.dfm}

procedure TfAvailableScenario.btCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfAvailableScenario.btCopyClick(Sender: TObject);
begin
  frmScenario.isCopy := True;
  getDataScenario;
end;

procedure TfAvailableScenario.btEditClick(Sender: TObject);
begin
 //ambil nilai point scenario yg diload saja
 //CurrentClient := lstClients.Items.Objects [lstClients.ItemIndex] as TClient;
 frmScenario.isCopy := False;
 //id_scenario := lbScenarioListIndex.Items.Strings[lbScenarioList.ItemIndex];
 getDataScenario;
end;

procedure TfAvailableScenario.getDataScenario;
begin
  with frmScenario do begin
   isNew               := False;
   id_scenario         := lbScenarioListIndex.Items.Strings[lbScenarioList.ItemIndex];
   if isCopy then
      edScenarioName.Text := 'Copy Of ' + lbScenarioList.Items.Strings[lbScenarioList.ItemIndex]
   else
    edScenarioName.Text := lbScenarioList.Items.Strings[lbScenarioList.ItemIndex];
   selectedScenario    := StrToInt(lbScenarioListIndex.Items.Strings[lbScenarioList.ItemIndex]);
   Show;
 end;
end;

procedure TfAvailableScenario.btNewClick(Sender: TObject);
begin
  with frmScenario do begin
    edScenarioName.Text := '';
    edResourceAllocation.Text := '';
    isNew := true;
    Show;
  end;
  close;
end;

procedure TfAvailableScenario.btRemoveClick(Sender: TObject);
begin
  dmTTT.DeleteScenario_Definition(lbScenarioListIndex.Items.Strings[lbScenarioList.ItemIndex]);
  getScenario;
end;

procedure TfAvailableScenario.FormCreate(Sender: TObject);
begin
  scenarioList := Tlist.Create;
  scenario     := TScenario_Definition.Create;
end;

procedure TfAvailableScenario.FormShow(Sender: TObject);
begin
   getScenario;
   btEdit.Enabled := False;
   btCopy.Enabled := False;
   btRemove.Enabled := False;
   btUsage.Enabled  := False;
   btFilter.Enabled := False;

end;

procedure TfAvailableScenario.getScenario;
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



procedure TfAvailableScenario.lbScenarioListClick(Sender: TObject);
begin
  btEdit.Enabled := True;
  btCopy.Enabled := True;
  btRemove.Enabled := True;
  btUsage.Enabled  := True;
end;

end.
