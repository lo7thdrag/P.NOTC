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
  private
    { Private declarations }
    procedure getData;
  public
    { Public declarations }
    isNew : boolean;
    isENCmap : boolean;
    overlay_definitions : TList;
    game_area_def : TGame_Environment_Definition;
    overlay_def : TOverlay_Definition;
    mapping_overlay : TResource_Overlay_Mapping;
   
  end;

var
  fOverlay: TfOverlay;

implementation

uses
  uOverlayEditor, MapXLib_TLB, uDataModuleTTT, uGameAreaSelection, uRAList,
  uOtherSingleList;

{$R *.dfm}

procedure TfOverlay.btnApplyClick(Sender: TObject);
begin
  if fOtherSingle.isNew or isNew then
  begin
    getData;
    dmTTT.insertOverlay_Definition(overlay_def);
    dmTTT.insertResourceOverlay_Map(mapping_overlay);
  end
  else if not fOtherSingle.isNew or not isNew then
  begin
    getData;
    dmTTT.updateOverlay_Definition(overlay_def,IntToStr(overlay_def.FData.Overlay_Index));
    //dmTTT.updateResourceOverlay_Map(mapping_overlay,IntToStr(mapping_overlay.FData.Overlay_Instance_Index));
  end;

end;

procedure TfOverlay.getData;
begin
  with overlay_def.FData do
  begin
    Overlay_Identifier := edtOverlayName.Text;
    Overlay_Filename := edtOverlayName.Text;
    Static_Overlay := cbbType.ItemIndex;
    Game_Area_Index := game_area_def.FGameArea.Game_Area_Index;
    Domain := cbbDomain.ItemIndex;
  end;
  with mapping_overlay.Fdata do
  begin
    Resource_Alloc_Index := StrToInt(fRAList.RA_id);
    Overlay_Index := overlay_def.FData.Overlay_Index;
    Force_Designation := 0;

  end;

end;


procedure TfOverlay.btnAreaClick(Sender: TObject);
begin
  fGameAreaSelection.fromEnviro := false;
  fGameAreaSelection.fromOverlay := true;
  fGameAreaSelection.Show;
end;

procedure TfOverlay.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfOverlay.btnEditOverlayClick(Sender: TObject);
var
  ENCGeoset, nameGameArea : string;
begin
  //get game area

  //dmTTT.GetGame_Environment_Definition_By_Identifier(game_area_def.FData.Game_Enviro_Index, )
  dmTTT.GetGame_Area_DefByID(overlay_def.FData.Game_Area_Index, game_area_def);

  if game_area_def.FGameArea.Detail_Map = 'ENC' then
  begin
       OverlayEditorForm.Map1.Geoset := '';
       nameGameArea := edtArea.Text;
       ENCGeoset := ExtractFilePath(Application.ExeName) + 'mapsea\' + nameGameArea + '.gst';
       OverlayEditorForm.LoadENC(ENCGeoset);
       if (OverlayEditorForm.OverlayGameEnviroDef.FGameArea.Game_Centre_Long <> 0) and (OverlayEditorForm.OverlayGameEnviroDef.FGameArea.Game_Centre_Lat <> 0) then
       begin
          OverlayEditorForm.Map1.CenterX := OverlayEditorForm.OverlayGameEnviroDef.FGameArea.Game_Centre_Long;
          OverlayEditorForm.Map1.CenterY := OverlayEditorForm.OverlayGameEnviroDef.FGameArea.Game_Centre_Lat;
       end;
       dmTTT.GetGame_Area_DefByID(OverlayEditorForm.OverlayGameEnviroDef.FData.Game_Area_Index, OverlayEditorForm.OverlayGameEnviroDef);
       OverlayEditorForm.setCBScale;
       OverlayEditorForm.cbSetScale.ItemIndex := OverlayEditorForm.cbSetScale.Items.Count - 1;
       OverlayEditorForm.cbSetScaleChange(Sender);
       OverlayEditorForm.cbSetScale.Text := OverlayEditorForm.cbSetScale.Items.Strings[OverlayEditorForm.cbSetScale.ItemIndex];
  end
  else
  begin
        OverlayEditorForm.createGeoset();
        dmTTT.GetGame_Area_DefByID(game_area_def.FData.Game_Area_Index, game_area_def);
        OverlayEditorForm.setCBScale;
        OverlayEditorForm.cbSetScale.ItemIndex := OverlayEditorForm.cbSetScale.Items.Count - 1;
        OverlayEditorForm.cbSetScaleChange(Sender);
        OverlayEditorForm.cbSetScale.Text := OverlayEditorForm.cbSetScale.Items.Strings[OverlayEditorForm.cbSetScale.Items.Count - 1];
  end;
  //fCharacteristicLandmass.load();
  //fEditGameCenter.ApplyClick(Sender);
  OverlayEditorForm.Show;
end;

procedure TfOverlay.btnOkClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
  fOtherSingle.refresh;
end;

procedure TfOverlay.FormCreate(Sender: TObject);
begin
  overlay_definitions := Tlist.Create;
  overlay_def := TOverlay_Definition.Create;
  game_area_def := TGame_Environment_Definition.Create;
  mapping_overlay := TResource_Overlay_Mapping.Create;
end;


end.
