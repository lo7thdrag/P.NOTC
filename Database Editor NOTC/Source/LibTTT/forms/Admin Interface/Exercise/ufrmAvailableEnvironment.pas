unit ufrmAvailableEnvironment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmAvailableEnvironment = class(TForm)
    lbEnvironmentList: TListBox;
    lbTempId: TListBox;
    lbTempIdArea: TListBox;
    btnCopy: TImage;
    btnDelete: TImage;
    btnEdit: TImage;
    btnNew: TImage;
    btnUsage: TImage;
    Image1: TImage;
    Image2: TImage;
    Label2: TLabel;
    Image3: TImage;
    lblsearch: TLabel;
    Label1: TLabel;
    edtavailableenv: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btCopyClick(Sender: TObject);
    procedure lbEnvironmentListClick(Sender: TObject);
    procedure btRemoveClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btUsageClick(Sender: TObject);
    procedure lbEnvironmentListDblClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure showEnvi;
  private
    { Private declarations }
    procedure getEnvironmentData;
  public
    { Public declarations }
    id_area:string;
    pList : TList;

  end;

var
  frmAvailableEnvironment: TfrmAvailableEnvironment;
  aList : TList;


implementation

uses uSimDBEditor,newclassASTT,uDBAsset_GameEnvironment, ufrmSummaryEnvironment,
  uDataModuleTTT, uEnvironmentCharacteristicsWindow, ufrmUsage, uDBAssetObject;

{$R *.dfm}

procedure TfrmAvailableEnvironment.btCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAvailableEnvironment.btCopyClick(Sender: TObject);
begin
  if lbEnvironmentList.ItemIndex <> -1 then
  begin
    id_area  := lbTempidArea.Items.Strings[lbEnvironmentList.ItemIndex];
    frmSummaryEnvironment.isCopy := True;
    frmSummaryEnvironment.isNew  := False;
    getEnvironmentData;
  end;
end;

procedure TfrmAvailableEnvironment.btEditClick(Sender: TObject);
begin
  if lbEnvironmentList.ItemIndex <> -1 then
  begin
    id_area  := lbTempidArea.Items.Strings[lbEnvironmentList.ItemIndex];
    frmSummaryEnvironment.isCopy := False;
    frmSummaryEnvironment.isNew  := False;
    getEnvironmentData;
  end;
end;

procedure TfrmAvailableEnvironment.getEnvironmentData;
begin
  with frmSummaryEnvironment do begin
    isNew := false;
    id_game_area := id_area;
    envi_id := lbTempId.Items.Strings[lbEnvironmentList.ItemIndex];

    getGameArea(id_area,pList,EnvironmentCharacteristicsWindowForm.GameEnviroDef);
    if isCopy then
    begin
      edtName.Text := 'Copy of ' + lbEnvironmentList.Items.Strings[lbEnvironmentList.ItemIndex];
      isNew        := True;
    end
    else
      edtName.Text := frmAvailableEnvironment.lbEnvironmentList.Items.Strings[lbEnvironmentList.ItemIndex];
      btnApply.Enabled := True;
    edtArea.Text := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FGameArea.Game_Area_Identifier;
    ShowModal;
  end;
end;

procedure TfrmAvailableEnvironment.btNewClick(Sender: TObject);
begin
  frmSummaryEnvironment.isNew := true;
  frmSummaryEnvironment.envi_id := IntToStr(622);
  frmSummaryEnvironment.getEnvironment;
  frmSummaryEnvironment.edtName.Text := '(Unnamed)';
  frmSummaryEnvironment.edtArea.Text := '(None)';
  frmSummaryEnvironment.btnEditCharacteristics.Enabled := false;
  frmSummaryEnvironment.btnOK.Enabled := False;
  frmSummaryEnvironment.ShowModal;
end;

procedure TfrmAvailableEnvironment.btRemoveClick(Sender: TObject);
var warning: Integer;
    PI_List: TList;
    I: Integer;
    env_index: string;
    rec_RA : TResource_Allocation;
    rec_global: TGlobal_Convergence_Zone;
begin
  if lbEnvironmentList.ItemIndex <> -1 then
  begin
    warning := MessageDlg('Are you sure you want to delete this item?',mtConfirmation,mbOKCancel,0);
    if warning = mrOK then
    begin
      PI_List := TList.Create;
      env_index:= lbTempId.Items.Strings[lbEnvironmentList.ItemIndex];
      dmTTT.GetResourceAllocation_ByEnvi(StrToInt(env_index),PI_List);
      for I := 0 to PI_List.Count - 1 do
      begin
        rec_RA := TResource_Allocation.Create;
        rec_RA := TResource_Allocation(PI_List[I]);
        rec_RA.FData.Game_Enviro_Index := 1;
        dmTTT.updateResource(rec_RA,IntToStr(rec_RA.FData.Resource_Alloc_Index));
      end;
      PI_List.Clear;
      dmTTT.GetGlobalConverge_ByEnvi(StrToInt(env_index),PI_List);
      for I := 0 to PI_List.Count - 1 do
      begin
        rec_global := TGlobal_Convergence_Zone.Create;
        rec_global := TGlobal_Convergence_Zone(PI_List[I]);
        rec_global.FData.Game_Enviro_Index := 1;
        dmTTT.updateGlobalConverge(rec_global,IntToStr(rec_global.FData.Converge_Index));
      end;
      dmTTT.DeleteAllSubArea_Enviro_Definition(StrToInt(env_index));
      dmTTT.deleteGame_Environment_Def(StrToInt(env_index));
      showEnvi;
    end;
  end;
end;

procedure TfrmAvailableEnvironment.btUsageClick(Sender: TObject);
begin
  if lbEnvironmentList.ItemIndex <> -1 then begin
    with frmUsage do begin
      UId := StrToInt(lbTempId.Items.Strings[lbEnvironmentList.ItemIndex]);
      name_usage  := lbEnvironmentList.Items.Strings[lbEnvironmentList.ItemIndex];
      UIndex  := 29;
      usage_title := 'Resource Allocation:';
      ShowModal;
    end;
  end;
end;

procedure TfrmAvailableEnvironment.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
  if GetKeyState(VK_ESCAPE)< 0 then
  begin
    case Msg.CharCode of
     VK_ESCAPE:
     begin
//       btClose.Click;
     end;
    end;
  end;
end;

procedure TfrmAvailableEnvironment.FormShow(Sender: TObject);

begin
  //setting button enable
//  btNew.Enabled := true;
//  btClose.Enabled := true;
  //setting button disable
//  btCopy.Enabled := false;
//  btEdit.Enabled := false;
//  btRemove.Enabled := false;
//  btUsage.Enabled := false;
//  btFilter.Enabled := false;

  showEnvi;

end;

procedure TfrmAvailableEnvironment.showEnvi;
var i : integer;
begin
 pList := Tlist.Create;

//get all scenario name
 uSimDBEditor.getEnvironments(pList);

 lbEnvironmentList.Items.Clear;
 lbTempidArea.Items.Clear;
 lbTempId.Items.Clear;

 for I := 0 to pList.Count - 1 do begin
  lbEnvironmentList.Items.Add(TGame_Environment_Definition(pList[i]).FData.Game_Enviro_Identifier);
  lbTempId.Items.Add(IntToStr(TGame_Environment_Definition(pList[i]).FData.Game_Enviro_Index));
  lbTempidArea.Items.Add(IntToStr(TGame_Environment_Definition(pList[i]).FData.Game_Area_Index));
 end;

end;
procedure TfrmAvailableEnvironment.lbEnvironmentListClick(Sender: TObject);
begin
//  btCopy.Enabled := true;
//  btEdit.Enabled := true;
//  btRemove.Enabled := true;
//  btUsage.Enabled := true;
//  btFilter.Enabled := false;
end;

procedure TfrmAvailableEnvironment.lbEnvironmentListDblClick(Sender: TObject);
begin
//   btEdit.Click;
end;

end.
