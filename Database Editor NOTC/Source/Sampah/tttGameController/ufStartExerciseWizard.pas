unit ufStartExerciseWizard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Menus, uT3GroupList;

type

  TfrmStartExerciseWizard = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    pnlExerciseName: TPanel;
    pnlRecordOption: TPanel;
    pnlCubicleMapping: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edExerciseName: TEdit;
    rbtnRecordYes: TRadioButton;
    rbtnRecordNo: TRadioButton;
    Label3: TLabel;
    gbAudioOption: TGroupBox;
    Panel2: TPanel;
    Bevel2: TBevel;
    btnAddAudio: TButton;
    btnRemoveAudio: TButton;
    btnClearAudio: TButton;
    tvAudioOption: TTreeView;
    Panel3: TPanel;
    Bevel3: TBevel;
    btnAudio_Next: TButton;
    btnAudio_Cancel: TButton;
    btnExcName_Cancel: TButton;
    btnExcName_Next: TButton;
    Panel4: TPanel;
    Bevel4: TBevel;
    btnMapping_Finish: TButton;
    btnMapping_Cancel: TButton;
    btnMapping_Back: TButton;
    tvMapping: TTreeView;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    btnMapToControllers: TButton;
    btnClearAllConfig: TButton;
    btnAudio_Back: TButton;
    pmAssignt: TPopupMenu;
    mnAssign1: TMenuItem;
    Clear1: TMenuItem;
    procedure btnExcName_CancelClick(Sender: TObject);
    procedure btnExcName_NextClick(Sender: TObject);
    procedure btnAudio_BackClick(Sender: TObject);
    procedure btnAudio_NextClick(Sender: TObject);
    procedure btnMapping_BackClick(Sender: TObject);
    procedure btnMapping_FinishClick(Sender: TObject);
    procedure btnAddAudioClick(Sender: TObject);
    procedure btnRemoveAudioClick(Sender: TObject);
    procedure rbtnRecordYesClick(Sender: TObject);
    procedure rbtnRecordNoClick(Sender: TObject);
    procedure btnClearAudioClick(Sender: TObject);
    procedure tvMappingChange(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tvMappingContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure btnMapToControllersClick(Sender: TObject);
    procedure btnClearAllConfigClick(Sender: TObject);
    procedure Clear1Click(Sender: TObject);

  private
    DefExcName: string;
    FPairCounter: integer;
    FScenarioID: integer;

    FGroupList: T3GroupList;
    FCubicleList : TStringList;

    FNodeAssign: TTreeNode;
    FControllerName : string;
    FGList: TList;

    function getExerciseName: string;
    procedure setExerciseName(const s: string);
    { Private declarations }

    procedure PrepareRecordOption;
    procedure PrepareAssignment;

    procedure menuAssignClick(Sender: TObject);

    function IsAllAssigned: Boolean;
  public
    prevForm : TForm;
    stateCanceled : boolean;
    stateFinished : boolean;

    recording: boolean;
    selectedPlatform: Integer;
    { Public declarations }

    procedure EventOnReceiveOnlineList(Sender: TObject);
    function StartNewExercise(const scID: integer): boolean;

    procedure SendAllAssignment;

    property ExerciseName: string read getExerciseName write setExerciseName;

  end;

var
  frmStartExerciseWizard: TfrmStartExerciseWizard;

implementation

uses
  uNetSessionClient, uNetSessionData,
  ufStartSession, uDMGC, uLibSettingTTT;

{$R *.dfm}

procedure TfrmStartExerciseWizard.PrepareRecordOption;
begin
  rbtnRecordNo.Checked := true;
  rbtnRecordNoClick(rbtnRecordNo);
end;

procedure TfrmStartExerciseWizard.rbtnRecordNoClick(Sender: TObject);
begin

  btnAddAudio.Enabled     := false;
  btnRemoveAudio.Enabled  := false;
  btnClearAudio.Enabled   := false;

  FPairCounter := 1;
  tvAudioOption.Items.Clear;
end;

procedure TfrmStartExerciseWizard.rbtnRecordYesClick(Sender: TObject);
begin
  btnAddAudio.Enabled := true;
  btnRemoveAudio.Enabled  := false;
  btnClearAudio.Enabled   := false;
end;


procedure TfrmStartExerciseWizard.btnExcName_CancelClick(Sender: TObject);
begin
  stateCanceled := true;
  Close;
  if prevForm <> nil then
    prevForm.Show;

end;

procedure TfrmStartExerciseWizard.btnExcName_NextClick(Sender: TObject);
var i, j: integer;
    s: string;
begin
  s := edExerciseName.Text;
  j := 0;
  for i := 1 to Length(s) do
    if s[i]  in  ['\', '/', '.', '"', ':','*','?','<','>','|'] then
       inc(j);
  if j = 0 then
    pnlRecordOption.BringToFront
  else begin
    edExerciseName.Text := DefExcName;
    edExerciseName.SelectAll;
    edExerciseName.SetFocus;
  end;
end;

procedure TfrmStartExerciseWizard.btnAddAudioClick(Sender: TObject);
var nFirst,
    nPair, nMember: TTreeNode;
begin

  if tvAudioOption.Items.Count < 12 then begin
    nFirst := tvAudioOption.Items.GetFirstNode;
    nPair := tvAudioOption.Items.Add(nFirst, 'Audio Track - Pair '
      + IntToStr(FPairCounter) );

    nMember := tvAudioOption.Items.AddChild(nPair, 'Audio Track 1' );
    nMember := tvAudioOption.Items.AddChild(nPair, 'Audio Track 2' );

    inc(FPairCounter);

    if tvAudioOption.Items.Count >= 12 then
      btnAddAudio.Enabled := false;

    btnRemoveAudio.Enabled  := true;
    btnClearAudio.Enabled   := true;
  end;

end;

procedure TfrmStartExerciseWizard.btnRemoveAudioClick(Sender: TObject);
var nSel : TTreeNode;
    maxC : integer;
begin
  maxC := tvAudioOption.Items.Count-1;
  if maxC < 0 then begin
    exit;
    btnRemoveAudio.Enabled  := false;
    btnClearAudio.Enabled   := false;
  end;

  nSel := tvAudioOption.Items.Item[maxC];
  if (nSel <> nil) and (nSel.Parent <> nil) then begin
    tvAudioOption.Items.Delete(nSel.Parent);

    if tvAudioOption.Items.Count = 0 then
       btnRemoveAudio.Enabled := false;
    Dec(FPairCounter);

    btnAddAudio.Enabled := true;
  end;

end;



procedure TfrmStartExerciseWizard.btnAudio_BackClick(Sender: TObject);
begin
  pnlExerciseName.BringToFront;
end;

procedure TfrmStartExerciseWizard.PrepareAssignment;
var i, j: integer;
    lPi : TList;
    gInfo: TGroupInfo;
    pInfo : TDeployedPlatformInfo;
    fNode, node: TTreeNode;
begin
  tvMapping.Items.Clear;
  fNode := tvMapping.Items.GetFirstNode;
  fNode := tvMapping.Items.AddChild(fNode, edExerciseName.Text);

  FGList.Clear;
  lPi := TList.Create;

  dmGC.GetGroupList(FScenarioID, FGList);
  for i := 0 to FGList.Count - 1 do begin
    gInfo := FGList.Items[i];
    node := tvMapping.Items.AddChildObject(fNode, gInfo.Group_Identifier, gInfo);

    dmGC.GetGroupMember(gInfo.Group_Index, lPi);
    for j := 0 to lPi.Count - 1 do begin
      pInfo :=  lPI.Items[j];
      tvMapping.Items.AddChildObject(node, pInfo.Instance_Name, pInfo);
    end;
  end;
  fNode.Expand(false);
  lPi.Free;

  btnMapping_Finish.Enabled := False;
end;

procedure TfrmStartExerciseWizard.btnAudio_NextClick(Sender: TObject);
begin
  PrepareAssignment;
  pnlCubicleMapping.BringToFront;
end;

procedure TfrmStartExerciseWizard.btnClearAllConfigClick(Sender: TObject);
begin
  PrepareAssignment;
end;

procedure TfrmStartExerciseWizard.btnClearAudioClick(Sender: TObject);
begin
  tvAudioOption.Items.Clear;
  btnAddAudio.Enabled     := true;
  btnRemoveAudio.Enabled  := false;
  btnClearAudio.Enabled   := false;
end;

procedure TfrmStartExerciseWizard.btnMapping_BackClick(Sender: TObject);
begin
  pnlRecordOption.BringToFront;
end;

procedure TfrmStartExerciseWizard.btnMapping_FinishClick(Sender: TObject);
begin
  stateFinished := true;
  SendAllAssignment;

  Close;
end;

procedure TfrmStartExerciseWizard.EventOnReceiveOnlineList(Sender: TObject);
var i, j: integer;
    ss: TStrings;
    s, cub: string;
    mn : TMenuItem;
begin
  ss := sender as TStringList;
  pmAssignt.Items[0].Clear;
  FCubicleList.Clear;
  FControllerName := '';

  for I := 0 to ss.Count - 1 do  begin
    s := ss[i];
    cub := FGroupList.GetCubicleName(s);
    if FGroupList.IsController(s) then
       FControllerName := cub;

    if cub <> '' then begin
      if not FCubicleList.Find(cub, j) then
        FCubicleList.Add(cub);
    end;
  end;

  for I := 0 to FCubicleList.Count - 1 do  begin
    mn := TMenuItem.Create(self);

    mn.Caption := FCubicleList[i];
    mn.Hint := FCubicleList[i];

    pmAssignt.Items[0].Add(mn);
    mn.OnClick := menuAssignClick;
  end;

end;

procedure TfrmStartExerciseWizard.FormCreate(Sender: TObject);
begin
  FGroupList := T3GroupList.Create;
  FCubicleList := TStringList.Create;
  FCubicleList.Sorted := true;

  FGList := TList.Create;
end;

procedure TfrmStartExerciseWizard.FormDestroy(Sender: TObject);
begin
  FGroupList.Free;
  FGList.Free;

  FCubicleList.Free;
end;

function TfrmStartExerciseWizard.getExerciseName: string;
begin
  result := edExerciseName.Text;
end;

procedure TfrmStartExerciseWizard.setExerciseName(const s: string);
begin
  DefExcName := s;
  edExerciseName.Text := s;
end;


function TfrmStartExerciseWizard.StartNewExercise(const scID: integer): boolean;
begin
  stateCanceled := false;
  stateFinished := false;

  FScenarioID := scID;

  PrepareRecordOption;
  PrepareAssignment;

  FGroupList.LoadFromFile(vGameDataSetting.GroupSetting);
  FCubicleList.Clear;

  pnlExerciseName.BringToFront;
  ShowModal;
  result := stateFinished;

end;

procedure TfrmStartExerciseWizard.tvMappingChange(Sender: TObject;
  Node: TTreeNode);
var  pInfo : TDeployedPlatformInfo;
begin
  if node = nil then exit;

  if node.Level = 2  then begin
     pInfo := node.Data;
     if pInfo <> nil then begin

       selectedPlatform :=  pInfo.Platform_Instance_Index;
     end;
  end;

end;

procedure TfrmStartExerciseWizard.tvMappingContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  FNodeAssign := tvMapping.Selected;
  if FNodeAssign = nil then Exit;
  if (FNodeAssign.Level < 1) or (FNodeAssign.Level>2)  then begin
    mnAssign1.Enabled := False;
    FNodeAssign := nil;
    exit;
  end;

  mnAssign1.Enabled := true;
  if tvMapping.Selected.Level = 1  then
    FNodeAssign := tvMapping.Selected
  else if tvMapping.Selected.Level = 2  then
    FNodeAssign := tvMapping.Selected.Parent;

end;

procedure TfrmStartExerciseWizard.menuAssignClick(Sender: TObject);
var gInfo : TGroupInfo;
    mn : TMenuItem;
begin
  if FNodeAssign = nil then Exit;
  mn := sender as TMenuItem;
  gInfo := FNodeAssign.Data;
  if gInfo <> nil then begin
    gInfo.CubicleName := mn.Hint;
    FNodeAssign.Text := gInfo.Group_Identifier + ' ( ' + gInfo.CubicleName + ' )';
    if IsAllAssigned then
      btnMapping_Finish.Enabled := True;
  end;

end;
procedure TfrmStartExerciseWizard.Clear1Click(Sender: TObject);
var gInfo : TGroupInfo;
begin
  if FNodeAssign = nil then Exit;
  gInfo := FNodeAssign.Data;
  if gInfo <> nil then begin
    gInfo.CubicleName := '';
    FNodeAssign.Text := gInfo.Group_Identifier;
    btnMapping_Finish.Enabled := false;
  end;
end;

function TfrmStartExerciseWizard.IsAllAssigned: Boolean;
var i: Integer;
    g: TGroupInfo;
    c: Integer;
begin
  c := 0;
  for I := 0 to FGList.Count - 1 do  begin
    g := FGList[i];
    if g.CubicleName <> '' then
      Inc(c);
  end;
  result := (c <> 0) and (c = FGList.Count);
end;

procedure TfrmStartExerciseWizard.btnMapToControllersClick(Sender: TObject);
var i: Integer;
    g: TGroupInfo;
    t: TTreeNode;
begin
  for I := 0 to tvMapping.Items.Count-1 do  begin
    t := tvMapping.Items.Item[i];
    if t.Level = 1  then begin
      g := t.Data ;
      if g.CubicleName = ''  then begin

        g.CubicleName := FControllerName;
        t.Text := g.Group_Identifier + ' ( '+ FControllerName + ' )';
      end;
    end;
  end;

  btnMapping_Finish.Enabled := True;
end;

procedure TfrmStartExerciseWizard.SendAllAssignment;
var i, j, k : Integer;
    g       : TGroupInfo;
    cub     : TCubicleInfo;
    assG    : TAssignGroup;
    ipAdd   : string;
    ssIP    : TStringList;

begin
  theClient.SendCubicleAssign('0.0.0.0', CMD_ASSIGN_CLEAR, 0);

  ssIP := TStringList.Create;
  ssIP.Sorted := True;
  // building index  of shipment.
  for I := 0 to FGList.Count - 1 do  begin
    g := FGList[i];
    if g.CubicleName = '' then Continue;

    cub := FGroupList.GetCubicle(G.CubicleName);
    if cub <> nil then begin

      for j := 0 to cub.ConsoleIPs.Count - 1  do begin
        ipAdd := cub.ConsoleIPs[j];
        if ssIP.Find(ipAdd, k) then begin
          assG := ssIP.Objects[k] as TAssignGroup;
          assG.Add(g.Group_Index);

        end
        else begin
          assG := TAssignGroup.Create;
          assG.Add(g.Group_Index);
          ssIP.AddObject(ipAdd, assG);
        end;
      end;
    end;
  end;


  for I := 0 to ssIP.Count - 1 do begin
    ipAdd := ssIP[i];
    assG := ssIP.Objects[i] as TAssignGroup;
//    tes := ipAdd + ' : ';
    for j := 0 to assG.Count - 1 do
    begin
//      tes := tes + IntToStr(assG.AssList[j]) + ' , ';
      theClient.SendCubicleAssign(ipAdd, CMD_ASSIGN_ADD, assG.AssList[j] );
    end;
//    ShowMessage(tes);

  end;
end;


end.
