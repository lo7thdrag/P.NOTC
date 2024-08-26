unit ufrmOverlayResourceAllocationPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, {uDBAsset_Geo}newClassASTT, uDBAsset_GameEnvironment, uDBAssetObject,
  Vcl.Imaging.pngimage;

type
  TfrmOverlayResourceAllocationPickList = class(TForm)
    lbAllOverlayDef: TListBox;
    lbAllOverlayOnScenario: TListBox;
    btnAdd: TImage;
    btnClose: TImage;
    btnRemove: TImage;
    ImgBackgroundAvailable: TImage;
    ImgBackgroundForm: TImage;
    ImgBackgroundOnBoard: TImage;
    ImgHeaderAvailable: TImage;
    ImgHeaderOnBoard: TImage;
    Label1: TLabel;
    Label2: TLabel;

    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure lbAllOverlayDefClick(Sender: TObject);
    procedure lbAllOverlayOnScenarioClick(Sender: TObject);

    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);

  private
    FSelectedForce : Integer;

    FAllOverlayDefList : TList;
    FAllOverlayOnScenarioList : TList;

    FSelectedOverlayDef : TOverlay_Definition;
    FSelectedOverlayOnScenario : TResource_Overlay_Mapping;
    FResourceAllocation : TResource_Allocation;

    procedure UpdateOverlayList;

  public
    isNoCancel : Boolean;
    property ResourceAllocation : TResource_Allocation read FResourceAllocation write FResourceAllocation;
    property SelectedForce : Integer read FSelectedForce write FSelectedForce;
  end;

var
  frmOverlayResourceAllocationPickList: TfrmOverlayResourceAllocationPickList;
  isCancelRemove : Boolean;


implementation

uses
  uDataModuleTTT, ufrmSummaryResourceAllocation, ufrmSummaryOverlay, ufrmAvailableResourceAllocation;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmOverlayResourceAllocationPickList.FormCreate(Sender: TObject);
begin
  FAllOverlayDefList := TList.Create;
  FAllOverlayOnScenarioList := TList.Create;
end;

procedure TfrmOverlayResourceAllocationPickList.FormShow(Sender: TObject);
begin
  isNoCancel := False;
  UpdateOverlayList
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmOverlayResourceAllocationPickList.btnAddClick(Sender: TObject);
var
  OverlayMapping : TResource_Overlay_Mapping;

begin
  if lbAllOverlayDef.ItemIndex = -1 then
    Exit  ;

  OverlayMapping := TResource_Overlay_Mapping.Create;

  with OverlayMapping.FData do
  begin
    Resource_Alloc_Index := FResourceAllocation.FData.Resource_Alloc_Index;
    Force_Designation := SelectedForce;
    Overlay_Index := FSelectedOverlayDef.FData.Overlay_Index;
  end;

  if dmTTT.InsertResourceOverlayMapping(OverlayMapping.FData)then
    isNoCancel := True;

  OverlayMapping.Free;

  UpdateOverlayList
end;

procedure TfrmOverlayResourceAllocationPickList.btnRemoveClick(Sender: TObject);
begin
  if lbAllOverlayOnScenario.ItemIndex = -1 then
     Exit;

  with FSelectedOverlayOnScenario.FData do
  begin
    if dmTTT.DeleteResourceOverlayMapping(2, Overlay_Instance_Index) then
      isNoCancel := True;
  end;

  UpdateOverlayList;

end;

procedure TfrmOverlayResourceAllocationPickList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmOverlayResourceAllocationPickList.lbAllOverlayDefClick(Sender: TObject);
begin
  if lbAllOverlayDef.ItemIndex = -1 then
    Exit;

  FSelectedOverlayDef := TOverlay_Definition(lbAllOverlayDef.Items.Objects[lbAllOverlayDef.ItemIndex]);
end;

procedure TfrmOverlayResourceAllocationPickList.lbAllOverlayOnScenarioClick(Sender: TObject);
begin
  if lbAllOverlayOnScenario.ItemIndex = -1 then
     Exit;

  FSelectedOverlayOnScenario := TResource_Overlay_Mapping(lbAllOverlayOnScenario.Items.Objects[lbAllOverlayOnScenario.ItemIndex]);
end;

procedure TfrmOverlayResourceAllocationPickList.UpdateOverlayList;
var
  i, j : Integer;
  Overlay: TOverlay_Definition;
  OverlayMaping : TResource_Overlay_Mapping;
  found : Boolean;
begin
  lbAllOverlayDef.Items.Clear;
  lbAllOverlayOnScenario.Items.Clear;

  dmTTT.GetAllOverlayDef(FAllOverlayDefList);
  dmTTT.GetResourceOverlayMapping(FResourceAllocation.FData.Resource_Alloc_Index, FSelectedForce, FAllOverlayOnScenarioList);

  for i := 0 to FAllOverlayDefList.Count - 1 do
  begin
    overlay := FAllOverlayDefList.Items[i];
    found := False;

    for j := 0 to FAllOverlayOnScenarioList.Count - 1 do
    begin
      OverlayMaping := FAllOverlayOnScenarioList.Items[j];

      if overlay.FData.Overlay_Index = OverlayMaping.FData.Overlay_Index then
      begin
        found := True;
        Break;
      end;
    end;

    if found then
      lbAllOverlayOnScenario.Items.AddObject(overlay.FData.Overlay_Identifier, OverlayMaping)
    else
      lbAllOverlayDef.Items.AddObject(overlay.FData.Overlay_Identifier, overlay);

  end;
end;

{$ENDREGION}

end.
