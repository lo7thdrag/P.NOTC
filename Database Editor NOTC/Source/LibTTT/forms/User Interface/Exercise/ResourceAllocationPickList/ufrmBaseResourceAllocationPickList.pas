unit ufrmBaseResourceAllocationPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, uBaseCoordSystem, Vcl.Imaging.pngimage,
  uDBAsset_Base, uDBAssetObject, uSimContainers ;

type
  TfrmBaseResourceAllocationPickList = class(TForm)
    lbAllBasaDef: TListBox;
    lbAllBaseOnScenario: TListBox;
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

    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lbAllBasaDefClick(Sender: TObject);
    procedure lbAllBaseOnScenarioClick(Sender: TObject);

    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);

  private
    FSelectedForce : Integer;

    FAllBaseDefList : TList;
    FAllBaseOnScenarioList : TList;

    FSelectedBaseDef : TBase;
    FSelectedBaseOnScenario : TResource_Base_Mapping;
    FResourceAllocation : TResource_Allocation;

    procedure UpdateBaseList;

  public
    isNoCancel : Boolean;
    property ResourceAllocation : TResource_Allocation read FResourceAllocation write FResourceAllocation;
    property SelectedForce : Integer read FSelectedForce write FSelectedForce;
  end;

var
  frmBaseResourceAllocationPickList: TfrmBaseResourceAllocationPickList;
  isCancelRemove : Boolean;

implementation

uses
  uDataModuleTTT, ufmEmbarkPositionInput, ufmBaseLocation, ufrmSummaryResourceAllocation;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmBaseResourceAllocationPickList.FormCreate(Sender: TObject);
begin
  FAllBaseDefList := TList.Create;
  FAllBaseOnScenarioList := TList.Create;
end;

procedure TfrmBaseResourceAllocationPickList.FormDestroy(Sender: TObject);
begin
  FreeItemsAndFreeList(FAllBaseDefList);
  FreeItemsAndFreeList(FAllBaseOnScenarioList)
end;

procedure TfrmBaseResourceAllocationPickList.FormShow(Sender: TObject);
begin
  isNoCancel := False;
  UpdateBaseList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmBaseResourceAllocationPickList.btnAddClick(Sender: TObject);
var
  BaseMapping : TResource_Base_Mapping;

begin
  if lbAllBasaDef.ItemIndex = -1 then
    Exit;

  if dmTTT.GetResourceBaseMappingCount(ResourceAllocation.FData.Resource_Alloc_Index, FSelectedBaseDef.FData.Base_Index) then
  begin
    ShowMessage('The base is already in use in another force');
    exit;
  end;

  BaseMapping := TResource_Base_Mapping.Create;

  with BaseMapping.FData do
  begin
    Resource_Alloc_Index := FResourceAllocation.FData.Resource_Alloc_Index;
    Base_Index := FSelectedBaseDef.FData.Base_Index;
    Force := FSelectedForce;
  end;

  if dmTTT.InsertResourceBaseMapping(BaseMapping)then
    isNoCancel := True;

  BaseMapping.Free;

  UpdateBaseList
end;

procedure TfrmBaseResourceAllocationPickList.btnRemoveClick(Sender: TObject);
begin
  if lbAllBaseOnScenario.ItemIndex = -1 then
     Exit;

  with FSelectedBaseOnScenario.FData do
  begin
    if dmTTT.DeleteResourceBaseMapping(2, ResourceAllocation.FData.Resource_Alloc_Index, Base_Mapping_Index, FSelectedForce) then
      isNoCancel := True;
  end;

  UpdateBaseList;

end;

procedure TfrmBaseResourceAllocationPickList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBaseResourceAllocationPickList.lbAllBasaDefClick( Sender: TObject);
begin
  if lbAllBasaDef.ItemIndex = -1 then
    Exit;

  FSelectedBaseDef := TBase(lbAllBasaDef.Items.Objects[lbAllBasaDef.ItemIndex]);
end;

procedure TfrmBaseResourceAllocationPickList.lbAllBaseOnScenarioClick( Sender: TObject);
begin
  if (lbAllBaseOnScenario.ItemIndex = -1) then
      Exit;
  FSelectedBaseOnScenario := TResource_Base_Mapping(lbAllBaseOnScenario.Items.Objects[lbAllBaseOnScenario.ItemIndex]);
end;

procedure TfrmBaseResourceAllocationPickList.UpdateBaseList;
var
  i, j : Integer;
  base : TBase;
  basemaping : TResource_Base_Mapping;
  found : Boolean;
begin
  lbAllBasaDef.Items.Clear;
  lbAllBaseOnScenario.Items.Clear;

  dmTTT.GetAllBaseDef(FAllBaseDefList);
  dmTTT.GetResourceBaseMapping(ResourceAllocation.FData.Resource_Alloc_Index, FSelectedForce, FAllBaseOnScenarioList);

  for i := 0 to FAllBaseDefList.Count - 1 do
  begin
    base := FAllBaseDefList.Items[i];
    found := False;

    for j := 0 to FAllBaseOnScenarioList.Count - 1 do
    begin
      basemaping := FAllBaseOnScenarioList.Items[j];

      if base.FData.Base_Index = basemaping.FData.Base_Index then
      begin
        found := True;
        Break;
      end;
    end;

    if found then
      lbAllBaseOnScenario.Items.AddObject(base.FData.Base_Identifier, base)
    else
      lbAllBasaDef.Items.AddObject(base.FData.Base_Identifier, base);

  end;
end;

{$ENDREGION}

end.
