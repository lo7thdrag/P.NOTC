unit uLogisticCalculation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons,
  tttData, uDataTypes, uMainLogisticTemplate, uSimMgr_Client, uBaseCoordSystem,
  uGameData_TTT, uMainStaticShape;

type
  TfmLogisticTamplate = class(TForm)
    grpLogisticEditor: TGroupBox;
    grpLogisticTamplate: TGroupBox;
    lvTemplates: TListView;
    lblNameOverlay: TLabel;
    edtNameTemplate: TEdit;
    btnNew: TSpeedButton;
    btnDelete: TSpeedButton;
    lblColour: TLabel;
    cbbColor: TColorBox;
    Label65: TLabel;
    pnlData: TPanel;
    Bevel3: TBevel;
    btnAddRoute: TSpeedButton;
    lvLogisticRoute: TListView;
    btnClearRoute: TSpeedButton;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    chkShow: TCheckBox;
    chkShowAll: TCheckBox;
    chkHideAll: TCheckBox;
    pnlInsert: TPanel;
    edtSpeed: TEdit;
    Label39: TLabel;
    Label2: TLabel;
    edtPersonel: TEdit;
    Label40: TLabel;
    Label17: TLabel;
    edtFirstPosX: TEdit;
    edtFirstPosY: TEdit;
    Label22: TLabel;
    edtSecondPosX: TEdit;
    edtSecondPosY: TEdit;
    btnDeleteRoute: TSpeedButton;
    btnClose: TSpeedButton;
    btnEdit: TSpeedButton;
    btnPublish: TSpeedButton;
    btnCancel: TSpeedButton;
    cbbForce: TComboBox;
    lbl1: TLabel;
    btnUpdate: TSpeedButton;
    btnFirstPointLog: TSpeedButton;
    btnSecondPointLog: TSpeedButton;

    procedure btnPublishClick(Sender: TObject);
    procedure ButtonHandleLogisticEditor(Sender: TObject);
    procedure ButtonHandleLogisticTemplate(Sender: TObject);
    procedure EditTextHandleLogisticEditor(Sender: TObject);
    procedure CekBoxHandle(Sender: TObject);
    procedure lvLogisticRouteSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure lvTemplatesSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnFirstPointLogClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);

  private
    FpostStart, FpostEnd : t2DPoint;
    FPointRouteSelected : TPointRoute;
    FShipingRouteSelected : TMainShipingRoute;

  public
    TempX1, TempY1, TempX2, TempY2 : Double;

    IdAction{, IdSelectedRoute, IdSelectedTemplate}: Integer;
    tempName : string;

    isFirstPointRoute : Boolean;

    procedure EditTemplate;
    procedure DeleteTemplate;
    procedure RefreshTemplate;
    procedure NormalRoute;
    procedure FrameShow(id : Integer);
    procedure AddRoute;
    procedure EditRoute;
    procedure DeleteRoute;
    procedure ClearRoute;
    procedure RefreshRoute;

    procedure AddFlag(id : integer);

    function FilterName(): Boolean;
  end;

var
  fmLogisticTamplate: TfmLogisticTamplate;

implementation

uses
  ufTacticalDisplay, ufrmKeyboard;
{$R *.dfm}

{ TfmLogisticTamplate }

procedure TfmLogisticTamplate.AddFlag(id : integer);
var
  ObjectFlagPoint : TFlagPoint;
begin
  ObjectFlagPoint := simMgrClient.DrawFlagPoint.GetFlagPoint(id);
  if Assigned(ObjectFlagPoint)  then
  begin
    ObjectFlagPoint.Post.X := TempX1;
    ObjectFlagPoint.Post.Y := TempY1;
  end
  else
  begin
    ObjectFlagPoint := TFlagPoint.Create(simMgrClient.Converter);
    ObjectFlagPoint.PointId := id;
    ObjectFlagPoint.Post.X := TempX1;
    ObjectFlagPoint.Post.Y := TempY1;
    simMgrClient.DrawFlagPoint.FList.Add(ObjectFlagPoint);
  end;
end;

procedure TfmLogisticTamplate.AddRoute;
var
  pointRouteTemp : TPointRoute;
  ObjectFlagPoint : TFlagPoint;
begin
  if isFirstPointRoute then
  begin
    FpostStart.X := TempX1;
    FpostStart.Y := TempY1;

    isFirstPointRoute := False;

    {$REGION ' Penanda titik pertama '}
    ObjectFlagPoint := TFlagPoint.Create(simMgrClient.Converter);
    ObjectFlagPoint.Post.X := TempX1;
    ObjectFlagPoint.Post.Y := TempY1;
    simMgrClient.DrawFlagPoint.FList.Add(ObjectFlagPoint);
    {$ENDREGION}
  end
  else
  begin
    simMgrClient.DrawFlagPoint.FList.Clear;

    if simMgrClient.DrawPointRouteTemporary.FList.Count + 1 > 24 then
    begin
      ShowMessage('Maximum point is 25 ');
      Exit;
    end;

    FpostEnd.X := TempX1;
    FpostEnd.Y := TempY1;

    pointRouteTemp := TPointRoute.Create(simMgrClient.Converter);

    pointRouteTemp.PosAwal.X := FpostStart.X;
    pointRouteTemp.PosAwal.Y := FpostStart.Y;
    pointRouteTemp.PosAkhir.X := FpostEnd.X;
    pointRouteTemp.PosAkhir.Y := FpostEnd.Y;

    pointRouteTemp.Personel := StrToInt(edtPersonel.Text);
    pointRouteTemp.Speed := StrToInt(edtSpeed.Text);
    pointRouteTemp.isEdit := True;
    pointRouteTemp.isSelected := False;

    simMgrClient.DrawPointRouteTemporary.AddRoute(pointRouteTemp);

    FpostStart.X := FpostEnd.X;
    FpostStart.Y := FpostEnd.Y;

    RefreshRoute;
  end;
end;

procedure TfmLogisticTamplate.btnCancelClick(Sender: TObject);
begin
  if Assigned(FShipingRouteSelected) then
    FShipingRouteSelected.isShow := True;

  simMgrClient.DrawPointRouteTemporary.Clear;

  frmTacticalDisplay.Map1.CurrentTool := mtSelectObject;
  FrameShow(2);
end;

procedure TfmLogisticTamplate.btnFirstPointLogClick(Sender: TObject);
begin
  case TSpeedButton(Sender).Tag of
    1:
    begin
      btnSecondPointLog.down := False;

      if btnFirstPointLog.down then
        frmTacticalDisplay.Map1.CurrentTool := mtEditLogistic;
    end;
    2:
    begin
      btnFirstPointLog.down := False;

      if btnSecondPointLog.down then
        frmTacticalDisplay.Map1.CurrentTool := mtEditLogistic;
    end;
  end;
end;

procedure TfmLogisticTamplate.btnPublishClick(Sender: TObject);
var
  i : Integer;
  li : TListItem;
  pointRouteTemp : TPointRoute;
  recRoute : TRecCmd_LogisticRoute;

  rec : TRecCmd_ShipingRoute;
begin
  if not FilterName then
  begin
    Exit;
  end;

  if IdAction = caEdit then
  begin
    if Assigned(FShipingRouteSelected) then
    begin
      rec.ShipingRouteId := FShipingRouteSelected.ShipingRouteId;
    end
    else
    begin
      ShowMessage('Can not publish this Route ');
      Exit;
    end;
  end;

  rec.IdAction := IdAction;
  rec.Name := edtNameTemplate.Text;
  rec.Color := cbbColor.Selected;
  rec.role := simMgrClient.ConsoleRole;
  rec.roleName := simMgrClient.ConsoleName;

  case simMgrClient.ClientRole of
    crpInstruktur:
    begin
      case cbbForce.ItemIndex of
        0: rec.Force := fcRed;
        1: rec.Force := fcBlue;
      end;
    end;
    crpCubicle:
    begin
      rec.Force := simMgrClient.FMyCubGroup.FData.Force_Designation;
    end;
  end;

  for i := 0 to 25 do
  begin
    rec.Personel[i] := 0;
    rec.Speed[i] := 0;
    rec.postStart[i].X := 0;
    rec.postStart[i].Y := 0;
    rec.postEnd[i].X := 0;
    rec.postEnd[i].Y := 0;
  end;

  for i := 0 to simMgrClient.DrawPointRouteTemporary.FList.Count - 1 do
  begin
    pointRouteTemp := simMgrClient.DrawPointRouteTemporary.FList[i];

    if Assigned(pointRouteTemp) then
    begin
      rec.Personel[i] := pointRouteTemp.Personel;
      rec.Speed[i] := pointRouteTemp.Speed;
      rec.postStart[i].X := pointRouteTemp.PosAwal.X;
      rec.postStart[i].Y := pointRouteTemp.PosAwal.Y;
      rec.postEnd[i].X := pointRouteTemp.PosAkhir.X;
      rec.postEnd[i].Y := pointRouteTemp.PosAkhir.Y;
    end;
  end;
  simMgrClient.netSend_CmdShipingRoute(rec);

  ClearRoute;
  FrameShow(2);
  frmTacticalDisplay.Map1.CurrentTool := mtSelectObject;
end;

procedure TfmLogisticTamplate.btnUpdateClick(Sender: TObject);
var
  pointRouteTemp : TPointRoute;
begin
  if Assigned(FPointRouteSelected) then
  begin
    {$REGION ' Point Route yang dipilih '}
    FPointRouteSelected.PosAwal.X := dmsToLong(edtFirstPosX.Text);
    FPointRouteSelected.PosAwal.Y := dmsToLatt(edtFirstPosY.Text);
    FPointRouteSelected.PosAkhir.X := dmsToLong(edtSecondPosX.Text);
    FPointRouteSelected.PosAkhir.Y := dmsToLatt(edtSecondPosY.Text);
    FPointRouteSelected.Personel := StrToInt(edtPersonel.Text);
    FPointRouteSelected.Speed := StrToFloat(edtSpeed.Text);
    {$ENDREGION}

    {$REGION ' Point Route yang sebelumnya '}
    pointRouteTemp := simMgrClient.DrawPointRouteTemporary.GetPointRoute(FPointRouteSelected.PointId-1);
    if Assigned(pointRouteTemp) then
    begin
      pointRouteTemp.PosAkhir.X := FPointRouteSelected.PosAwal.X;
      pointRouteTemp.PosAkhir.Y := FPointRouteSelected.PosAwal.Y;
    end;
    {$ENDREGION}

    {$REGION ' Point Route yang setelahnya '}
    pointRouteTemp := simMgrClient.DrawPointRouteTemporary.GetPointRoute(FPointRouteSelected.PointId+1);
    if Assigned(pointRouteTemp) then
    begin
      pointRouteTemp.PosAwal.X := FPointRouteSelected.PosAkhir.X;
      pointRouteTemp.PosAwal.Y := FPointRouteSelected.PosAkhir.Y;
    end;
    {$ENDREGION}

    simMgrClient.DrawFlagPoint.FList.Clear;

    RefreshRoute;
  end;
end;

procedure TfmLogisticTamplate.ButtonHandleLogisticEditor(Sender: TObject);
begin
  frmTacticalDisplay.Map1.CurrentTool := mtSelectObject;

  case TSpeedButton(Sender).Tag of
    1: {Add Route}
    begin
      btnAddRoute.Down := not btnAddRoute.Down;

      if btnAddRoute.Down then
      begin
        frmTacticalDisplay.Map1.CurrentTool := mtAddLogistic;
      end
      else
      begin
        frmTacticalDisplay.Map1.CurrentTool := mtSelectObject;
      end;

      pnlInsert.Visible := False;

    end;
    2: {Edit Route}
    begin
      EditRoute;
    end;
    3: {Delete Route}
    begin
      DeleteRoute;
    end;
    4: {Clear Route}
    begin
      ClearRoute;
    end;
  end;
end;

procedure TfmLogisticTamplate.ButtonHandleLogisticTemplate(Sender: TObject);
begin
  edtNameTemplate.Text := 'None';
  cbbColor.Selected := clBlack;

  IdAction := TSpeedButton(Sender).Tag;

  case TSpeedButton(Sender).Tag of
    1:{New}
    begin
      FrameShow(1);
    end;
    2:{Edit}
    begin
      EditTemplate;
    end;
    3:{Delete}
    begin
      DeleteTemplate;
    end;
    4:{Close}
    begin
      frmTacticalDisplay.Map1.CurrentTool := mtSelectObject;
      Close;
    end;
  end;
end;

procedure TfmLogisticTamplate.CekBoxHandle(Sender: TObject);
var
  i : Integer;
  shipingRouteTemp : TMainShipingRoute;

begin
  case TCheckBox(Sender).Tag of
    1:
    begin
      if Assigned(FShipingRouteSelected) then
      begin
        FShipingRouteSelected.isShow := chkShow.Checked;
      end;
    end;
    2:
    begin
      for i := 0 to simMgrClient.SimShipingRoute.FList.Count - 1 do
      begin
        shipingRouteTemp := SimMgrClient.SimShipingRoute.FList.Items[i];

        if Assigned(shipingRouteTemp) then
        begin
          shipingRouteTemp.isShow := True;
        end;
      end;
    end;
    3:
    begin
      for i := 0 to simMgrClient.SimShipingRoute.FList.Count - 1 do
      begin
        shipingRouteTemp := SimMgrClient.SimShipingRoute.FList.Items[i];

        if Assigned(shipingRouteTemp) then
        begin
          shipingRouteTemp.isShow := False;
        end;
      end;
    end;
  end;
end;

procedure TfmLogisticTamplate.ClearRoute;
begin
  simMgrClient.DrawPointRouteTemporary.Clear;

  FPointRouteSelected := nil;
  isFirstPointRoute := True;
  pnlInsert.Visible := False;
  btnAddRoute.Down := False;

  EditTextHandleLogisticEditor(nil);
  RefreshRoute;
end;

procedure TfmLogisticTamplate.DeleteRoute;
var
  pointCountTemp : Integer;
  pointRouteTemp : TPointRoute;

begin
  if Assigned(FPointRouteSelected) then
  begin

    if simMgrClient.DrawPointRouteTemporary.FList.Count > 0 then
    begin
      if (FPointRouteSelected.PointId <> 1) and (FPointRouteSelected.PointId <> pointCountTemp)then
      begin
        pointRouteTemp := simMgrClient.DrawPointRouteTemporary.FList.Items[FPointRouteSelected.PointId-2];
        pointRouteTemp.PosAkhir := TPointRoute(simMgrClient.DrawPointRouteTemporary.FList.Items[FPointRouteSelected.PointId-1]).PosAkhir;
      end;
      simMgrClient.DrawPointRouteTemporary.RemoveRoute(FPointRouteSelected);

      FPointRouteSelected := nil;
    end
    else
    begin
      isFirstPointRoute := True;
    end;

    pnlInsert.Visible := False;
    btnAddRoute.Down := False;

    RefreshRoute;

    pointCountTemp := simMgrClient.DrawPointRouteTemporary.FList.Count;

    FpostStart.X := TPointRoute(simMgrClient.DrawPointRouteTemporary.FList.Items[pointCountTemp-1]).PosAkhir.X;
    FpostStart.Y := TPointRoute(simMgrClient.DrawPointRouteTemporary.FList.Items[pointCountTemp-1]).PosAkhir.Y;
  end;
end;

procedure TfmLogisticTamplate.DeleteTemplate;
var
  rec : TRecCmd_ShipingRoute;
begin
  if Assigned(FShipingRouteSelected) then
  begin
    rec.ShipingRouteId := FShipingRouteSelected.ShipingRouteId;
    rec.IdAction := caDelete;
    simMgrClient.netSend_CmdShipingRoute(rec);
  end;
end;

procedure TfmLogisticTamplate.EditRoute;
begin
  if Assigned(FPointRouteSelected) then
  begin
    edtFirstPosX.Text := formatDMS_long(FPointRouteSelected.PosAwal.X);
    edtFirstPosY.Text := formatDMS_latt(FPointRouteSelected.PosAwal.Y);

    edtSecondPosX.Text := formatDMS_long(FPointRouteSelected.PosAkhir.X);
    edtSecondPosY.Text := formatDMS_latt(FPointRouteSelected.PosAkhir.Y);

    edtPersonel.Text := IntToStr(FPointRouteSelected.Personel);
    edtSpeed.Text := FloatToStr(FPointRouteSelected.Speed);

    pnlInsert.Visible := True;
    btnAddRoute.Down := False;
  end;
end;

procedure TfmLogisticTamplate.EditTemplate;
var
  i : Integer;
  prFromServerTemp, prForTemp : TPointRoute;
begin
  if Assigned(FShipingRouteSelected) then
  begin
    FShipingRouteSelected.isShow := False;

    edtNameTemplate.Text := FShipingRouteSelected.Name;
    cbbColor.Selected := FShipingRouteSelected.Color;

    case FShipingRouteSelected.Force of
      fcRed: cbbForce.ItemIndex := 0;
      fcBlue: cbbForce.ItemIndex := 1;
    end;

    chkShow.Checked := FShipingRouteSelected.isShow;

    simMgrClient.DrawPointRouteTemporary.Clear;

    for i := 0 to FShipingRouteSelected.FList.Count - 1 do
    begin
      prFromServerTemp := FShipingRouteSelected.FList.Items[i];
      prForTemp := TPointRoute.Create(simMgrClient.Converter);

      prForTemp.PointId := prFromServerTemp.PointId;
      prForTemp.Personel := prFromServerTemp.Personel;
      prForTemp.Color := prFromServerTemp.Color;
      prForTemp.Speed := prFromServerTemp.Speed;
      prForTemp.PosAwal.X := prFromServerTemp.PosAwal.X;
      prForTemp.PosAwal.Y := prFromServerTemp.PosAwal.Y;
      prForTemp.PosAkhir.X := prFromServerTemp.PosAkhir.X;
      prForTemp.PosAkhir.Y := prFromServerTemp.PosAkhir.Y;
      prForTemp.isEdit := True;
      prForTemp.isSelected := False;

      simMgrClient.DrawPointRouteTemporary.FList.Add(prForTemp);
    end;
    RefreshRoute;
    FrameShow(1);
  end;
end;

procedure TfmLogisticTamplate.EditTextHandleLogisticEditor(Sender: TObject);
begin
  lvLogisticRoute.Clear;
  edtSpeed.Text := '10';
  edtPersonel.Text := '450';
  edtFirstPosX.Text := '';
  edtFirstPosY.Text := '';
  edtSecondPosX.Text := '';
  edtSecondPosY.Text := ''
end;

function TfmLogisticTamplate.FilterName: Boolean;
var
  i, chkSpace, numSpace: Integer;

begin
  Result := False;

  {Jika inputan class name kosong}
  if (edtNameTemplate.Text = '')then
  begin
    ShowMessage('Please insert name');
    Exit;
  end;

  {Jika berisi spasi semua}
  chkSpace := Length(edtNameTemplate.Text);
  numSpace := 0;

  for i := 1 to chkSpace do
  begin
    if edtNameTemplate.Text[i] = #32 then
      numSpace := numSpace + 1;
  end;

  if chkSpace = numSpace then
  begin
    ShowMessage('Please use another class name');
    Exit;
  end;

  Result := True;
end;

procedure TfmLogisticTamplate.FormActivate(Sender: TObject);
begin
  frmKeyboard.HandleOfTheTargetForm := Self.Handle;
end;

procedure TfmLogisticTamplate.FormCreate(Sender: TObject);
begin
  isFirstPointRoute := True;
end;

procedure TfmLogisticTamplate.FormShow(Sender: TObject);
begin
  FrameShow(2);
  RefreshTemplate;
end;

procedure TfmLogisticTamplate.FrameShow(id: Integer);
begin
  case id of
    1:
    begin
      Self.Width := 356;
      grpLogisticEditor.Left := 9;
    end;
    2:
    begin
      Self.Width := 356;
      grpLogisticEditor.Left := 350;
    end;
  end;

  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
  begin
    cbbForce.Visible := True;
    lbl1.Visible := True
  end
  else
  begin
    cbbForce.Visible := False;
    lbl1.Visible := False;
  end;
end;

procedure TfmLogisticTamplate.lvLogisticRouteSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  if Selected then
  begin
    simMgrClient.DrawPointRouteTemporary.UnselectPointRoute;

    FPointRouteSelected := simMgrClient.DrawPointRouteTemporary.GetPointRoute(StrToInt(lvLogisticRoute.Selected.Caption));

    if Assigned(FPointRouteSelected) then
    begin
      FPointRouteSelected.isSelected := True;
      EditRoute;
    end;
  end
  else
  begin
    pnlInsert.Visible := False;
  end;
end;

procedure TfmLogisticTamplate.lvTemplatesSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  if Selected then
  begin
    FShipingRouteSelected := simMgrClient.SimShipingRoute.GetShipingRoute(StrToInt(lvTemplates.Selected.Caption));

    if Assigned(FShipingRouteSelected) then
    begin
      chkShow.Checked := FShipingRouteSelected.isShow;
      chkShow.Visible := True;
    end;
  end
  else
  begin
    chkShow.Visible := False;
  end;
end;

procedure TfmLogisticTamplate.NormalRoute;
var
  i, j : Integer;
  LogisticRoute : TPointRoute;
  LogisticTemplate : TMainShipingRoute;
begin
  for i := 0 to simMgrClient.SimShipingRoute.FList.Count - 1 do
  begin
    LogisticTemplate := simMgrClient.SimShipingRoute.FList.Items[i];
    LogisticTemplate.isShow := False;     // line shape visibility set to hide
    for j := 0 to LogisticTemplate.FList.Count - 1 do
    begin
      LogisticRoute := LogisticTemplate.FList.Items[j];
      LogisticRoute.isEdit := False;
      LogisticRoute.isSelected := False;
    end;

    if simMgrClient.ISInstructor or simMgrClient.ISWasdal then   // dng add filter line shape by force
    begin
      LogisticTemplate.isShow := True
    end;
    if simMgrClient.FMyCubGroup.FData.Force_Designation = LogisticTemplate.Force then
    begin
      LogisticTemplate.isShow := True;
    end;
  end;
end;

procedure TfmLogisticTamplate.RefreshTemplate;
var
  i, j : Integer;
  shipingRouteTemp : TMainShipingRoute;
begin
  lvTemplates.Items.Clear;

  for I := 0 to simMgrClient.SimShipingRoute.FList.Count - 1 do
  begin
    shipingRouteTemp := simMgrClient.SimShipingRoute.FList.Items[i];

    if Assigned(shipingRouteTemp) then
    begin
      case simMgrClient.ClientRole of
        crpInstruktur:
        begin
          with lvTemplates.Items.Add do
          begin
            Caption := IntToStr(shipingRouteTemp.ShipingRouteId);
            SubItems.Add(shipingRouteTemp.Name);
          end;
        end;
        crpCubicle:
        begin
          if shipingRouteTemp.Force = simMgrClient.FMyCubGroup.FData.Force_Designation then
          begin
            with lvTemplates.Items.Add do
            begin
              Caption := IntToStr(shipingRouteTemp.ShipingRouteId);
              SubItems.Add(shipingRouteTemp.Name);
            end;
          end;
        end;
      end;
    end;
  end;
  FrameShow(2);
end;

procedure TfmLogisticTamplate.RefreshRoute;
var
  i, j : Integer;
  pointRouteTemp : TPointRoute;

begin
  lvLogisticRoute.Items.Clear;

  simMgrClient.DrawPointRouteTemporary.UnselectPointRoute;
  simMgrClient.DrawPointRouteTemporary.UpdatePointRouteID;

  for i := 0 to simMgrClient.DrawPointRouteTemporary.FList.Count - 1 do
  begin
    j := i+1;

    pointRouteTemp := simMgrClient.DrawPointRouteTemporary.FList.Items[i];

    with lvLogisticRoute.Items.Add do
    begin
      Caption := IntToStr(pointRouteTemp.PointId);
      SubItems.Add('WP ' + IntToStr(j) + '-' + IntToStr(j+1));
      SubItems.Add(IntToStr(pointRouteTemp.Personel));
      SubItems.Add(FloatToStr(pointRouteTemp.Speed));
    end;
  end;
end;

end.
