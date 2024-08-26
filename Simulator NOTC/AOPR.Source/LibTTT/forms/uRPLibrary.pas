unit uRPLibrary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uSimMgr_Client, Buttons, tttData,
  uGameData_TTT, ImgList, uDataModuleTTT, uDBAsset_Runtime_Platform_Library,
  System.ImageList;

type
  TfrmRPLibrary = class(TForm)
    Bevel1: TBevel;
    Notebook1: TNotebook;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbClass: TLabel;
    edtName: TEdit;
    edtTrackId: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    lbClassLaunch: TLabel;
    lbNameLaunch: TLabel;
    Label8: TLabel;
    btnNext: TButton;
    btnLaunch: TButton;
    btnCancel: TButton;
    lbPosition: TLabel;
    edtPosition: TEdit;
    btnPosition: TSpeedButton;
    pnlTrackID: TPanel;
    pnlSelectPos: TPanel;
    pnlClassSelect: TPanel;
    lvObject: TListView;
    pnlSelectGroup: TPanel;
    Label2: TLabel;
    rgForceDesignation: TRadioGroup;
    lbxGroup: TListBox;
    edtHeading: TEdit;
    edtSpeed: TEdit;
    edtAltitude: TEdit;
    lbHeading: TLabel;
    lbSpeed: TLabel;
    lbAltitude: TLabel;
    tvRuntimePlatform: TTreeView;
    ImageList1: TImageList;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNextClick(Sender: TObject);
    procedure btnLaunchClick(Sender: TObject);
    procedure btnPositionClick(Sender: TObject);
    procedure rgForceDesignationClick(Sender: TObject);
    procedure lbxGroupClick(Sender: TObject);
    procedure edtTrackIdKeyPress(Sender: TObject; var Key: Char);
    procedure edtTrackIdChange(Sender: TObject);
    procedure edtHeadingKeyPress(Sender: TObject; var Key: Char);
    procedure edtSpeedKeyPress(Sender: TObject; var Key: Char);
    procedure edtAltitudeKeyPress(Sender: TObject; var Key: Char);

    procedure lvObjectCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FDeployedObject: TObject;
    FMapPositionX: double;
    FMapPositionY: double;
    FGroupID : integer;
    rSend: TRecCmd_LaunchRP;

    FForceList: array [1..5] of TStrings;

    //procedure SetDeployedObject(const Value: TObject);
    procedure SetMapPositionX(const Value: double);
    procedure SetMapPositionY(const Value: double);
    { Private declarations }
  public
    procedure SetUpGroupAndForce;

  public
    { Public declarations }
    property MapPositionX : double read FMapPositionX write SetMapPositionX;
    property MapPositionY : double read FMapPositionY write SetMapPositionY;
  end;

var
  frmRPLibrary: TfrmRPLibrary;

implementation

uses uDBAssetObject, uT3Unit, uDBAsset_Vehicle,
  uBaseCoordSystem, uMapXhandler, ufTacticalDisplay,
  uDBScenario, uDBCubicles, uT3Vehicle, ufrmKeyboard;

{$R *.dfm}

procedure TfrmRPLibrary.btnCancelClick(Sender: TObject);
begin
  frmTacticalDisplay.Map1.CurrentTool := mtSelectObject;
  Close;
end;

procedure TfrmRPLibrary.btnLaunchClick(Sender: TObject);
var
  tempObject : TObject;
  vIndex : integer;
begin
  if trim(edtPosition.Text) = '' then
    exit;

  if FDeployedObject = nil then
    exit;

  vIndex := 0;
  tempObject := FDeployedObject;

  if tempObject is TPlatform_Instance then
    vIndex := TPlatform_Instance(tempObject).Vehicle.FData.Vehicle_Index;

  if tempObject is TMine_Definition then
    vIndex := TMine_Definition(tempObject).FData.Mine_Index;

  rSend.RPPlatformID   := vIndex; // ID nya launcher / vehicle def
  rSend.NewPlatformID  := 0;  // digenerate server. client kirim 0
  rSend.RPGroupID      := FGroupID;
  StrToChar(edtName.Text, rSend.InstanceName);
  StrToChar(edtTrackId.Text, rSend.TrackIdent);
  rSend.IDPlatformName := 0;
  rSend.IDPlatformClass := 0;

  StrToChar('', rSend.namePlatform);
  StrToChar('', rSend.nameClass);
  StrToChar('', rSend.VBSClassName);

  rSend.pX := MapPositionX;
  rSend.pY := MapPositionY;

  rSend.PHeading  := StrToFloat(edtHeading.Text);
  rSend.PSpeed    := StrToFloat(edtSpeed.Text);

  if FDeployedObject is TMine_Definition then
  begin
    rSend.PAltitude := StrToFloat(edtAltitude.Text);
  end;

  if FDeployedObject is TMissile_Definition then begin
    rSend.PAltitude := StrToFloat(edtAltitude.Text) * C_Feet_To_Meter;
  end;

  if FDeployedObject is TPlatform_Instance then
  begin
    case TPlatform_Instance(FDeployedObject).Vehicle.FData.Platform_Domain of
      vhdAir:
      begin
        rSend.PAltitude := StrToFloat(edtAltitude.Text) * C_Feet_To_Meter;
      end;
      vhdSubsurface:
      begin
        rSend.PAltitude := StrToFloat(edtAltitude.Text);
      end;
    end;
  end;

  case rgForceDesignation.ItemIndex of
    0 : rSend.ForceDesignation  := fcRed;
    1 : rSend.ForceDesignation  := fcBlue;
    2 : rSend.ForceDesignation  := fcNoForce;
  end;

  rSend.OrderID := CORD_ID_LAUNCH_SINGLE_RUNTIME_PLATFORM;
  rSend.MaxRowIndex := 0;
  rSend.MaxColumnIndex := 0;

  simMgrClient.netSend_CmdLaunchRP(rSend);

  Close;
end;

procedure TfrmRPLibrary.btnNextClick(Sender: TObject);
var
  s: string;
  node : TTreeNode;
begin
  if not Assigned(tvRuntimePlatform.Selected) then
  Exit;

  node := tvRuntimePlatform.Selected.Parent;

//  if lvObject.ItemIndex < 0 then
//    exit;
//
  FDeployedObject := tvRuntimePlatform.Selected.Data;

  if FDeployedObject = nil then
    exit;

  case Notebook1.PageIndex of
    0 :
    begin
      Notebook1.PageIndex := 1;

      if FDeployedObject is TPlatform_Instance then
      begin
        s := TPlatform_Instance(FDeployedObject).Vehicle.FData.Vehicle_Identifier;
        lbClass.Caption := s;
        edtName.Text    := s;
      end;
      btnLaunch.Enabled := false;
      btnNext.Enabled := false;
    end;
    1 :
    begin
      if (Length(Trim(edtName.Text)) > 0) and (Length(Trim(edtTrackId.Text)) > 0) then
      begin
        Notebook1.PageIndex := 2;

        if FDeployedObject <> nil then
        begin
          if FDeployedObject is TPlatform_Instance then
          begin
            lbAltitude.Visible := False;
            edtAltitude.Visible := False;
            Label12.Visible := False;

            case TPlatform_Instance(FDeployedObject).Vehicle.FData.Platform_Domain of
              vhdAir:
              begin
                lbAltitude.Visible := True;
                edtAltitude.Visible := True;
                Label12.Visible := True;
                lbAltitude.Caption := 'Altitude :';

                if TPlatform_Instance(FDeployedObject).Vehicle.FData.Platform_Type = vhtAirFixedWing then
                  edtSpeed.Text := FloatToStr(TPlatform_Instance(FDeployedObject).Motion.FData.Max_Ground_Speed)
                else
                  edtSpeed.Text := '0';
              end;
              vhdSubsurface:
              begin
                lbAltitude.Visible := True;
                edtAltitude.Visible := True;
                Label12.Visible := True;
                edtAltitude.Text := '0';
                lbAltitude.Caption := 'Depth :'
              end;
            end;

            lbClassLaunch.Caption := lbClass.Caption;
            lbNameLaunch.Caption  := edtName.Text;
          end;
        end;

        btnLaunch.Enabled := false;
        btnNext.Enabled   := true;
      end
      else
      begin
        MessageDlg('Name or ID Track is empty!', mtWarning, [mbOK], 0);
      end;
    end;
    2:
    begin
      if FDeployedObject is TPlatform_Instance then
      begin
        if TPlatform_Instance(FDeployedObject).Vehicle.FData.Platform_Domain = 0 then
        begin
          if edtAltitude.Text = '0' then
          begin
            MessageDlg('Air Platform Must Have Altitude More Than 0 Meter', mtWarning, [mbOK], 0);
            Exit;
          end;
        end;

        if TPlatform_Instance(FDeployedObject).Motion.FData.Max_Ground_Speed < StrToFloat(edtSpeed.Text) then
        begin
          MessageDlg(' Platform Speed More Than Maximum Speed', mtWarning, [mbOK], 0);
            Exit;
        end;
      end;

      if (Length(Trim(edtPosition.Text)) > 0) then
      begin
        Notebook1.PageIndex := 3;
        btnLaunch.Enabled := false;
        btnNext.Enabled   := false;
      end
      else
      begin
        MessageDlg('Value of Deploy Positions is empty!', mtWarning, [mbOK], 0);
      end;
    end;
  end;
end;

procedure TfrmRPLibrary.btnPositionClick(Sender: TObject);
begin
  VSimMap.FMap.CurrentTool := mtDeployPosition;
end;

procedure TfrmRPLibrary.edtAltitudeKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;
end;

procedure TfrmRPLibrary.edtHeadingKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;
end;

procedure TfrmRPLibrary.edtSpeedKeyPress(Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;
end;

procedure TfrmRPLibrary.edtTrackIdChange(Sender: TObject);
begin
  if (Length(edtTrackId.Text) > 0) then
    btnNext.Enabled := True
  else
    btnNext.Enabled := False;
end;

procedure TfrmRPLibrary.edtTrackIdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if (Length(edtTrackId.Text) > 0) then
      btnNext.Enabled := True
    else
      btnNext.Enabled := False;
  end
  else
    btnNext.Enabled := False;
end;

procedure TfrmRPLibrary.FormActivate(Sender: TObject);
begin
  frmKeyboard.HandleOfTheTargetForm := Self.Handle;
end;

procedure TfrmRPLibrary.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmRPLibrary := nil;
  Action := caFree;
  VSimMap.FMap.CurrentTool := mtSelectObject;
end;

procedure TfrmRPLibrary.FormCreate(Sender: TObject);
var
  i,j : integer;
  aObject : TObject;

  tn, tnItem : TTreeNode;
  recLBN     : TRuntime_Platform_Library;
  recPLE     : TPlatform_Library_Entry;
  Pi : TPlatform_Instance;
begin
//  lvObject.Items.Clear;
//
//  for i := 0 to simMgrClient.Scenario.RuntimePlatformLibrary.Count - 1 do begin
//    aObject := simMgrClient.Scenario.RuntimePlatformLibrary[i];
//
//    if aObject is TVehicle_Definition then
//      with TVehicle_Definition(aObject) do
//        lvObject.AddItem(FData.Vehicle_Identifier,aObject);
//
//    if aObject is TMissile_Definition then
//      with TMissile_Definition(aObject) do
//        lvObject.AddItem(FData.Class_Identifier,aObject);
//
//    if aObject is TTorpedo_Definition then
//      with TTorpedo_Definition(aObject) do
//        lvObject.AddItem(FData.Class_Identifier,aObject);
//
//    if aObject is TMine_Definition then
//      with TMine_Definition(aObject) do
//        lvObject.AddItem(FData.Mine_Identifier,aObject);
//
//    {if aObject.ClassType = TSonobuoy_On_Board then
//      with TSonobuoy_On_Board(aObject) do
//        lvObject.AddItem(FDef.Class_Identifier,aObject);}
//  end;
//
//  lvObject.AlphaSort;

  for i := 1 to 5 do
  begin
    FForceList[i] := TStringList.Create;
  end;

  tvRuntimePlatform.Items.Clear;

  for i := 0 to simMgrClient.Scenario.RPLListFromDB.Count - 1 do
  begin
    recLBN := simMgrClient.Scenario.RPLListFromDB.Items[i];

    tn := TTreeNode.Create(tvRuntimePlatform.Items);
    tn := tvRuntimePlatform.Items.Add(tn, recLBN.FData.Library_Name);

    for j := 0 to recLBN.FPlatform_Library_Entry.Count - 1 do begin
      recPLE := recLBN.FPlatform_Library_Entry.Items[j];

      with recPLE.FData do
      begin
        aObject := nil;

        if Vehicle_Index <> 0 then
        begin
          //dmTTT.GetVehicle_Definition(Vehicle_Index, TVehicle_Definition(aObject));
          Pi := simMgrClient.Scenario.GetPiRuntimePlatform(Vehicle_Index);
          tnItem := tvRuntimePlatform.Items.AddChildObject(tn, Pi.Vehicle.FData.Vehicle_Identifier, TPlatform_Instance(Pi));
//            Pi.Vehicle.FData.Vehicle_Identifier, TVehicle_Definition(Pi.Vehicle));
        end;

        if Missile_Index <> 0 then
        begin
          //dmTTT.getMissile_Def(TMissile_Definition(aObject), Missile_Index);
          Pi := simMgrClient.Scenario.GetPiRuntimePlatform(Missile_Index);
          tnItem := tvRuntimePlatform.Items.AddChildObject(tn,
            Pi.Missile.FData.Class_Identifier, TMissile_Definition(Pi.Missile));
        end;

        if Torpedo_Index <> 0 then
        begin
          //dmTTT.getTorpedo_Def(TTorpedo_Definition(aObject), Torpedo_Index);
          Pi := simMgrClient.Scenario.GetPiRuntimePlatform(Torpedo_Index);
          tnItem := tvRuntimePlatform.Items.AddChildObject(tn,
            Pi.Torpedo.FData.Class_Identifier, TTorpedo_Definition(Pi.Torpedo));
        end;

        if Mine_Index <> 0 then
        begin
          //dmTTT.getMine_def(TMine_Definition(aObject), Mine_Index);
          Pi := simMgrClient.Scenario.GetPiRuntimePlatform(Mine_Index);
          tnItem := tvRuntimePlatform.Items.AddChildObject(tn,
            Pi.Mine.FData.Mine_Identifier, TMine_Definition(Pi.Mine));
        end;
      end;
    end;
  end;

  FGroupID := 0;
  Notebook1.PageIndex := 0;
  btnLaunch.Enabled   := false;
  btnNext.Enabled     := true;
end;

procedure TfrmRPLibrary.FormShow(Sender: TObject);
var
  i,j        : integer;
  aObject    : TObject;
  tn, tnItem : TTreeNode;
  recLBN     : TRuntime_Platform_Library;
  recPLE     : TPlatform_Library_Entry;
begin
//  tvRuntimePlatform.Items.Clear;
//
//  listLBN := TList.Create;
//  recLBN  := TRuntime_Platform_Library.Create;
//
//  listPLE := TList.Create;
//  recPLE  := TPlatform_Library_Entry.Create;
//
//  dmTTT.GetRuntime_Platform_LibraryByResourceAlloc(simMgrClient.Scenario.ResourceAllocIndex, listLBN, recLBN);
//
//  for i := 0 to listLBN.Count - 1 do
//  begin
//    recLBN := TRuntime_Platform_Library(listLBN[i]);
//
//    tn := TTreeNode.Create(tvRuntimePlatform.Items);
//    tn := tvRuntimePlatform.Items.Add(tn, recLBN.FData.Library_Name);
//
//    dmTTT.getAllPlatform_Library_Entry(recLBN.FData.Platform_Library_Index, listPLE);
//
//    with simMgrClient do
//    begin
//      for j := 0 to listPLE.Count - 1 do begin
//        recPLE := TPlatform_Library_Entry(listPLE[j]);
//
//        with TPlatform_Library_Entry(listPLE[J]).FData do
//        begin
//          aObject := nil;
//
//          if Vehicle_Index <> 0 then
//          begin
//            dmTTT.GetVehicle_Definition(Vehicle_Index, TVehicle_Definition(aObject));
//          end;
//
//          if Missile_Index <> 0 then
//            dmTTT.getMissile_Def(TMissile_Definition(aObject), Missile_Index);
//
//          if Torpedo_Index <> 0 then
//            dmTTT.getTorpedo_Def(TTorpedo_Definition(aObject), Torpedo_Index);
//
//          if Mine_Index <> 0 then
//            dmTTT.getMine_def(TMine_Definition(aObject), Mine_Index);
//        end;
//
//        if recLBN.FData.Platform_Library_Index = recPLE.FData.Library_Index then
//        begin
//          if aObject is TVehicle_Definition then
//            with TVehicle_Definition(aObject) do
//              tnItem := tvRuntimePlatform.Items.AddChildObject(tn, FData.Vehicle_Identifier, aObject);
//
//          if aObject is TMissile_Definition then
//            with TMissile_Definition(aObject) do
//              tnItem := tvRuntimePlatform.Items.AddChildObject(tn, FData.Class_Identifier, aObject);
//
//          if aObject is TTorpedo_Definition then
//            with TTorpedo_Definition(aObject) do
//              tnItem := tvRuntimePlatform.Items.AddChildObject(tn, FData.Class_Identifier, aObject);
//
//          if aObject is TMine_Definition then
//            with TMine_Definition(aObject) do
//              tnItem := tvRuntimePlatform.Items.AddChildObject(tn, FData.Mine_Identifier, aObject);
//        end;
//      end;
//    end;
//  end;
end;

procedure TfrmRPLibrary.lbxGroupClick(Sender: TObject);
var g: T3CubicleGroup;
begin
  btnLaunch.Enabled := lbxGroup.ItemIndex >= 0;

  if lbxGroup.ItemIndex < 0 then
    exit;

  g := lbxGroup.Items.Objects[lbxGroup.ItemIndex] as T3CubicleGroup;
  if Assigned(g) then
    FGroupID := g.FData.Group_Index
  else
    FGroupID := 0;
end;

procedure TfrmRPLibrary.lvObjectCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
//  Compare := CompareText(Item1.Caption, Item2.Caption);
end;

procedure TfrmRPLibrary.rgForceDesignationClick(Sender: TObject);
var i, j: integer;
begin
  lbxGroup.Items.Clear;

  case rgForceDesignation.ItemIndex  of
    0: i := fcRed;
    1: i := fcBlue;
    2: i := fcNoForce;
  end;

  if (i > 0) and (i < 6) then
  begin
    for j := 0 to FForceList[i].Count - 1 do
      lbxGroup.Items.AddObject(FForceList[i][j],FForceList[i].Objects[j]);

    //lbxGroup.Items.Add('Controler');
  end;

  if lbxGroup.Count > 0 then
  begin
    btnLaunch.Enabled := true;
    lbxGroup.ItemIndex := 0;
    lbxGroupClick(lbxGroup);
  end
  else begin
    btnLaunch.Enabled := false;
  end;

end;

//procedure TfrmRPLibrary.SetDeployedObject(const Value: TObject);
//begin
//  FDeployedObject := Value;
//end;

procedure TfrmRPLibrary.SetMapPositionX(const Value: double);
begin
  FMapPositionX := Value;
  edtPosition.Text := formatDM_longitude(FMapPositionX) + '  '
  + formatDM_latitude(FMapPositionY);
end;

procedure TfrmRPLibrary.SetMapPositionY(const Value: double);
begin
  FMapPositionY := Value;
  edtPosition.Text := formatDM_longitude(FMapPositionX) + '  '
  + formatDM_latitude(FMapPositionY);
end;

procedure TfrmRPLibrary.SetUpGroupAndForce;
var
  i, f : integer;
  grp: T3CubicleGroup;
begin
  for i := 1 to 5 do
  begin
    FForceList[i].Clear;
  end;

  if not Assigned (simMgrClient.CubAssignList) then
    exit;

  for i := 0 to simMgrClient.CubAssignList.Count - 1 do
  begin
    grp := simMgrClient.CubAssignList.Items[i] as T3CubicleGroup;

    if grp = nil then
      continue;

    f := grp.FData.Force_Designation;

    if (f < 1) or (f > 5 ) then
    begin
      f := 5;
    end;

    FForceList[f].AddObject(grp.FData.Group_Identifier, grp);
  end;

//  if not Assigned (VScenario) then
//    exit;

//  for i := 0 to VScenario.CubiclesGroupsListFromDB.Count - 1 do
//  begin
//    grp := VScenario.CubiclesGroupsListFromDB.Items[i] as T3CubicleGroup;
//
//    if grp = nil then
//      continue;
//
//    f := grp.FData.Force_Designation;
//
//    if (f < 1) or (f > 5 ) then
//    begin
//      f := 5;
//    end;
//
//    FForceList[f].AddObject(grp.FData.Group_Identifier, grp);
//  end

  rgForceDesignation.ItemIndex := 0;
end;

end.

