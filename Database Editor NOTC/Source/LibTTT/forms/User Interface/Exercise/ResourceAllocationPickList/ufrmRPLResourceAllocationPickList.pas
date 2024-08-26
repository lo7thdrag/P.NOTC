unit ufrmRPLResourceAllocationPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Vcl.Imaging.pngimage,
  uDBAssetObject, newClassASTT, uDBAsset_Runtime_Platform_Library, uSimContainers;

type
  TfrmRPLResourceAllocationPickList = class(TForm)
    lbAllPlatformLibraryDef: TListBox;
    lbAllPlatformLibraryOnScenario: TListBox;
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
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure lbAllPlatformLibraryDefClick(Sender: TObject);
    procedure lbAllPlatformLibraryOnScenarioClick(Sender: TObject);

    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);

   private
    FSelectedForce : Integer;

    FAllRuntaimePlatformLibraryDefList : TList;
    FAllRuntaimePlatformLibraryOnScenarioList : TList;

    FSelectedRuntaimePlatformLibrary : TRuntime_Platform_Library;
    FSelectedRuntimePlatformLibraryMapping : TResource_Library_Mapping;
    FResourceAllocation : TResource_Allocation;

    procedure UpdateRuntaimePlatformLibraryList;

  public
    isNoCancel : Boolean;
    property ResourceAllocation : TResource_Allocation read FResourceAllocation write FResourceAllocation;
    property SelectedForce : Integer read FSelectedForce write FSelectedForce;
  end;

var
  frmRPLResourceAllocationPickList: TfrmRPLResourceAllocationPickList;

implementation

uses
  uDataModuleTTT, ufrmSummaryResourceAllocation, ufrmSummaryRuntimePlatform, ufrmUsage;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmRPLResourceAllocationPickList.FormCreate(Sender: TObject);
begin
  FAllRuntaimePlatformLibraryDefList := TList.Create;
  FAllRuntaimePlatformLibraryOnScenarioList := TList.Create;
end;

procedure TfrmRPLResourceAllocationPickList.FormDestroy(Sender: TObject);
begin
  FreeItemsAndFreeList(FAllRuntaimePlatformLibraryDefList);
  FreeItemsAndFreeList(FAllRuntaimePlatformLibraryOnScenarioList);
end;

procedure TfrmRPLResourceAllocationPickList.FormShow(Sender: TObject);
begin
  isNoCancel := False;
  UpdateRuntaimePlatformLibraryList
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmRPLResourceAllocationPickList.btnAddClick(Sender: TObject);
var
  RuntimePlatformLibraryMapping : TResource_Library_Mapping;
begin
  if lbAllPlatformLibraryDef.ItemIndex = -1 then
      Exit  ;

  RuntimePlatformLibraryMapping := TResource_Library_Mapping.Create;

  with RuntimePlatformLibraryMapping.FData do
  begin
    Resource_Alloc_Index := FResourceAllocation.FData.Resource_Alloc_Index;
    Library_Index := FSelectedRuntaimePlatformLibrary.FData.Platform_Library_Index;
  end;

  if dmTTT.InsertResourceRPLMapping(RuntimePlatformLibraryMapping.FData)then
    isNoCancel := True;

  RuntimePlatformLibraryMapping.Free;

  UpdateRuntaimePlatformLibraryList;

end;

procedure TfrmRPLResourceAllocationPickList.btnRemoveClick(Sender: TObject);
begin
  if lbAllPlatformLibraryOnScenario.ItemIndex = -1 then
      Exit;

 with FSelectedRuntimePlatformLibraryMapping.FData do
  begin
    if dmTTT.DeleteResourceRPLMapping(2, ResourceAllocation.FData.Resource_Alloc_Index, Library_Index) then
      isNoCancel := True;
  end;

  UpdateRuntaimePlatformLibraryList;
end;

procedure TfrmRPLResourceAllocationPickList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRPLResourceAllocationPickList.lbAllPlatformLibraryDefClick(Sender: TObject);
begin
  if lbAllPlatformLibraryDef.ItemIndex = -1 then
    Exit;

  FSelectedRuntaimePlatformLibrary := TRuntime_Platform_Library(lbAllPlatformLibraryDef.Items.Objects[lbAllPlatformLibraryDef.ItemIndex]);
end;

procedure TfrmRPLResourceAllocationPickList.lbAllPlatformLibraryOnScenarioClick( Sender: TObject);
begin
  if lbAllPlatformLibraryOnScenario.ItemIndex = -1 then
      Exit;
  FSelectedRuntimePlatformLibraryMapping := TResource_Library_Mapping(lbAllPlatformLibraryOnScenario.Items.Objects[lbAllPlatformLibraryOnScenario.ItemIndex]);
end;

procedure TfrmRPLResourceAllocationPickList.UpdateRuntaimePlatformLibraryList;
var
  i, j : Integer;
  rpl : TRuntime_Platform_Library;
  rplmaping : TResource_Library_Mapping;
  found : Boolean;
begin
  lbAllPlatformLibraryDef.Items.Clear;
  lbAllPlatformLibraryOnScenario.Items.Clear;

  dmTTT.GetAllRuntimePlatformLibraryDef(FAllRuntaimePlatformLibraryDefList);
  dmTTT.GetResourceRPLMapping(FResourceAllocation.FData.Resource_Alloc_Index, FAllRuntaimePlatformLibraryOnScenarioList);

  for i := 0 to FAllRuntaimePlatformLibraryDefList.Count - 1 do
  begin
    rpl := FAllRuntaimePlatformLibraryDefList.Items[i];
    found := False;

    for j := 0 to FAllRuntaimePlatformLibraryOnScenarioList.Count - 1 do
    begin
      rplmaping := FAllRuntaimePlatformLibraryOnScenarioList.Items[j];

      if rpl.FData.Platform_Library_Index = rplmaping.FData.Library_Index then
      begin
        found := True;
        Break;
      end;
    end;

    if found then
      lbAllPlatformLibraryOnScenario.Items.AddObject(RPL.FData.Library_Name, rplmaping)
    else
      lbAllPlatformLibraryDef.Items.AddObject(RPL.FData.Library_Name, RPL);

  end;

end;

{$ENDREGION}

end.
