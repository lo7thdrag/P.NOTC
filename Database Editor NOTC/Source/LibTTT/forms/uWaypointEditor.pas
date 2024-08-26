unit uWaypointEditor;

interface

uses
  MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons,  uDBAssetObject,
  uDBAsset_Scripted, Menus, tttData, ImgList, uDBAsset_Radar, uDBAsset_Sonar,
  uDBAsset_Countermeasure, uDBAsset_Sensor, ActnList, uDBAsset_Weapon, uWaypoint;

type
  TfrmWaypointEditor = class(TForm)
    lvWaypoint: TListView;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    edtPosition: TEdit;
    btnControlComboInterval: TSpeedButton;
    Label3: TLabel;
    edtSpeed: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    Label6: TLabel;
    CheckBox1: TCheckBox;
    Edit3: TEdit;
    Label7: TLabel;
    Bevel2: TBevel;
    Label8: TLabel;
    edtTermination: TEdit;
    btnAction: TSpeedButton;
    Bevel3: TBevel;
    btnHide: TSpeedButton;
    btnApply: TSpeedButton;
    btnCancel: TSpeedButton;
    Label9: TLabel;
    Bevel4: TBevel;
    btnDeleteAll: TSpeedButton;
    btnDelete: TSpeedButton;
    btnAdd: TSpeedButton;
    pmenuAction: TPopupMenu;
    Continueonlastheadingandgroundspeed1: TMenuItem;
    Continueonterminalheading1: TMenuItem;
    Repeatthepatternusingthecurrentpositionastheanchorpoint1: TMenuItem;
    Repeatthepatternreusingtheexistingwaypointpositions1: TMenuItem;
    Returntolaunchingbase1: TMenuItem;
    Removeplatformfromexercise1: TMenuItem;
    cktreeAsset: TTreeView;
    ImageList1: TImageList;
    Notebook1: TNotebook;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edtNameWeapon: TEdit;
    edtSalvo: TEdit;
    edtTrack: TEdit;
    btnWeapon: TSpeedButton;
    SpeedButton2: TSpeedButton;
    pmenuWeapon: TPopupMenu;
    Action11: TMenuItem;
    Label11: TLabel;
    cbSensorState: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure onWaypointEdit(Sender: TObject);
    procedure btnControlComboIntervalClick(Sender: TObject);
    procedure btnHideClick(Sender: TObject);
    procedure edtSpeedKeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure btnActionClick(Sender: TObject);
    procedure Continueonlastheadingandgroundspeed1Click(Sender: TObject);
    procedure Continueonterminalheading1Click(Sender: TObject);
    procedure Repeatthepatternusingthecurrentpositionastheanchorpoint1Click(
      Sender: TObject);
    procedure Repeatthepatternreusingtheexistingwaypointpositions1Click(
      Sender: TObject);
    procedure Returntolaunchingbase1Click(Sender: TObject);
    procedure Removeplatformfromexercise1Click(Sender: TObject);
    procedure lvWaypointSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure cktreeAssetClick(Sender: TObject);
    procedure cktreeAssetKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cktreeAssetCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
    procedure btnWeaponClick(Sender: TObject);
    procedure cbSensorStateChange(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
  private
    FHookedPlatform: TPlatform_Instance;
    FAddMode : boolean;
    FHideEvent : boolean;
    FLastUserIndex : integer;
    FWPEvent : TObject;
    procedure SetHookedPlatform(const Value: TPlatform_Instance);
    procedure UpdateTableWaypoint;
    procedure UpdateAssetTree;
    procedure AssetRadar(parent : TTreenode);
    procedure AssetWeapon(Parent : TTreenode);
    procedure OnAddWaypoint(Long,Lat : double);
    procedure TerminationAction(val : TWaypointTermination);
    procedure OnMenuWeaponClick(Sender : TObject);
    procedure OnNodeSelected(Node : TTreeNode);
    procedure ToggleTreeViewCheckBoxes(Node: TTreeNode);
    procedure SetWPEvent(ev : TObject);
    //function ExistEvent() : boolean;
    //procedure OnEventChange()
    { Private declarations }
  public
    { Public declarations }
    property HookedPlatform : TPlatform_Instance read FHookedPlatform write SetHookedPlatform;
  end;

var
  frmWaypointEditor: TfrmWaypointEditor;

implementation

uses uBaseCoordSystem, uMapXHandler;

{$R *.dfm}

const
  cFlatChecked  = 1;
  cFlatUnCheck  = 2;
  cRadar        = 3;
  cWeapon       = 4;
  cCounterM     = 5;
  cDataLink     = 6;

procedure TfrmWaypointEditor.ToggleTreeViewCheckBoxes(
   Node             :TTreeNode);
begin
  if Assigned(Node) then
  begin
    if Node.StateIndex = cFlatUnCheck then begin
      Node.StateIndex := cFlatChecked;
    end
    else if Node.StateIndex = cFlatChecked then begin
      Node.StateIndex := cFlatUnCheck;
    end
    else if Node.StateIndex = cRadar then begin
      Node.StateIndex := cRadar;
    end
    else if Node.StateIndex = cWeapon then begin
      Node.StateIndex := cWeapon
    end
    else if Node.StateIndex = cCounterM then begin
      Node.StateIndex := cCounterM;
    end;

    if (Node.StateIndex = cFlatChecked) or
       (Node.StateIndex = cFlatUnCheck) then begin
      if Assigned(node.Data) then
        case TWaypointEventClass(node.Data).FType of
          wetRadar :
          begin
            Notebook1.PageIndex := 4;
            case Node.StateIndex of
              cFlatChecked : TWaypointEventClass(node.Data).FEnable := true;
              cFlatUnCheck : TWaypointEventClass(node.Data).FEnable := false;
              //cFlatChecked : TScripted_Radar_Event(TWaypointEventClass(node.Data).FData).FData.Radar_Control := 1;
              //cFlatUnCheck : TScripted_Radar_Event(TWaypointEventClass(node.Data).FData).FData.Radar_Control := 0;
            end;
          end;
          wetSonar :
          begin
            Notebook1.PageIndex := 4;
            case Node.StateIndex of
              cFlatChecked : TWaypointEventClass(node.Data).FEnable := true;
              cFlatUnCheck : TWaypointEventClass(node.Data).FEnable := false;
              //cFlatChecked : TScripted_Radar_Event(TWaypointEventClass(node.Data).FData).FData.Radar_Control := 1;
              //cFlatUnCheck : TScripted_Radar_Event(TWaypointEventClass(node.Data).FData).FData.Radar_Control := 0;
            end;
          end;
          wetWeapon1,wetWeapon2,wetWeapon3,wetWeapon4,wetWeapon5 :
          begin
            Notebook1.PageIndex := 1;

          end;
        end;
    end else Notebook1.PageIndex := 0;
  end;
end;

procedure TfrmWaypointEditor.onWaypointEdit(Sender: TObject);
var index : integer;
begin
//
  case TSpeedButton(Sender).Tag of
    1 :
      begin
        if TSpeedButton(Sender).Down then begin
          TSpeedButton(Sender).Down := false;
          FAddMode := false;
          VSimMap.FMap.CurrentTool := miArrowTool;
        end else begin
          TSpeedButton(Sender).Down := true;
          FAddMode := true;
        end;
      end;
    2 :
      begin
        FAddMode := false;
        btnAdd.Down := false;
        index := lvWaypoint.ItemIndex;
        if index > 0 then begin
          FHookedPlatform.Vehicle.Waypoints.Delete(index);
          UpdateTableWaypoint;
        end;
      end;
    3 :
      begin
        FAddMode := false;
        btnAdd.Down := false;
        FHookedPlatform.Vehicle.Waypoints.Clear;
      end;
  end;

end;

procedure TfrmWaypointEditor.Removeplatformfromexercise1Click(Sender: TObject);
begin
  FHookedPlatform.Vehicle.Waypoints.Termination := wtRM;
  TerminationAction(FHookedPlatform.Vehicle.Waypoints.Termination);
end;

procedure TfrmWaypointEditor.Repeatthepatternreusingtheexistingwaypointpositions1Click(
  Sender: TObject);
begin
  FHookedPlatform.Vehicle.Waypoints.Termination := wtRP2;
  TerminationAction(FHookedPlatform.Vehicle.Waypoints.Termination);
end;

procedure TfrmWaypointEditor.Repeatthepatternusingthecurrentpositionastheanchorpoint1Click(
  Sender: TObject);
begin
  FHookedPlatform.Vehicle.Waypoints.Termination := wtRP;
  TerminationAction(FHookedPlatform.Vehicle.Waypoints.Termination);
end;

procedure TfrmWaypointEditor.Returntolaunchingbase1Click(Sender: TObject);
begin
  FHookedPlatform.Vehicle.Waypoints.Termination := wtRB;
  TerminationAction(FHookedPlatform.Vehicle.Waypoints.Termination);
end;

procedure TfrmWaypointEditor.OnAddWaypoint(Long, Lat: double);
var behav : TScripted_Behav_Definition;
begin
  behav := TScripted_Behav_Definition.Create;
  with behav.FData do begin
    Scripted_Event_Index  := FLastUserIndex;
    Waypoint_Latitude     := Lat;
    Waypoint_Longitude    := Long;
    Speed                 := Round(FHookedPlatform.Speed);
  end;
  FHookedPlatform.Vehicle.Waypoints.Add(behav,nil);
  FLastUserIndex := FLastUserIndex + 1;

  edtPosition.Text := formatDM_longitude(long) + ' ' + formatDM_latitude(lat);
  edtSpeed.Text := FloatToStr(behav.FData.Speed);

  UpdateTableWaypoint;
end;

procedure TfrmWaypointEditor.OnMenuWeaponClick(Sender: TObject);
begin
  edtNameWeapon.Text := TMenuItem(Sender).Caption;
end;

procedure TfrmWaypointEditor.OnNodeSelected(Node: TTreeNode);
begin
  if not Assigned(Node.Data) then
    Notebook1.PageIndex := 0
  else begin
    SetWPEvent(Node.Data);
    //FWPEvent := Node.Data;
    case TWaypointEventClass(Node.Data).FType of
      wetRadar :
      begin
        Notebook1.PageIndex := 4;
        cbSensorState.ItemIndex :=
          TScripted_Radar_Event(TWaypointEventClass(FWPEvent).FData).FData.Radar_Control;

      end;
      wetSonar :
      begin
        Notebook1.PageIndex := 4;
        cbSensorState.ItemIndex :=
          TScripted_Sonar_Event(TWaypointEventClass(FWPEvent).FData).FData.Sonar_Control;
      end;

    end;
  end;
end;

procedure TfrmWaypointEditor.AssetRadar(parent: TTreenode);
var i, index : integer;
    node, node2 : TTreeNode;
    wpevent, objEvent : TObject;
begin
  index := lvWaypoint.ItemIndex;

  with FHookedPlatform.Vehicle do begin
    if Radars.Count > 0 then begin
      node := cktreeAsset.Items.AddChild(parent,'Radar');
      node.StateIndex := cRadar;

      for i := 0 to Radars.Count - 1 do begin
        node2 := cktreeAsset.Items.AddChild(node, TRadar_On_Board(Radars[i]).FData.Instance_Identifier);
        node2.StateIndex := cFlatUnCheck;

        if index > -1 then begin
          if not Waypoints.EventExistForObject(index,Radars[i],wpevent) then begin

            objEvent  := TScripted_Radar_Event.Create;
            with TScripted_Radar_Event(objEvent).FData do begin
              Scripted_Event_Index := TScripted_Behav_Definition(Waypoints.Behaviour[index]).FData.Scripted_Event_Index;
              Radar_Index          := TRadar_On_Board(Radars[i]).FData.Radar_Index;
              Radar_Control        := 0; // off
            end;

            wpevent   := TWaypointEventClass.Create;
            TWaypointEventClass(wpevent).FType := wetRadar;
            TWaypointEventClass(wpevent).FData := objEvent;
            TWaypointEventClass(wpevent).FEnable := false;
            Waypoints.Add(TScripted_Behav_Definition(Waypoints.Behaviour[index]),TWaypointEventClass(wpevent));

            node2.StateIndex := cFlatUnCheck;

          end else begin
            if TWaypointEventClass(wpevent).FEnable then
              node2.StateIndex := cFlatChecked
            else
              node2.StateIndex := cFlatUnCheck;
          end;
          node2.Data := wpevent;
        end;
      end;
    end;

    if Sonars.Count > 0 then begin
      node := cktreeAsset.Items.AddChild(parent,'Sonar');
      node.StateIndex := cRadar;
      for i := 0 to Sonars.Count - 1 do begin
        node2 := cktreeAsset.Items.AddChild(node, TSonar_On_Board(Sonars[i]).FData.Instance_Identifier);
        node2.StateIndex := cFlatUnCheck;

        if index > -1 then begin
          if not Waypoints.EventExistForObject(index,Sonars[i],wpevent) then begin

            objEvent  := TScripted_Sonar_Event.Create;
            with TScripted_Sonar_Event(objEvent).FData do begin
              Scripted_Event_Index := TScripted_Behav_Definition(Waypoints.Behaviour[index]).FData.Scripted_Event_Index;
              Sonar_Index          := TSonar_On_Board(Sonars[i]).FData.Sonar_Index;
              Sonar_Control        := 0; // off
            end;

            wpevent   := TWaypointEventClass.Create;
            TWaypointEventClass(wpevent).FType := wetSonar;
            TWaypointEventClass(wpevent).FData := objEvent;
            TWaypointEventClass(wpevent).FEnable := false;
            Waypoints.Add(TScripted_Behav_Definition(Waypoints.Behaviour[index]),TWaypointEventClass(wpevent));

            node2.StateIndex := cFlatUnCheck;
          end else begin
            if TWaypointEventClass(wpevent).FEnable then
              node2.StateIndex := cFlatChecked
            else
              node2.StateIndex := cFlatUnCheck;
          end;
          node2.Data := wpevent;
        end;
      end;
    end;

    if IFFSensors.Count > 0 then begin
      for i := 0 to IFFSensors.Count - 1 do begin
        node := cktreeAsset.Items.AddChild(parent,'IFF Transponder');
        node2 := cktreeAsset.Items.AddChild(parent,'IFF Interogator');

        node.StateIndex := cFlatUnCheck;
        node2.StateIndex := cFlatUnCheck;

        if index > -1 then begin
          if not Waypoints.EventExistForObject(index,IFFSensors[i],wpevent) then begin
            objEvent  := TScripted_IFF_Event.Create;
            with TScripted_IFF_Event(objEvent).FData do begin
              Scripted_Event_Index := TScripted_Behav_Definition(Waypoints.Behaviour[index]).FData.Scripted_Event_Index;
              IFF_Instance_Index   := TIFF_Sensor_On_Board(Sonars[i]).FData.IFF_Instance_Index;
              IFF_Interrogator_Control  := 0; // off
              IFF_Transponder_Control   := 0; // off
            end;

            // wp event untuk transpondernya
            wpevent   := TWaypointEventClass.Create;
            TWaypointEventClass(wpevent).FType := wetIFFTransponder;
            TWaypointEventClass(wpevent).FData := objEvent;
            TWaypointEventClass(wpevent).FEnable := false;
            Waypoints.Add(TScripted_Behav_Definition(Waypoints.Behaviour[index]),TWaypointEventClass(wpevent));
            node.Data := wpevent;

            // wp event untuk interogatornya
            wpevent   := TWaypointEventClass.Create;
            TWaypointEventClass(wpevent).FType := wetIFFInterogator;
            TWaypointEventClass(wpevent).FData := objEvent;
            TWaypointEventClass(wpevent).FEnable := false;
            Waypoints.Add(TScripted_Behav_Definition(Waypoints.Behaviour[index]),TWaypointEventClass(wpevent));
            node2.Data := wpevent;

          end else begin

            case TScripted_IFF_Event(TWaypointEventClass(wpevent).FData).FData.IFF_Transponder_Control of
              0 : node.StateIndex := cFlatUnCheck;
              1 : node.StateIndex := cFlatChecked;
            end;
            case TScripted_IFF_Event(TWaypointEventClass(wpevent).FData).FData.IFF_Interrogator_Control of
              0 : node2.StateIndex := cFlatUnCheck;
              1 : node2.StateIndex := cFlatChecked;
            end;
          end;
        end;

      end;
    end;

    if Sonobuoy.Count > 0 then begin
      node := cktreeAsset.Items.AddChild(parent,'Sonobuoy');
      node.StateIndex := cFlatUnCheck;
    end;

  end;

end;

procedure TfrmWaypointEditor.AssetWeapon(Parent: TTreenode);
var i, tag, index : integer;
    node, node2 : TTreeNode;
    Item : TMenuItem;
    wpevent, objEvent : TObject;
begin
  index := lvWaypoint.ItemIndex;

  with FHookedPlatform.Vehicle do begin
    // maksimal 5 untuk senjata
    for i := 1 to 5 do begin
      node2 := cktreeAsset.Items.AddChild(parent, 'Weapon ' + IntToStr(i));

      {if index > -1 then begin
        if not Waypoints.EventExistForObject(index,wetWeapon1,wpevent) then begin

          objEvent  := TScripted_Weapon_Event.Create;
          with TScripted_Weapon_Event(objEvent).FData do begin
            Scripted_Event_Index := TScripted_Behav_Definition(Waypoints.Behaviour[index]).FData.Scripted_Event_Index;
            List_Index           := -1;
            Salvo_Size           := 0;
            Number_Layed         := 0;
            Distance_Between     := 0;
            Mine_Depth           := 0;
            Target_Index         := 0;
            Weapon_Type          := 0;
            Point_Effect         := 0;
            Weapons_Mount        := 0;
          end;

          wpevent   := TWaypointEventClass.Create;
          case i of
            1 : TWaypointEventClass(wpevent).FType := wetWeapon1;
            2 : TWaypointEventClass(wpevent).FType := wetWeapon2;
            3 : TWaypointEventClass(wpevent).FType := wetWeapon3;
            4 : TWaypointEventClass(wpevent).FType := wetWeapon4;
            5 : TWaypointEventClass(wpevent).FType := wetWeapon5;
          end;

          TWaypointEventClass(wpevent).FData := objEvent;
          TWaypointEventClass(wpevent).FEnable := false;
          Waypoints.Add(TScripted_Behav_Definition(Waypoints.Behaviour[index]),TWaypointEventClass(wpevent));

          node2.StateIndex := cFlatUnCheck;
        end else begin
          if TWaypointEventClass(wpevent).FEnable then
            node2.StateIndex := cFlatChecked
          else
            node2.StateIndex := cFlatUnCheck;
        end;
      end;
      node2.Data := wpevent;  }
    end;

    if Mines.Count > 0 then begin
      for i := 0 to Mines.Count - 1 do begin
        node := cktreeAsset.Items.AddChild(parent,TMine_On_Board(Mines[i]).FData.Instance_Identifier);
        node.StateIndex := cFlatUnCheck;
        node.Data := Mines[i];
      end;
    end;

    pmenuWeapon.Items.Clear;
    tag := 0;
    for i := 0 to Missiles.Count - 1 do begin
      Item := TMenuItem.Create(self);
      Item.OnClick := OnMenuWeaponClick;
      Item.Caption := TMissile_On_Board(Missiles[i]).FData.Instance_Identifier;
      item.Tag := tag;
      pmenuWeapon.Items.Add(item);
      tag := tag + 1;
    end;
    for i := 0 to Torpedos.Count - 1 do begin
      Item := TMenuItem.Create(self);
      Item.OnClick := OnMenuWeaponClick;
      Item.Caption := TTorpedo_On_Board(Torpedos[i]).FData.Instance_Identifier;
      item.Tag := tag;
      pmenuWeapon.Items.Add(item);
      tag := tag + 1;
    end;
  end;
end;

procedure TfrmWaypointEditor.btnActionClick(Sender: TObject);
var point : TPOint;
begin
  GetCursorPos(point);
  pmenuAction.Popup(point.X,point.Y);
end;

procedure TfrmWaypointEditor.btnApplyClick(Sender: TObject);
begin
  // ngetes doank
  if Assigned(FWPEvent) then
  TScripted_Radar_Event(TWaypointEventClass(FWPEvent).FData).FData.Radar_Control :=
      1;
end;

procedure TfrmWaypointEditor.btnControlComboIntervalClick(Sender: TObject);
begin
  VSimMap.FMap.CurrentTool := mtAddWaypoint;
end;

procedure TfrmWaypointEditor.btnHideClick(Sender: TObject);
begin
  if FHideEvent then
    Height := 518
  else
    Height := 278;

  FHideEvent := not FHideEvent;
end;

procedure TfrmWaypointEditor.btnWeaponClick(Sender: TObject);
var
  P:TPoint;
begin
  GetCursorPos(P);
  P := btnWeapon.ScreenToClient(P);
  pmenuWeapon.Popup(P.X,P.Y);
end;

procedure TfrmWaypointEditor.cbSensorStateChange(Sender: TObject);
begin
//
  if Assigned(FWPEvent) then begin
    case TWaypointEventClass(FWPEvent).FType of
      wetRadar : begin
        TScripted_Radar_Event(TWaypointEventClass(FWPEvent).FData).FData.Radar_Control :=
            cbSensorState.ItemIndex;
      end;
      wetSonar :
        TScripted_Sonar_Event(TWaypointEventClass(FWPEvent).FData).FData.Sonar_Control :=
            cbSensorState.ItemIndex;
    end;
  end;
end;

procedure TfrmWaypointEditor.cktreeAssetClick(Sender: TObject);
var
  P:TPoint;
begin
  GetCursorPos(P);
  P := cktreeAsset.ScreenToClient(P);
  if (htOnStateIcon in
             cktreeAsset.GetHitTestInfoAt(P.X,P.Y)) then
    ToggleTreeViewCheckBoxes(cktreeAsset.Selected);

  if (htOnItem in
             cktreeAsset.GetHitTestInfoAt(P.X,P.Y)) then
    OnNodeSelected(cktreeAsset.Selected);
end;

procedure TfrmWaypointEditor.cktreeAssetCollapsing(Sender: TObject;
  Node: TTreeNode; var AllowCollapse: Boolean);
begin
  AllowCollapse := false;
end;

procedure TfrmWaypointEditor.cktreeAssetKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_SPACE) and
     Assigned(cktreeAsset.Selected) then
        ToggleTreeViewCheckBoxes(cktreeAsset.Selected);
end; (*TreeView1KeyDown*)

procedure TfrmWaypointEditor.Continueonlastheadingandgroundspeed1Click(
  Sender: TObject);
begin
  FHookedPlatform.Vehicle.Waypoints.Termination := wtLH;
  TerminationAction(FHookedPlatform.Vehicle.Waypoints.Termination);
end;

procedure TfrmWaypointEditor.Continueonterminalheading1Click(Sender: TObject);
begin
  FHookedPlatform.Vehicle.Waypoints.Termination := wtTH;
  TerminationAction(FHookedPlatform.Vehicle.Waypoints.Termination);
end;

procedure TfrmWaypointEditor.edtSpeedKeyPress(Sender: TObject; var Key: Char);
begin
  if  not (Key in [#48..#57, #8]) then Key := #0;
end;

procedure TfrmWaypointEditor.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if  not (Key in [#48..#57, #8]) then Key := #0;

end;

procedure TfrmWaypointEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmWaypointEditor := nil;
end;

procedure TfrmWaypointEditor.FormCreate(Sender: TObject);
begin
  FormStyle := fsStayOnTop;
  lvWaypoint.DoubleBuffered := true;
  FAddMode := false;
  FLastUserIndex := 0;
  FHideEvent := true;

  VSimMap.OnAddWayoint := OnAddWaypoint;
end;
procedure TfrmWaypointEditor.lvWaypointSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  behav : TScripted_Behav_Definition;
  event : TList;
begin
  if Item  = nil then exit;

  behav := TScripted_Behav_Definition(FHookedPlatform.Vehicle.Waypoints.Behaviour[item.Index]);
  //event := FHookedPlatform.Vehicle.Waypoints.Events[item.Index];

  with behav.FData do begin
    edtPosition.Text := formatDM_longitude(Waypoint_Longitude) + ' ' +
                        formatDM_latitude(Waypoint_Latitude);
    //edtSpeed.Text := FloatToStr(Speed);
  end;

  UpdateAssetTree;
end;

procedure TfrmWaypointEditor.SetHookedPlatform(const Value: TPlatform_Instance);
begin
  FHookedPlatform := Value;
  with FHookedPlatform.Vehicle do begin
    TerminationAction(Waypoints.Termination);
  end;
  UpdateTableWaypoint;
  UpdateAssetTree;
end;

procedure TfrmWaypointEditor.SetWPEvent(ev: TObject);
begin
  FWPEvent := ev;
end;

procedure TfrmWaypointEditor.TerminationAction(val: TWaypointTermination);
begin
  case val of
    wtLH: edtTermination.Text := 'Continue on last heading' ;
    wtTH: edtTermination.Text := 'Continue on terminal heading' ;
    wtRP: edtTermination.Text := 'Repeat the pattern, using the current position as the anchor point' ;
    wtRP2:edtTermination.Text := 'Repeat the pattern, reusing the existing waypoint positions'  ;
    wtRB: edtTermination.Text := 'Return to launching base' ;
    wtRM: edtTermination.Text := 'Remove platform from exercise' ;
  end;
end;

procedure TfrmWaypointEditor.UpdateAssetTree;
var
  parent, node : TTreeNode;
  i : integer;
begin
  cktreeAsset.Items.Clear;
  with FHookedPlatform.Vehicle do begin
    if (Radars.Count > 0) or (Sonars.Count > 0) or
       (IFFSensors.Count >0) or (Sonobuoy.Count > 0) then begin
      parent := cktreeAsset.Items.AddChild(nil,'Sensor');
      parent.StateIndex := cRadar;
      AssetRadar(parent);
    end;

    if  (Missiles.Count > 0) or
        (Torpedos.Count > 0) or
        (Bombs.Count > 0) or
        (Mines.Count > 0)  then begin
      parent := cktreeAsset.Items.AddChild(nil,'Weapon');
      parent.StateIndex := cWeapon;
      AssetWeapon(parent);
    end;

    if (Chaffs.Count > 0) then begin
      parent := cktreeAsset.Items.AddChild(nil,'Countermeasures');
      parent.StateIndex := cCounterM;

      for i := 0 to Chaffs.Count - 1 do begin
        node := cktreeAsset.Items.AddChild(parent,TChaff_On_Board(Chaffs[i]).FData.Instance_Identifier);
        node.StateIndex := cFlatUnCheck;
      end;
    end;

    parent := cktreeAsset.Items.AddChild(nil,'Datalink');
    parent.StateIndex := cDataLink;

    node := cktreeAsset.Items.AddChild(parent,'HF');
    node.StateIndex := cFlatUnCheck;
    node := cktreeAsset.Items.AddChild(parent,'VHF/UHF');
    node.StateIndex := cFlatUnCheck;
  end;

  cktreeAsset.FullExpand;
end;

procedure TfrmWaypointEditor.UpdateTableWaypoint;
var
  i : integer;
  li: TListItem;
begin
  lvWaypoint.Items.Clear;

  with FHookedPlatform do begin
    for i := 0 to Vehicle.Waypoints.Count - 1 do begin
      li := lvWaypoint.Items.Add;
      li.Caption := IntToStr(i+1);
      li.SubItems.Add('WayPt ' +
        IntToStr(TScripted_Behav_Definition(Vehicle.Waypoints.Behaviour[i]).FData.Scripted_Event_Index));
      li.Data := Vehicle.Waypoints.Behaviour[i];

      if FLastUserIndex < TScripted_Behav_Definition(Vehicle.Waypoints.Behaviour[i]).FData.Scripted_Event_Index then
         FLastUserIndex := TScripted_Behav_Definition(Vehicle.Waypoints.Behaviour[i]).FData.Scripted_Event_Index;
    end;
  end;

end;

end.
