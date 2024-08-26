unit uStrategiEditor;

interface

uses
  Windows, Messages, SysUtils, uFormUtil, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, uNetBaseSocket,

  ufTacticalDisplay, tttData, uMainStaticShape, uMainStrategi, uDrawStrategi, uMainPlottingShape,
  uT3GroupList, uBaseCoordSystem,  uGameData_TTT,  Mask, uLibSettingTTT, uSimbolTaktis;

type
  TfrmStrategiEditor = class(TForm)
    grpTemplate: TGroupBox;
    grpObjectEditor: TGroupBox;
    lblGroupEdit: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    edtBasePosX: TEdit;
    edtBasePosY: TEdit;
    btnBasePos: TSpeedButton;
    rbBlue: TRadioButton;
    rbRed: TRadioButton;
    Label5: TLabel;
    Label4: TLabel;
    pnlEmbark: TPanel;
    btnClearPlatform: TSpeedButton;
    btnAddPlatform: TSpeedButton;
    lvEmbark: TListView;
    edtNamePlatform: TEdit;
    edtQtyPlatform: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    pnlRadar: TPanel;
    lbl35: TLabel;
    lbl36: TLabel;
    pnlLogistik: TPanel;
    btnClearLogistic: TSpeedButton;
    btnAddLogistic: TSpeedButton;
    Label14: TLabel;
    Label15: TLabel;
    lvLogistic: TListView;
    edtNameLogistic: TEdit;
    cbbStatusLogistic: TComboBox;
    pnlIntelijen: TPanel;
    mmoIntel: TMemo;
    Label16: TLabel;
    btnApply: TSpeedButton;
    Bevel3: TBevel;
    pnlCreateNew: TPanel;
    Label1: TLabel;
    Label65: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    edtNamePlotting: TEdit;
    btnCreate: TButton;
    btnCancel: TButton;
    Bevel2: TBevel;
    pnlDefinition: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    lblGroup: TLabel;
    cbbTipe: TComboBox;
    Label7: TLabel;
    Label9: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    SpeedButton3: TSpeedButton;
    pnlPanah: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    edtEndPosX: TEdit;
    edtEndPosY: TEdit;
    btnEndPos: TSpeedButton;
    Label17: TLabel;
    pnlShare: TPanel;
    Bevel6: TBevel;
    Label27: TLabel;
    Label28: TLabel;
    btnSend: TSpeedButton;
    cbbConsoleList: TComboBox;
    Label22: TLabel;
    btnDeleteLogistic: TSpeedButton;
    btnEditLogistic: TSpeedButton;
    Label23: TLabel;
    Label24: TLabel;
    btnEditPlatform: TSpeedButton;
    btnDeletePlatform: TSpeedButton;
    Label25: TLabel;
    Label26: TLabel;
    lblFontTaktis: TLabel;
    btnTacticalSymbol: TSpeedButton;
    lbl1: TLabel;
    lbl2: TLabel;
    cbbDestination: TComboBox;
    pnlMain: TPanel;
    Bevel7: TBevel;
    btnNew: TSpeedButton;
    btnEdit: TSpeedButton;
    btnDelete: TSpeedButton;
    btnCloseTemplate: TSpeedButton;
    chkHideAll: TCheckBox;
    chkShowAll: TCheckBox;
    chkShow: TCheckBox;
    lvPlotting: TListView;
    edtrange: TEdit;

    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lvTemplatesSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);

    procedure btnBasePosClick(Sender: TObject);
    procedure btnAddEmbarkClick(Sender: TObject);
    procedure ClearEditText();

    procedure btnHandleTemplate(Sender: TObject);
    procedure btnHandleEditor(Sender: TObject);

//    procedure EditorShow;

//    procedure cbbTipeChange(Sender: TObject);

    procedure btnPlatformHandle(Sender: TObject);
    procedure btnShowHandle(Sender: TObject);

    procedure btnLogisticHandle(Sender: TObject);
    procedure ReadOnlycbb(Sender: TObject; var Key: Char);
    procedure btnSendClick(Sender: TObject);
    procedure lvLogisticSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure lvEmbarkSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure btnTacticalSymbolClick(Sender: TObject);


  private
    FisInputProblem : Boolean;
    { Private declarations }
    procedure RefresChkShow;
  public
    SelectedPlottingId : Integer;
    FSelectedPlotting : TMainPlottingShape;

    flagBtn : Integer;
    IdSelectedLogistic, IdSelectedEmbark : Integer;
    xTemp, yTemp : Double;

    function CekInput(Id : Integer): Boolean;
    function GetIdentity:Integer;
    function SelectPlotting: Boolean;
    procedure SetIdentity(val : Integer);

    procedure Apply;

    procedure GbrIntelejen;
    procedure GbrLogistic;
    procedure GbrRadar;
    procedure GbrPangkalan;
    procedure GbrPanah;

    procedure Repost;

    procedure RefreshLLogistic;
    procedure RefreshLEmbark;

    procedure RefreshLTemplate;
    procedure NewTemplate;
    procedure AddTemplate;
    procedure EditTemplate;
    procedure DeleteTemplate;
    procedure ShowPropTemplate;

    procedure ClearFlagPoint;
    procedure AddFlag(id : integer);
  end;

var
  frmStrategiEditor: TfrmStrategiEditor;

implementation

{$R *.dfm}

uses uSimMgr_Client, uDBCubicles, ufrmKeyboard;

procedure TfrmStrategiEditor.AddFlag(id: integer);
var
  ObjectFlagPoint : TFlagPoint;
begin
  ObjectFlagPoint := simMgrClient.DrawFlagPoint.GetFlagPoint(id);
  if Assigned(ObjectFlagPoint)  then
  begin
    ObjectFlagPoint.Post.X := xTemp;
    ObjectFlagPoint.Post.Y := yTemp;
  end
  else
  begin
    ObjectFlagPoint := TFlagPoint.Create(simMgrClient.Converter);
    ObjectFlagPoint.PointId := id;
    ObjectFlagPoint.Post.X := xTemp;
    ObjectFlagPoint.Post.Y := yTemp;
    simMgrClient.DrawFlagPoint.FList.Add(ObjectFlagPoint);
  end;
end;

procedure TfrmStrategiEditor.AddTemplate;
var
  i : Integer;
  rec : TRecCmd_PlottingShape;
begin
  rec.IdAction := caAdd;

  rec.TemplateName := edtNamePlotting.Text;
  rec.PostStart.X := 0;
  rec.PostStart.Y := 0;
  rec.PostEnd.X := 0;
  rec.PostEnd.Y := 0;
  rec.Tipe := cbbTipe.ItemIndex;
  rec.Radius := 0;
  rec.role := simMgrClient.ConsoleRole;
  rec.roleName := simMgrClient.ConsoleName;

  case cbbDestination.ItemIndex of
    0: rec.Force := 3;
    1: rec.Force := 1;
  end;

  for i := 0 to 12 do
  begin
    rec.Data[i] := '';
    rec.Status[i] := '';
    rec.Simbol[i] := '';
    rec.Quantity[i] := 0;
  end;

  simMgrClient.netSend_CmdPlottingShape(rec);
end;

procedure TfrmStrategiEditor.Apply;
begin
  case FSelectedPlotting.Tipe of
    0: GbrIntelejen;
    1: GbrLogistic;
    2: GbrRadar;
    3: GbrPangkalan;
    4: GbrPanah;
  end;
end;

procedure TfrmStrategiEditor.btnAddEmbarkClick(Sender: TObject);
begin
  with lvEmbark.Items.Add do
  begin
    SubItems.Add('1');
  end;
end;

procedure TfrmStrategiEditor.btnLogisticHandle(Sender: TObject);
begin
  if ((edtNameLogistic.Text = '') or (cbbStatusLogistic.Text = '')) and
     (TSpeedButton(Sender).Tag <> 4) then
  begin
    ShowMessage('Incomplete data input');
    Exit;
  end;

  case TSpeedButton(Sender).Tag of
    1: {Add}
    begin
      with lvLogistic.Items.Add do
      begin
        Caption := edtNameLogistic.Text;
        SubItems.Add(cbbStatusLogistic.Text);
      end;
    end;
    2:{Edit}
    begin
      with lvLogistic.Items[IdSelectedLogistic] do
      begin
        Caption := edtNameLogistic.Text;
        SubItems[0] := cbbStatusLogistic.Text;
      end;

    end;
    3:{Delete}
    begin
      lvLogistic.Items.Delete(IdSelectedLogistic);
    end;
    4:{Clear}
    begin
      lvLogistic.Items.Clear;
    end;
  end;

  RefreshLLogistic;
end;

procedure TfrmStrategiEditor.btnPlatformHandle(Sender: TObject);
begin
  if (edtNamePlatform.Text = '') or (edtQtyPlatform.Text = '') and
     (TSpeedButton(Sender).Tag <> 4) then
  begin
    ShowMessage('Incomplete data input');
    Exit;
  end;

  case TSpeedButton(Sender).Tag of
    1: {Add}
    begin
      with lvEmbark.Items.Add do
      begin
        Caption := edtNamePlatform.Text;
        SubItems.Add(edtQtyPlatform.Text);
        SubItems.Add(lblFontTaktis.Caption);
      end;
    end;
    2:{Edit}
    begin
      with lvEmbark.Items[IdSelectedEmbark] do
      begin
        Caption := edtNamePlatform.Text;
        SubItems[0] := edtQtyPlatform.Text;
        SubItems[1] := lblFontTaktis.Caption;
      end;
    end;
    3:{Delete}
    begin
      lvEmbark.Items.Delete(IdSelectedEmbark);
    end;
    4:{Clear}
    begin
      lvEmbark.Items.Clear;
    end;
  end;
  RefreshLEmbark;
end;

procedure TfrmStrategiEditor.btnBasePosClick(Sender: TObject);
begin
  frmTacticalDisplay.Map1.CurrentTool := mtAddPlotting;
  flagBtn := TSpeedButton(Sender).Tag;
end;

procedure TfrmStrategiEditor.btnHandleEditor(Sender: TObject);
var
  i : Integer;
  plotting : TMainPlottingShape;
  isflag : Boolean;
begin
  case TButton(Sender).Tag of
    0: {Apply}
    begin
      Apply;

      if FisInputProblem  then
        Exit;

      RefreshLTemplate;
      ClearEditText;
      ClearFlagPoint;
      frmTacticalDisplay.Map1.CurrentTool := mtSelectObject;
    end;
    1: {Cancel}
    begin
      RefreshLTemplate;
    end;
  end;
end;

procedure TfrmStrategiEditor.btnHandleTemplate(Sender: TObject);
begin
  pnlDefinition.Visible := False;
  case TSpeedButton(Sender).Tag of
    0: {New}
    begin
      NewTemplate;
    end;
    1:{Edit}
    begin
      EditTemplate;
    end;
    2:{Delete}
    begin
     DeleteTemplate;
    end;
    3:{Close}
    begin
      Close;
    end;
    4:{Create}
    begin
      AddTemplate;
    end;
    5:{Cancel}
    begin
      pnlMain.BringToFront;
    end;
  end;
end;

procedure TfrmStrategiEditor.btnSendClick(Sender: TObject);
begin
//  if simMgrClient.ISWasdal or simMgrClient.ISInstructor then
//  begin
//    if FConsoleName = 'Controller' then
//    begin
//      ShowMessage('You don''t have permission to share these plotting ');
//      Exit;
//    end;
//  end;
//
//
//  if cbbConsoleList.Text = '' then
//    Exit;
//
//  Apply;
//  ShowMessage('The data has been sent');
end;

procedure TfrmStrategiEditor.btnShowHandle(Sender: TObject);
var
  plottingTemp : TMainPlottingShape;
  I : Integer;
begin
  case TCheckBox(Sender).Tag of
    1: {Show}
    begin
      if Assigned(FSelectedPlotting) then
      begin
        FSelectedPlotting.isShow := chkShow.Checked;

        chkShowAll.Checked := False;
        chkHideAll.Checked := False;
      end;
    end;
    2:  {Show All}
    begin
      for I := 0 to simMgrClient.SimPlotting.FList.Count - 1 do
      begin
        plottingTemp := simMgrClient.SimPlotting.FList.Items[I];

        if plottingTemp.IsCreate then
          plottingTemp.isShow := True;
      end;
    end;
    3: {Hide All}
    begin
      for I := 0 to simMgrClient.SimPlotting.FList.Count - 1 do
      begin
        plottingTemp := simMgrClient.SimPlotting.FList.Items[I];

        if plottingTemp.IsCreate then
          plottingTemp.isShow := False;
      end;
    end;
  end;
end;

procedure TfrmStrategiEditor.btnTacticalSymbolClick(Sender: TObject);
begin
  frmSimbolTaktis.drwgrdFontTaktis.RowCount := 184;
  frmSimbolTaktis.ShowModal;
end;

procedure TfrmStrategiEditor.ReadOnlycbb(Sender: TObject;
  var Key: Char);
begin
  Key := #0;
  Exit;
end;


function TfrmStrategiEditor.CekInput(Id: Integer): Boolean;
begin
  Result := False;

  if (edtBasePosX.Text = '') and (edtBasePosY.Text = '') then
    Result := True
  else
  begin
    case id of
      plIntelijen:
      begin
        if mmoIntel.Text = '' then
          Result := True;
      end;
      plLogistic:
      begin
        if lvLogistic.Items.Count < 1 then
          Result := True;
      end;
      plRadar:
      begin
        if (edtRange.Text = '') then
          Result := True;
      end;
      plPangkalan:
      begin
        if lvEmbark.Items.Count < 1 then
          Result := True;
      end;
      plPanah:
      begin
        if (edtEndPosX.Text = '') and (edtEndPosY.Text = '') then
          Result := True;
      end;
    end;
  end;

  if Result then
  begin
    FisInputProblem := True;
  end;
end;

procedure TfrmStrategiEditor.ClearEditText;
begin
  edtBasePosX.Text := '';
  edtBasePosY.Text := '';
  edtEndPosX.Text := '';
  edtEndPosY.Text := '';
  edtrange.Text := '1';
  rbRed.Checked := True;
  mmoIntel.Clear;
  lvLogistic.Clear;
  lvEmbark.Clear;
end;

procedure TfrmStrategiEditor.ClearFlagPoint;
begin
  simMgrClient.DrawFlagPoint.Clear;
end;

procedure TfrmStrategiEditor.DeleteTemplate;
var
  rec : TRecCmd_PlottingShape;

begin
  if Assigned(FSelectedPlotting) then
  begin
    if simMgrClient.ConsoleRole <> FSelectedPlotting.Role then
    begin
      ShowMessage('You don''t have permission to delete this plotting');
      Exit;
    end;

    rec.PlottingID := FSelectedPlotting.PlottingId;
    rec.IdAction := caDelete;

    {Kirim data disini}
    simMgrClient.netSend_CmdPlottingShape(rec);

    RefreshLTemplate;

    btnDelete.Enabled := False;
    btnEdit.Enabled := False;
  end;
end;


procedure TfrmStrategiEditor.EditTemplate;
var
  j : Integer;
  isEditTemp : Boolean;

  OTemp1      : TVehicleOnBase;
  OTemp2      : TLogisticOnBase;
  OTemp3      : TIntelijenInfo;

  intelPlotTemp : TIntelijenPlotting;
  logPlotTemp   : TLogisticPlotting;
  radarPlotTemp : TRadarPlotting;
  basePlotTemp  : TPangkalanPlotting;
  arrowPlotTemp : TPanahPlotting;

begin
  if Assigned(FSelectedPlotting) then
  begin
    isEditTemp := False;

    case simMgrClient.ConsoleRole of
      krInstruktur, kr2DViewer, krMiddleWasdal, krSideWasdal :
      begin
        isEditTemp := (FSelectedPlotting.role <> krPlotter) and (FSelectedPlotting.role <> krOperator)
      end;
      krPlotter, krOperator :
      begin
        isEditTemp := FSelectedPlotting.roleName = simMgrClient.ConsoleName;
      end;
    end;

    if isEditTemp then
    begin
      edtNamePlotting.Text := FSelectedPlotting.Name;
      edtBasePosX.Text := formatDMS_long(FSelectedPlotting.postCenter.X);
      edtBasePosY.Text := formatDMS_latt(FSelectedPlotting.postCenter.Y);

      SetIdentity(FSelectedPlotting.Identity);

      case FSelectedPlotting.Tipe of
        plIntelijen :
        begin
          {$REGION ' Intelijen '}
          lblGroupEdit.Caption := 'Intelijen';

          intelPlotTemp := TIntelijenPlotting(FSelectedPlotting);

          mmoIntel.Clear;
          for j := 0 to intelPlotTemp.InfoList.Count - 1 do
          begin
            OTemp3 := intelPlotTemp.InfoList[j];

            mmoIntel.Lines.Append(OTemp3.Info)
          end;
          pnlIntelijen.BringToFront;
          {$ENDREGION}
        end;
        plLogistic :
        begin
          {$REGION ' Logistic '}
          lblGroupEdit.Caption := 'Logistik';

          logPlotTemp := TLogisticPlotting(FSelectedPlotting);

          lvLogistic.Items.Clear;
          for j := 0 to logPlotTemp.LogisticList.Count - 1 do
          begin
            OTemp2 := logPlotTemp.LogisticList[j];

            with lvLogistic.Items.Add do
            begin
              Caption := OTemp2.Name;
              SubItems.Add(OTemp2.Status);
            end;
          end;
          pnlLogistik.BringToFront;
          {$ENDREGION}
        end;
        plRadar :
        begin
          {$REGION ' Radar '}
          radarPlotTemp := TRadarPlotting(FSelectedPlotting);
          edtrange.Text := floatToStr(radarPlotTemp.Radius);

          pnlRadar.BringToFront;
          {$ENDREGION}
        end;
        plPangkalan :
        begin
          {$REGION ' Pangkalan '}
          lblGroupEdit.Caption := 'Pangkalan';
          basePlotTemp := TPangkalanPlotting(FSelectedPlotting);

          lvEmbark.Items.Clear;
          for j := 0 to basePlotTemp.VehiclesList.Count - 1 do
          begin
            OTemp1 := basePlotTemp.VehiclesList[j];

            with lvEmbark.Items.Add do
            begin
              Caption := OTemp1.Name;
              SubItems.Add(IntToStr(OTemp1.Quantity));
              SubItems.Add(OTemp1.Simbol);
            end;
          end;

          pnlEmbark.BringToFront;
          {$ENDREGION}
        end;
        plPanah :
        begin
          {$REGION ' Panah '}
          lblGroupEdit.Caption := 'Panah';
          arrowPlotTemp := TPanahPlotting(FSelectedPlotting);

          edtEndPosX.Text := formatDMS_long(arrowPlotTemp.postEnd.X);
          edtEndPosY.Text := formatDMS_latt(arrowPlotTemp.postEnd.Y);

          pnlPanah.BringToFront;
          {$ENDREGION}
        end;
      end;
      grpObjectEditor.BringToFront;
    end
    else
      ShowMessage('You can not edit this template');
  end;
end;

procedure TfrmStrategiEditor.FormActivate(Sender: TObject);
begin
  frmKeyboard.HandleOfTheTargetForm := Self.Handle;
end;

procedure TfrmStrategiEditor.FormShow(Sender: TObject);
begin
  AlignFormToMonitor(0, apLeftTop, 3, 65, TForm(self));

  Self.Height := 527;
  Self.Width := 362;

  grpObjectEditor.Left := 17;
  grpTemplate.Left := 17;

  RefreshLTemplate;
  RefresChkShow;

  pnlMain.BringToFront;
end;

procedure TfrmStrategiEditor.GbrIntelejen;
var
  i : Integer;
  rec : TRecCmd_PlottingShape;

begin
  if CekInput(plIntelijen) then
    Exit;

  rec.PlottingID := FSelectedPlotting.PlottingId;
  rec.TemplateName := FSelectedPlotting.Name;
  rec.PostStart.X := dmsToLong(edtBasePosX.Text);
  rec.PostStart.Y := dmsToLatt(edtBasePosY.Text);
  rec.IdAction := caEdit;
  rec.Tipe := FSelectedPlotting.Tipe;
  rec.Identity := GetIdentity;
  rec.Force := FSelectedPlotting.Force;
//  rec.isShow := True;
  rec.role := FSelectedPlotting.Role;
  rec.roleName := FSelectedPlotting.roleName;

  for i := 0 to 12 do
  begin
    rec.Data[i] := '';
    rec.Status[i] := '';
    rec.Simbol[i] := '';
    rec.Quantity[i] := 0;
  end;

  for I := 0 to mmoIntel.Lines.Count - 1 do
  begin
    rec.Data[i] := mmoIntel.Lines.Strings[i];
  end;

  simMgrClient.netSend_CmdPlottingShape(rec);
end;

procedure TfrmStrategiEditor.GbrLogistic;
var
  i : Integer;
  li : TListItem;
  rec : TRecCmd_PlottingShape;

begin
  if CekInput(plLogistic) then
    Exit;

  rec.PlottingID := FSelectedPlotting.PlottingId;
  rec.TemplateName := FSelectedPlotting.Name;
  rec.PostStart.X := dmsToLong(edtBasePosX.Text);
  rec.PostStart.Y := dmsToLatt(edtBasePosY.Text);
  rec.IdAction := caEdit;
  rec.Tipe := FSelectedPlotting.Tipe;
  rec.Identity := GetIdentity;
  rec.Force := FSelectedPlotting.Force;
//  rec.isShow := True;
  rec.role := FSelectedPlotting.Role;
  rec.roleName := FSelectedPlotting.roleName;

  for i := 0 to 12 do
  begin
    rec.Data[i] := '';
    rec.Status[i] := '';
    rec.Simbol[i] := '';
    rec.Quantity[i] := 0;
  end;

  for i := 0 to lvLogistic.Items.Count - 1 do
  begin
    li := lvLogistic.Items[i];
    rec.Data[i] := li.Caption;
    rec.Status[i] := li.SubItems[0];
  end;

  simMgrClient.netSend_CmdPlottingShape(rec);
end;

procedure TfrmStrategiEditor.GbrPanah;
var
  i : Integer;
  rec : TRecCmd_PlottingShape;

begin
  if CekInput(plPanah) then
    Exit;

  rec.PlottingID := FSelectedPlotting.PlottingId;
  rec.TemplateName := FSelectedPlotting.Name;
  rec.PostStart.X := dmsToLong(edtBasePosX.Text);
  rec.PostStart.Y := dmsToLatt(edtBasePosY.Text);
  rec.IdAction := caEdit;
  rec.Tipe := FSelectedPlotting.Tipe;
  rec.Identity := GetIdentity;
  rec.Force := FSelectedPlotting.Force;
//  rec.isShow := True;
  rec.role := FSelectedPlotting.Role;
  rec.roleName := FSelectedPlotting.roleName;

  for i := 0 to 12 do
  begin
    rec.Data[i] := '';
    rec.Status[i] := '';
    rec.Simbol[i] := '';
    rec.Quantity[i] := 0;
  end;

  rec.PostEnd.X := dmsToLong(edtEndPosX.Text);
  rec.PostEnd.Y := dmsToLatt(edtEndPosY.Text);

  simMgrClient.netSend_CmdPlottingShape(rec);
end;

procedure TfrmStrategiEditor.GbrPangkalan;
var
  i : Integer;
  li : TListItem;
  rec : TRecCmd_PlottingShape;

begin
  if CekInput(plPangkalan) then
    Exit;

  rec.PlottingID := FSelectedPlotting.PlottingId;
  rec.TemplateName := FSelectedPlotting.Name;
  rec.PostStart.X := dmsToLong(edtBasePosX.Text);
  rec.PostStart.Y := dmsToLatt(edtBasePosY.Text);
  rec.IdAction := caEdit;
  rec.Tipe := FSelectedPlotting.Tipe;
  rec.Identity := GetIdentity;
  rec.Force := FSelectedPlotting.Force;
//  rec.isShow := True;
  rec.role := FSelectedPlotting.Role;
  rec.roleName := FSelectedPlotting.roleName;

  for i := 0 to 12 do
  begin
    rec.Data[i] := '';
    rec.Status[i] := '';
    rec.Simbol[i] := '';
    rec.Quantity[i] := 0;
  end;

  for i := 0 to lvEmbark.Items.Count - 1 do
  begin
    li := lvEmbark.Items[i];
    rec.Data[i] := li.Caption;
    rec.Quantity[i] := StrToInt(li.SubItems[0]);
    rec.Simbol[i] := li.SubItems[1];
  end;

  simMgrClient.netSend_CmdPlottingShape(rec);
end;

procedure TfrmStrategiEditor.GbrRadar;
var
  i : Integer;
  rec : TRecCmd_PlottingShape;

begin
  if CekInput(plRadar) then
    Exit;

  rec.PlottingID := FSelectedPlotting.PlottingId;
  rec.TemplateName := FSelectedPlotting.Name;
  rec.PostStart.X := dmsToLong(edtBasePosX.Text);
  rec.PostStart.Y := dmsToLatt(edtBasePosY.Text);
  rec.IdAction := caEdit;
  rec.Tipe := FSelectedPlotting.Tipe;
  rec.Identity := GetIdentity;
  rec.Force := FSelectedPlotting.Force;
//  rec.isShow := True;
  rec.role := FSelectedPlotting.Role;
  rec.roleName := FSelectedPlotting.roleName;

  for i := 0 to 12 do
  begin
    rec.Data[i] := '';
    rec.Status[i] := '';
    rec.Simbol[i] := '';
    rec.Quantity[i] := 0;
  end;

  rec.Radius := StrToFloat(edtrange.Text);

  simMgrClient.netSend_CmdPlottingShape(rec);
end;

procedure TfrmStrategiEditor.lvEmbarkSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  li : TListItem;
begin
  if Selected then
  begin
    IdSelectedEmbark := lvEmbark.Selected.Index;

    li := lvEmbark.Items[IdSelectedEmbark];
    edtNamePlatform.Text := li.Caption;
    edtQtyPlatform.Text := li.SubItems[0];
    lblFontTaktis.Caption := li.SubItems[1];

    btnEditPlatform.Enabled := True;
    btnDeletePlatform.Enabled := True;
  end
  else
  begin
    btnEditPlatform.Enabled := False;
    btnDeletePlatform.Enabled := False;
  end;
end;

procedure TfrmStrategiEditor.lvLogisticSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  li : TListItem;
begin
  if Selected then
  begin
    IdSelectedLogistic := lvLogistic.Selected.Index;

    li := lvLogistic.Items[IdSelectedLogistic];
    edtNameLogistic.Text := li.Caption;
    cbbStatusLogistic.Text := li.SubItems[0];

    btnEditLogistic.Enabled := True;
    btnDeleteLogistic.Enabled := True;
  end
  else
  begin
    btnEditLogistic.Enabled := False;
    btnDeleteLogistic.Enabled := False;
  end;
end;

procedure TfrmStrategiEditor.lvTemplatesSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  if Selected then
  begin

    SelectedPlottingId := StrToInt(lvPlotting.Selected.Caption);

    FSelectedPlotting := simMgrClient.SimPlotting.GetPlotting(SelectedPlottingId);

    if Assigned(FSelectedPlotting) then
    begin
      chkShow.Checked := FSelectedPlotting.isShow;

      btnEdit.Enabled := True;
      btnDelete.Enabled := True;
    end;

  end
  else
  begin
    btnEdit.Enabled := False;
    btnDelete.Enabled := False;
  end;
end;

procedure TfrmStrategiEditor.NewTemplate;
var
  NewGroup : Integer;
begin
  cbbDestination.ItemIndex := 0;
  cbbDestination.Enabled := True;

  edtNamePlotting.Text := 'New Plotting';
  cbbTipe.ItemIndex := 0;

  RefreshLTemplate;
  ClearEditText;

//  FConsoleName := simMgrClient.ConsoleName;
//  FTipePlotting  := plIntelijen;

  pnlCreateNew.BringToFront;
end;

procedure TfrmStrategiEditor.RefresChkShow;
var
  I, k, j: Integer;
  plot : TMainPlottingShape;
begin
  k := 0;
  j := 0;
  for I := 0 to simMgrClient.SimPlotting.FList.Count - 1 do
  begin
    plot := simMgrClient.SimPlotting.FList.Items[I];
    if plot.IsCreate then
    begin
      j := j +1;
      if plot.isShow then
      begin
        k := k + 1 ;
      end;
    end;
  end;
  if j = k then
  begin
     chkShowAll.Checked := True;
     chkHideAll.Checked := False;
     chkShow.Checked := False;
  end
  else
  if k = 0 then
  begin
    chkHideAll.Checked := True;
    chkShowAll.Checked := false;
    chkShow.Checked := False;
  end
  else
  if k < j then
  begin
    chkShow.Checked := True;
    chkHideAll.Checked := False;
    chkShowAll.Checked := false;
  end;
end;

procedure TfrmStrategiEditor.RefreshLEmbark;
begin
  edtNamePlatform.Text := '';
  edtQtyPlatform.Text := '';
  lblFontTaktis.Caption := '';
  btnEditPlatform.Enabled := False;
  btnDeletePlatform.Enabled := False;
end;

procedure TfrmStrategiEditor.RefreshLLogistic;
begin
  edtNameLogistic.Text := '';
  cbbStatusLogistic.Text := 'Cukup';
  btnEditLogistic.Enabled := False;
  btnDeleteLogistic.Enabled := False;
end;

procedure TfrmStrategiEditor.RefreshLTemplate;
var
  i : Integer;
  Plotting : TMainPlottingShape;
  force, tipe : string;
  isPrintTemp : Boolean;
begin
  lvPlotting.Items.Clear;

  {$REGION ' Update List Plotting '}
  for i := 0 to simMgrClient.SimPlotting.FList.Count - 1 do
  begin
    isPrintTemp := False;

    Plotting := simMgrClient.SimPlotting.FList.Items[i];

    case Plotting.Role of
      krInstruktur, kr2DViewer, krMiddleWasdal, krSideWasdal :
      begin
        {jk yg menerima console operator}
        if simMgrClient.ClientRole = crpCubicle then
        begin
          if simMgrClient.FMyCubGroup.FData.Force_Designation = Plotting.Force then
            isPrintTemp := True;
        end
        {jk yg menerima console instruktur}
        else
        begin
          isPrintTemp := True;
        end;
      end;
      krPlotter, krOperator :
      begin
        if Plotting.RoleName = simMgrClient.ConsoleName then
        begin
          isPrintTemp := True;
        end;
      end;
    end;

    if isPrintTemp then
    begin
      with lvPlotting.Items.Add do
      begin
        Caption := IntToStr(Plotting.PlottingId);
        SubItems.Add(Plotting.Name);

        case Plotting.Tipe of
          0 : tipe := 'Intelijen';
          1 : tipe := 'Logistik';
          2 : tipe := 'Radar';
          3 : tipe := 'Pangkalan';
          4 : tipe := 'Panah';
        end;
        SubItems.Add(tipe);

        case Plotting.force of
          1 : force := 'Red';
          3 : force := 'Blue';
        end;
        SubItems.Add(force);

        case Plotting.role of
          krInstruktur, kr2DViewer : SubItems.Add('Controller');
          krMiddleWasdal, krSideWasdal : SubItems.Add('Wasdal');
          krPlotter : SubItems.Add('Plotter');
          krOperator : SubItems.Add('Operator');
        end;
      end;
    end;
  end;
  {$ENDREGION}

  RefresChkShow;

  FSelectedPlotting := nil;

  grpTemplate.BringToFront;
  pnlMain.BringToFront;

  btnEdit.Enabled := False;
  btnDelete.Enabled := False;
end;

procedure TfrmStrategiEditor.Repost;
var
  i, k : Integer;

  OTemp1  : TVehicleOnBase;
  OTemp2  : TLogisticOnBase;
  OTemp3  : TIntelijenInfo;

  OIntelijen  : TIntelijenPlotting;
  OLogistic   : TLogisticPlotting;
  ORadar      : TRadarPlotting;
  OPangkalan  : TPangkalanPlotting;
  OPanah      : TPanahPlotting;

  item : TMainPlottingShape;

  recShape : TRecCmd_PlottingShape;
begin
  for k := 0 to simMgrClient.SimPlotting.FList.Count - 1 do
  begin
    item := simMgrClient.SimPlotting.FList.Items[k];

    if (item.isRepostPlot) then
    begin
      recShape.TemplateName := item.Name;
      recShape.SendTo := 0;
//      recShape.Group := item.Group;
      recShape.IdAction := 2;
      recShape.PostStart := item.postCenter;
      recShape.Tipe := item.Tipe;
      recShape.Identity := item.Identity;
      recShape.isShow := item.isShow;

       case item.Tipe of
        0: {GbrIntelijen;}
        begin
          OIntelijen := TIntelijenPlotting(item);
//          recShape.StateKiriman := 0;

          for I := 0 to OIntelijen.InfoList.Count - 1 do
          begin
            OTemp3  := OIntelijen.InfoList.Items[i];
//            recShape.Words := OTemp3.Info;

//            if i = OIntelijen.InfoList.Count - 1 then
//              recShape.StateKiriman := 1;

            simMgrClient.netSend_CmdPlottingShape(recShape);
          end;
        end;
        1: {GbrLogistic;}
        begin
          OLogistic := TLogisticPlotting(item);
//          recShape.StateKiriman := 0;

          for i := 0 to OLogistic.LogisticList.Count - 1 do
          begin
            OTemp2  := OLogistic.LogisticList.Items[i];

//            recShape.Words := OTemp2.Name;
//            recShape.Status := OTemp2.Status;

//            if i = OLogistic.LogisticList.Count - 1 then
//              recShape.StateKiriman := 1;

            simMgrClient.netSend_CmdPlottingShape(recShape);
          end;
        end;
        2:
        begin {GbrRadar;}
          ORadar := TRadarPlotting(item);
          recShape.Radius := ORadar.Radius;
//          recShape.StateKiriman := 1;
          simMgrClient.netSend_CmdPlottingShape(recShape);
        end;
        3: {GbrPangkalan;}
        begin
          OPangkalan := TPangkalanPlotting(item);
//          recShape.StateKiriman := 0;

          for i := 0 to OPangkalan.VehiclesList.Count - 1 do
          begin
            OTemp1  := OPangkalan.VehiclesList.Items[i];

//            recShape.Words := OTemp1.Name;
//            recShape.Quantity := OTemp1.Quantity;
//            recShape.Simbol := OTemp1.Simbol;

//            if i = OPangkalan.VehiclesList.Count - 1 then
//              recShape.StateKiriman := 1;

            simMgrClient.netSend_CmdPlottingShape(recShape);
          end;
        end;
        4:
        begin
          OPanah  := TPanahPlotting(item);

          recShape.PostEnd:= OPanah.postEnd;
//          recShape.StateKiriman := 1;
          simMgrClient.netSend_CmdPlottingShape(recShape);
        end;
      end;
      Exit;
    end;
  end;
end;

//procedure TfrmStrategiEditor.SelectTemplate;
//var
//  j : Integer;
//
//  OTemp1      : TVehicleOnBase;
//  OTemp2      : TLogisticOnBase;
//  OTemp3      : TIntelijenInfo;
//
//  OIntelijen  : TIntelijenPlotting;
//  OLogistic   : TLogisticPlotting;
//  ORadar      : TRadarPlotting;
//  OPangkalan  : TPangkalanPlotting;
//  OPanah      : TPanahPlotting;
//
//begin
//  if Assigned(FSelectedPlotting) then
//  begin
//    EditTemplate
////    FConsoleName := FSelectedPlotting.Group;
////    FTipePlotting := FSelectedPlotting.Tipe;
//
//    edtNamePlotting.Text := FSelectedPlotting.Name;
//    edtBasePosX.Text := formatDMS_long(FSelectedPlotting.postCenter.X);
//    edtBasePosY.Text := formatDMS_latt(FSelectedPlotting.postCenter.Y);
//
//  //  CoSetIdentitySelectedPlotting.color);
//
//    case FTipePlotting of
//      0 : lblGroup.Caption := 'Intelijen';
//      1 : lblGroup.Caption := 'Logistik';
//      2 : lblGroup.Caption := 'Radar';
//      3 : lblGroup.Caption := 'Pangkalan';
//      4 : lblGroup.Caption := 'Panah';
//    end;
//
//    FSelectedPlotting.isRepostProperty := False;
//
//    grpObjectEditor.BringToFront;
//
//    {$REGION ' Intelejen Section '}
//    if FSelectedPlotting is TIntelijenPlotting then
//    begin
//      OIntelijen := TIntelijenPlotting(FSelectedPlotting);
//
//      mmoIntel.Clear;
//      for j := 0 to OIntelijen.InfoList.Count - 1 do
//      begin
//        OTemp3 := OIntelijen.InfoList[j];
//
//        mmoIntel.Lines.Append(OTemp3.Info)
//      end;
//      pnlIntelijen.BringToFront;
//    end
//    else
//    {$ENDREGION}
//
//    {$REGION ' Logistic Section '}
//    if FSelectedPlotting is TLogisticPlotting then
//    begin
//      OLogistic := TLogisticPlotting(FSelectedPlotting);
//
//      lvLogistic.Items.Clear;
//      for j := 0 to OLogistic.LogisticList.Count - 1 do
//      begin
//        OTemp2 := OLogistic.LogisticList[j];
//
//        with lvLogistic.Items.Add do
//        begin
//          Caption := OTemp2.Name;
//          SubItems.Add(OTemp2.Status);
//        end;
//      end;
//      pnlLogistik.BringToFront;
//    end
//    else
//    {$ENDREGION}
//
//    {$REGION ' Radar Section '}
//    if FSelectedPlotting is TRadarPlotting then
//    begin
//      ORadar := TRadarPlotting(FSelectedPlotting);
//      edtrange.Text := floatToStr(ORadar.Radius);
//
//      pnlRadar.BringToFront;
//    end
//    else
//    {$ENDREGION}
//
//    {$REGION ' Pangkalan Section '}
//    if FSelectedPlotting is TPangkalanPlotting then
//    begin
//      OPangkalan := TPangkalanPlotting(FSelectedPlotting);
//
//      lvEmbark.Items.Clear;
//      for j := 0 to OPangkalan.VehiclesList.Count - 1 do
//      begin
//        OTemp1 := OPangkalan.VehiclesList[j];
//
//        with lvEmbark.Items.Add do
//        begin
//          Caption := OTemp1.Name;
//          SubItems.Add(IntToStr(OTemp1.Quantity));
//          SubItems.Add(OTemp1.Simbol);
//        end;
//      end;
//
//      pnlEmbark.BringToFront;
//    end
//    else
//    {$ENDREGION}
//
//    {$REGION ' Panah Section '}
//    if FSelectedPlotting is TPanahPlotting then
//    begin
//      OPanah := TPanahPlotting(FSelectedPlotting);
//
//      edtEndPosX.Text := formatDMS_long(OPanah.postEnd.X);
//      edtEndPosY.Text := formatDMS_latt(OPanah.postEnd.Y);
//
//      pnlPanah.BringToFront;
//    end;
//    {$ENDREGION}
//
//    btnSend.Enabled := True;
//  end;
//
//
//end;

function TfrmStrategiEditor.SelectPlotting : Boolean;
begin
  FSelectedPlotting := simMgrClient.SimPlotting.GetPlotting(SelectedPlottingId);
end;

procedure TfrmStrategiEditor.ShowPropTemplate;
begin
  FSelectedPlotting := simMgrClient.SimPlotting.GetPlotting(SelectedPlottingId);
  if Assigned(FSelectedPlotting) then
  begin
    if FSelectedPlotting.isShow then
      FSelectedPlotting.isShow := False
    else
      FSelectedPlotting.isShow := True;
  end;
end;

function TfrmStrategiEditor.GetIdentity: Integer;
begin
  if rbBlue.Checked then
    Result := clBlue
  else
    Result := clRed;
end;

procedure TfrmStrategiEditor.SetIdentity(val: Integer);
begin
  if val = clBlue then
    rbBlue.Checked := True
  else
    rbRed.Checked := True;
end;

end.
