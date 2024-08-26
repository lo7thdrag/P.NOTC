unit uOverlaySelectListForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfOverlaySelect = class(TForm)
    btCopy: TButton;
    btEdit: TButton;
    btnAdd: TButton;
    btnCancel: TButton;
    btNew: TButton;
    btnOk: TButton;
    btnRemove: TButton;
    lbOverlayAvailable: TListBox;
    lbOverlaySelect: TListBox;
    lbtempIDOverlay: TListBox;
    shp1: TShape;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btCopyClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    overlayList : Tlist;
    procedure getOverlayByResource(id_ra: Integer);
  end;

var
  fOverlaySelect: TfOverlaySelect;

implementation

uses
  uDataModuleTTT, uResourceAllocation, uDBAssetObject, uOverlay;

{$R *.dfm}

procedure TfOverlaySelect.btCopyClick(Sender: TObject);
begin
  if lbOverlayAvailable.ItemIndex = -1 then
    Exit;
  {
  dmTTT.GetOverlay_DefinitionByID(StrToInt(lbtempIDOverlay.Items[lbOverlayAvailable.ItemIndex]), fOverlay.overlay_def);
  //rename identifier
  fOverlay.overlay_def.FData.Overlay_Identifier :='Copy Of ' + lbOverlayAvailable.Items[lbOverlayAvailable.ItemIndex];
  fOverlay.overlay_def.FData.Overlay_Filename :='Copy Of ' + lbOverlayAvailable.Items[lbOverlayAvailable.ItemIndex];
  //insert
  dmTTT.insertOverlay_Definition(fOverlay.overlay_def);
  ResourceAllocationForm.ra.FOverlay := fOverlay.overlay_def.FData;

  dmTTT.insert_Resource_Overlay_Mapping(ResourceAllocationForm.ra);

  Self.Refresh;
  Self.Show;
  }
end;

procedure TfOverlaySelect.btEditClick(Sender: TObject);
begin
  if lbOverlayAvailable.ItemIndex = -1 then
    Exit;

  fOverlay.isNew := false;
  dmTTT.GetOverlay_DefinitionByID(StrToInt(lbtempIDOverlay.Items[lbOverlayAvailable.ItemIndex]), fOverlay.overlay_def);
  //set value at overlay form
  with fOverlay do
  begin
    edtOverlayName.Text := overlay_def.FData.Overlay_Identifier;
    //get game area identifier
    dmTTT.GetGame_Area_DefByID(overlay_def.FData.Game_Area_Index, game_area_def);
    edtArea.Text := game_area_def.FGameArea.Game_Area_Identifier;
    cbbType.ItemIndex := overlay_def.FData.Static_Overlay;
    cbbDomain.ItemIndex := overlay_def.FData.Domain;
  end;

  fOverlay.Show;
end;

procedure TfOverlaySelect.btnAddClick(Sender: TObject);
begin
  if lbOverlayAvailable.ItemIndex <> -1 then
  begin
    lbOverlaySelect.Items.Add(lbOverlayAvailable.Items[lbOverlayAvailable.ItemIndex]);
    fOverlay.overlay_def.FData.Overlay_Index := StrToInt(lbtempIDOverlay.Items[lbOverlayAvailable.ItemIndex]);
  end;
end;

procedure TfOverlaySelect.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfOverlaySelect.btNewClick(Sender: TObject);
begin
  fOverlay.isNew := true;
  //setting default value
  fOverlay.edtOverlayName.Text := 'None';
  fOverlay.edtArea.Text := '(None)';
  fOverlay.Show;
end;

procedure TfOverlaySelect.btnOkClick(Sender: TObject);
begin
      close;
end;

procedure TfOverlaySelect.btnRemoveClick(Sender: TObject);
begin
  if lbOverlaySelect.ItemIndex <> -1 then
  begin
    lbOverlaySelect.DeleteSelected;
  end;
end;

procedure TfOverlaySelect.FormCreate(Sender: TObject);
begin
  overlayList := TList.Create;
end;

procedure TfOverlaySelect.FormShow(Sender: TObject);
var
  I: Integer;
begin
   getOverlayByResource(ResourceAllocationForm.ra.FData.Resource_Alloc_Index);

   lbOverlayAvailable.Clear;
   lbtempIDOverlay.Clear;
   for I := 0 to overlayList.Count - 1 do
   begin
     lbOverlayAvailable.Items.Add(TResource_Allocation(overlayList[I]).FOverlay.Overlay_Identifier);
     lbtempIDOverlay.Items.Add(IntToStr(TResource_Allocation (overlayList[I]).FOverlay.Overlay_Index));
   end;
end;

procedure TfOverlaySelect.getOverlayByResource(id_ra: Integer);
begin
   dmTTT.GetResource_Overlay_Mapping(id_ra, overlayList);
end;

end.
