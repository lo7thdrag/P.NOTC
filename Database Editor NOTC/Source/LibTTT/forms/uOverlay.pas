unit uOverlay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAsset_GameEnvironment, uDBAsset_Geo;

type
  TfOverlay = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    edtOverlayName: TEdit;
    pnl3: TPanel;
    btnCancel: TButton;
    btnApply: TButton;
    btnOk: TButton;
    btnEditOverlay: TButton;
    lbl2: TLabel;
    lbl3: TLabel;
    cbbType: TComboBox;
    cbbDomain: TComboBox;
    lbl4: TLabel;
    edtArea: TEdit;
    btnArea: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnEditOverlayClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAreaClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure cbbTypeChange(Sender: TObject);
    procedure edtAreaChange(Sender: TObject);
  private
    { Private declarations }
    procedure getData;
    procedure initializing;
  public
    { Public declarations }
    lastOverlayName : string;

    isENCmap : boolean;
    isNew, isCopy : boolean;
    centLong, centLatt  : double;
    overlay_definitions : TList;

    game_area_def   : TGame_Environment_Definition;
    overlay_def     : TOverlay_Definition;
    mapping_overlay : TResource_Overlay_Mapping;

    procedure LoadMap(aGeoset: String);
  end;

var
  fOverlay : TfOverlay;

implementation

uses
  uOverlayEditor, MapXLib_TLB, uDataModuleTTT, uGameAreaSelection, uRAList,
  uOtherSingleList, uOverlaySelectListForm, uDBEditSetting, uBaseCoordSystem;

{$R *.dfm}

procedure TfOverlay.btnApplyClick(Sender: TObject);
var
  sourceCopy, destCopy : string;
begin
  {update by me}
  if fOtherSingle.isNew or isNew then
  begin
    isNew := False;
    fOtherSingle.isNew := false;
    getData;
    dmTTT.insertOverlay_Definition(overlay_def);
  end
  else if not fOtherSingle.isNew or not isNew then
  begin
    getdata;
    dmTTT.updateOverlay_Definition(overlay_def,IntToStr(overlay_def.FData.Overlay_Index));
  end;

  if fOtherSingle.isCopy or isCopy then
  begin
    sourceCopy := vAppDBSetting.OverlayPath + '\' + lastOverlayName + '.dat';
    destCopy   := vAppDBSetting.OverlayPath + '\' + edtOverlayName.Text + '.dat';
    if FileExists(destCopy) then
       Exit
    else
       CopyFile(PChar(sourceCopy), PChar(destCopy), False);

    btnOk.Enabled          := True;
    btnEditOverlay.Enabled := True;
  end;

  fOverlaySelect.getOverlay;
  cbbType.Enabled        := false;
  cbbDomain.Enabled      := false;
  btnEditOverlay.Enabled := true;
  btnOk.Enabled          := True;
end;

procedure TfOverlay.getData;
begin
  with overlay_def.FData do
  begin
    Overlay_Identifier := edtOverlayName.Text;
    Overlay_Filename   := edtOverlayName.Text;
    Static_Overlay     := cbbType.ItemIndex;
    Game_Area_Index    := game_area_def.FGameArea.Game_Area_Index;
    Domain             := cbbDomain.ItemIndex;

//    if isCopy then
//       Overlay_Index := 0;
  end;
end;

procedure TfOverlay.btnAreaClick(Sender: TObject);
begin
  fGameAreaSelection.fromEnviro  := false;
  fGameAreaSelection.fromOverlay := true;
  fGameAreaSelection.ShowModal;
end;

procedure TfOverlay.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfOverlay.btnEditOverlayClick(Sender: TObject);
var
  ENCGeoset, nameGameArea : string;
begin
  if cbbType.ItemIndex = 1 then
  begin
    dmTTT.GetGame_Area_DefByID(overlay_def.FData.Game_Area_Index, game_area_def);

    if game_area_def.FGameArea.Detail_Map = 'ENC' then
    begin
         OverlayEditorForm.Map1.Geoset := '';
         nameGameArea := edtArea.Text;
         ENCGeoset := vAppDBSetting.MapDestPathENC + '\' + nameGameArea + '.gst';
         OverlayEditorForm.LoadENC(ENCGeoset);
         if (OverlayEditorForm.OverlayGameEnviroDef.FGameArea.Game_Centre_Long <> 0) and (OverlayEditorForm.OverlayGameEnviroDef.FGameArea.Game_Centre_Lat <> 0) then
         begin
            OverlayEditorForm.Map1.CenterX := OverlayEditorForm.OverlayGameEnviroDef.FGameArea.Game_Centre_Long;
            OverlayEditorForm.Map1.CenterY := OverlayEditorForm.OverlayGameEnviroDef.FGameArea.Game_Centre_Lat;
         end;
         centLong := game_area_def.FGameArea.Game_Centre_Long;
         centLatt := game_area_def.FGameArea.Game_Centre_Lat;
         dmTTT.GetGame_Area_DefByID(OverlayEditorForm.OverlayGameEnviroDef.FData.Game_Area_Index, OverlayEditorForm.OverlayGameEnviroDef);
         OverlayEditorForm.setCBScale;
         OverlayEditorForm.cbSetScale.ItemIndex := OverlayEditorForm.cbSetScale.Items.Count - 1;
         OverlayEditorForm.cbSetScaleChange(Sender);
         OverlayEditorForm.cbSetScale.Text := OverlayEditorForm.cbSetScale.Items.Strings[OverlayEditorForm.cbSetScale.ItemIndex];
         initializing;
    end
    else
    begin
          OverlayEditorForm.createGeoset();
          dmTTT.GetGame_Area_DefByID(game_area_def.FData.Game_Area_Index, game_area_def);
          centLong := game_area_def.FGameArea.Game_Centre_Long;
          centLatt := game_area_def.FGameArea.Game_Centre_Lat;
          OverlayEditorForm.setCBScale;
          OverlayEditorForm.cbSetScale.ItemIndex := OverlayEditorForm.cbSetScale.Items.Count - 1;
          OverlayEditorForm.cbSetScaleChange(Sender);
          OverlayEditorForm.cbSetScale.Text := OverlayEditorForm.cbSetScale.Items.Strings[OverlayEditorForm.cbSetScale.Items.Count - 1];
          initializing;
    end;
  end
  else
  begin
    ENCGeoset := vAppDBSetting.Pattern;
    LoadMap(ENCGeoset);
    OverlayEditorForm.Map1.CenterX := 0;
    OverlayEditorForm.Map1.CenterY := 0;
    centLong := 0;
    centLatt := 0;
    OverlayEditorForm.cbSetScale.ItemIndex := 10;
  end;
  //fCharacteristicLandmass.load();
  //fEditGameCenter.ApplyClick(Sender);
  OverlayEditorForm.ShowModal;
end;

procedure InitOleVariant(var TheVar: OleVariant);
begin
  TVarData(TheVar).vType := varError;
  TVarData(TheVar).vError := DISP_E_PARAMNOTFOUND;
end;

procedure TfOverlay.initializing;
begin
  OverlayEditorForm.lblLongitude.Caption         := formatDM_longitude(centLong);
  OverlayEditorForm.lblLatitude.Caption          := formatDMS_latt(centLatt);
  OverlayEditorForm.lblLongitude_Arc.Caption     := formatDM_longitude(centLong);
  OverlayEditorForm.lblLatitude_Arc.Caption      := formatDMS_latt(centLatt);
  OverlayEditorForm.lblLongitude_Ellipse.Caption := formatDM_longitude(centLong);
  OverlayEditorForm.lblLatitude_Ellipse.Caption  := formatDMS_latt(centLatt);
  OverlayEditorForm.lblLongitude_Text.Caption    := formatDM_longitude(centLong);
  OverlayEditorForm.lblLatitude_Text.Caption     := formatDMS_latt(centLatt);

  OverlayEditorForm.centLong := centLong;
  OverlayEditorForm.centLatt := centLatt;
end;

procedure TfOverlay.LoadMap(aGeoset: String);
var
  i: Integer;
  z: OleVariant;
  mInfo: CMapXLayerInfo;
begin
  with OverlayEditorForm do
  begin
    if Map1 = nil then
      Exit;
    InitOleVariant(z);
    Map1.Layers.RemoveAll;

    Map1.Geoset := aGeoset;

    if aGeoset <> '' then
    begin
      for i := 1 to Map1.Layers.Count do
      begin
        Map1.Layers.Item(i).Selectable := false;
        Map1.Layers.Item(i).Editable  := False;
      end;

      mInfo := CoLayerInfo.Create;
      mInfo.type_ := miLayerInfoTypeUserDraw;
      mInfo.AddParameter('Name', 'LYR_DRAW');
      FLyrDraw := Map1.Layers.Add(mInfo, 1);

      Map1.Layers.AnimationLayer := FLyrDraw;
      Map1.MapUnit := miUnitNauticalMile;
    end;
    //FMap.BackColor := RGB(192, 224, 255);
    Map1.BackColor := RGB(0, 0, 0);
  end;
end;

procedure TfOverlay.btnOkClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
  fOtherSingle.refresh;
  fOverlaySelect.lbOverlayAvailable.Refresh;
  fOverlaySelect.getOverlay;
end;

procedure TfOverlay.cbbTypeChange(Sender: TObject);
begin
  if cbbType.ItemIndex = 0 then
  begin
    btnArea.Enabled := false;
    edtArea.Text    := '(None)';
  end
  else btnArea.Enabled := true;
  edtAreaChange(Sender);
end;

procedure TfOverlay.edtAreaChange(Sender: TObject);
begin
  btnOk.Enabled      := true;
  btnApply.Enabled   := true;

  if (edtArea.Text = '(None)') and (cbbType.ItemIndex = 1) then
  begin
    btnOk.Enabled    := false;
    btnApply.Enabled := false;
  end;
end;

procedure TfOverlay.FormCreate(Sender: TObject);
begin
  overlay_definitions := Tlist.Create;
  overlay_def         := TOverlay_Definition.Create;
  game_area_def       := TGame_Environment_Definition.Create;
  mapping_overlay     := TResource_Overlay_Mapping.Create;
end;


end.
