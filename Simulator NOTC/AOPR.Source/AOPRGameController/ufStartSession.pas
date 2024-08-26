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
    procedure lvSnapshotChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure lvRecordedChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure lvScenarioSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    { Private declarations }
    FSceneData: TList;
  public
    { Public declarations }

    SelectedSCID  : integer;
    SelectedName  : string;

    SelectedSnapshotDisplayName  : string;
    SelectedSnapshotFileName  : string;
    SelectedRecsDisplayName  : string;

    procedure DisplaySenarioList;
    procedure ClearScenarioList;

    function StartExcerciseSession(var i: integer): boolean;

  end;

var
  frmStartSession: TfrmStartSession;


implementation
// uDataModuleTTT

uses
  ufStartExerciseWizard, uLibSettingTTT, uDMGC, uSRRFunction, DateUtils ;

{$R *.dfm}

procedure TfrmStartSession.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmStartSession.btnOKClick(Sender: TObject);
begin
  if lvScenario.ItemIndex > -1 then
  begin
    Close;
    ModalResult := mrOK;
  end
  else
  begin
     ShowMessage('Select Scenario');
  end;

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
    function compareByName(Item1 : Pointer; Item2 : Pointer) : Integer;
    var
      FData1, FData2 : TScenarioInfo;
    begin
      FData1 := TScenarioInfo(Item1);
      FData2 := TScenarioInfo(Item2);
      // Now compare by string
      if  FData1.Scenario_Identifier > FData2.Scenario_Identifier then
          Result := 1
      else if FData1.Scenario_Identifier = FData2.Scenario_Identifier then
          Result := 0
      else
          Result := -1;
    end;

var i : integer;
    li: TListItem;
    scInfo : TScenarioInfo;

    snInfo : TSnapshotInfo;
    rcInfo : TRecsInfo ;
    lInfo  : TList ;

    mScenario_Identifier   : string;
    mResource_Alloc_Index  : Integer ;

begin

  FSceneData := TList.Create;
  dmGC.GetScenarioListFromDB(FSceneData);

  ClearScenarioList;

  lInfo := TList.Create;
  dmGC.GetRecordListFromDB(FSceneData);

//  AddAllRecsListInfo(GetRecsDir,lInfo);
//  for i := 0 to lInfo.Count - 1 do begin
//      rcInfo := lInfo.Items[i] ;
//      scInfo := TScenarioInfo.Create;
//      scInfo.Scenario_Index       := rcInfo.HInfo.Scenario_Index  ;
//      dmGC.Get_Identifier_And_Resource_Alloc_Index(scInfo.Scenario_Index,
//           mScenario_Identifier, mResource_Alloc_Index);
//      scInfo.Scenario_Identifier   := mScenario_Identifier +' - '+ rcInfo.FDisplayName ;
//      scInfo.Resource_Alloc_Index  := mResource_Alloc_Index ;
//      scInfo.Records_FileName      := rcInfo.FDisplayName;
//      if YearOf(rcInfo.FDateTime) > 1900 then
//        scInfo.SDateTime           := FormatDateTime('YYYY-MM-DD HH:MM:SS',rcInfo.FDateTime)
//      else
//        scInfo.SDateTime           := '';
//      FSceneData.Add(scInfo);
//  end;

  lInfo.Clear;
  AddAllScenarioListInfo(GetSnapshotDir,lInfo);
  for i := 0 to lInfo.Count - 1 do begin
      snInfo := lInfo.Items[i] ;
      scInfo := TScenarioInfo.Create;
      scInfo.Scenario_Index       := snInfo.HInfo.Stream.ScenarioID ;
      dmGC.Get_Identifier_And_Resource_Alloc_Index(scInfo.Scenario_Index, mScenario_Identifier, mResource_Alloc_Index);
      scInfo.Scenario_Identifier   := mScenario_Identifier+'-'+snInfo.FDisplayName;
      scInfo.Resource_Alloc_Index  := mResource_Alloc_Index ;
      scInfo.Snapshot_FileName     := GetSnapshotNameWithOutExt(ExtractFileName(snInfo.FFullName));
      if YearOf(snInfo.FDateTime) > 1900 then
        scInfo.SDateTime           := UpperCase(FormatDateTime('YYYY-MM-DD HH:MM:SS',snInfo.FDateTime))
      else
        scInfo.SDateTime           := '';
     FSceneData.Add(scInfo);
  end;
  lInfo.Free;

  FSceneData.Sort(@compareByName);

  for i := 0 to FSceneData.Count - 1 do begin
    scInfo := FSceneData.Items[i];

    li := lvScenario.Items.Add;
    li.Caption := scInfo.Scenario_Identifier;
    if Length(scInfo.Records_FileName) > 0 then
       li.SubItems.Add(' Replay')
    else if Length(scInfo.Snapshot_FileName) > 0 then
       li.SubItems.Add(' Snapshot')
    else
       li.SubItems.Add(' Scenario');
    if Length(Trim(scInfo.SDateTime))> 0 then
       li.SubItems.Add(scInfo.SDateTime)
    else
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
  Result := True;
end;

procedure TfrmStartSession.lvRecordedChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
var
  recInfo : TRecsInfo ;
begin
  if (item <> nil) and (item.Data <> nil) then begin
    recInfo := item.Data;
    SelectedRecsDisplayName := recInfo.FDisplayName;
  end
  else
    SelectedRecsDisplayName := '';
end;

procedure TfrmStartSession.lvScenarioChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
var  scInfo : TScenarioInfo;
begin
  if (item <> nil) and (item.Data <> nil) then begin
    scInfo := item.Data;

    SelectedName := scInfo.Scenario_Identifier;
    SelectedSCID := scInfo.Scenario_Index;
    SelectedRecsDisplayName := '';
    SelectedSnapshotDisplayName := '';
    SelectedSnapshotFileName := '';
    if Length( scInfo.Records_FileName )>0 then
       SelectedRecsDisplayName := scInfo.Records_FileName
    else
    if Length( scInfo.Snapshot_FileName )>0 then begin
       SelectedSnapshotDisplayName := scInfo.Scenario_Identifier ;
       SelectedSnapshotFileName    := scInfo.Snapshot_FileName ;
    end;

    //CeckSnapshotList;
    //CeckRecordedList;
    //sl.Free;

  end;

end;

procedure TfrmStartSession.lvScenarioSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if Selected then
    btnOK.Enabled := True
  else
    btnOK.Enabled := False;
end;

procedure TfrmStartSession.lvSnapshotChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
var
  snInfo : TSnapshotInfo ;
begin
  if (item <> nil) and (item.Data <> nil) then begin
    snInfo := item.Data;
    SelectedSnapshotDisplayName := snInfo.FDisplayName;
  end
  else
    SelectedSnapshotDisplayName := '';
end;

end.
