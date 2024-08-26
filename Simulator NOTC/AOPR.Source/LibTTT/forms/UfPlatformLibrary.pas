unit UfPlatformLibrary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, uDBAsset_Runtime_Platform_Library;

type
  TfPlatformLibraryDoublePickList = class(TForm)
    btCopy: TButton;
    btEdit: TButton;
    btnAdd: TButton;
    btnCancel: TButton;
    btNew: TButton;
    btnOk: TButton;
    btnRemove: TButton;
    lbPlatformLibraryAvailable: TListBox;
    lbPlatformLibrarySelected: TListBox;
    lbPlatformLibraryID: TListBox;
    shp1: TShape;
    lbPlatformLibrarySelectedID: TListBox;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btCopyClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    rplList : TList;
    runtime_platform_lib : TRuntime_Platform_Library;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPlatformLibraryDoublePickList: TfPlatformLibraryDoublePickList;

implementation

uses
  uDataModuleTTT, uResourceAllocation, uRuntimePlatform;

{$R *.dfm}

procedure TfPlatformLibraryDoublePickList.btCopyClick(Sender: TObject);
begin
  if lbPlatformLibraryAvailable.ItemIndex <> -1 then
  begin
    fRuntimePlatform.isNew := false;
    fRuntimePlatform.edtRuntimeName.Text := 'Copy Of ' + lbPlatformLibraryAvailable.Items[lbPlatformLibraryAvailable.ItemIndex];
    fRuntimePlatform.platform_library_index := StrToInt(lbPlatformLibraryID.Items[lbPlatformLibraryAvailable.ItemIndex]);
    fRuntimePlatform.getplatformLibraryEntry;
    fRuntimePlatform.Show;
  end;
end;

procedure TfPlatformLibraryDoublePickList.btEditClick(Sender: TObject);
begin
  if lbPlatformLibraryAvailable.ItemIndex <> -1 then
  begin
    fRuntimePlatform.isNew := false;
    fRuntimePlatform.edtRuntimeName.Text := lbPlatformLibraryAvailable.Items[lbPlatformLibraryAvailable.ItemIndex];
    fRuntimePlatform.platform_library_index := StrToInt(lbPlatformLibraryID.Items[lbPlatformLibraryAvailable.ItemIndex]);
    fRuntimePlatform.getplatformLibraryEntry;
    fRuntimePlatform.Show;
  end;
end;

procedure TfPlatformLibraryDoublePickList.btnAddClick(Sender: TObject);
begin
  //get from left add to right
  if lbPlatformLibraryAvailable.ItemIndex <> -1 then
  begin
    lbPlatformLibrarySelected.Items.Add(lbPlatformLibraryAvailable.Items[lbPlatformLibraryAvailable.ItemIndex]);
    lbPlatformLibrarySelectedID.Items.Add(lbPlatformLibraryID.Items[lbPlatformLibraryAvailable.ItemIndex]);

    // insert to db
    with runtime_platform_lib.FData do
    begin
       Platform_Library_Index := StrToInt(lbPlatformLibraryID.Items[lbPlatformLibraryAvailable.ItemIndex]);
       Library_Name := lbPlatformLibraryAvailable.Items[lbPlatformLibraryAvailable.ItemIndex];

       dmTTT.InsertRuntime_Platform_LibraryByResourceAlloc(IntToStr(ResourceAllocationForm.ra.FData.Resource_Alloc_Index), runtime_platform_lib);
    end;

  end;
end;

procedure TfPlatformLibraryDoublePickList.btnCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfPlatformLibraryDoublePickList.btNewClick(Sender: TObject);
begin
  fRuntimePlatform.isNew := true;
  fRuntimePlatform.Show;
end;

procedure TfPlatformLibraryDoublePickList.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfPlatformLibraryDoublePickList.btnRemoveClick(Sender: TObject);
begin
  if lbPlatformLibrarySelected.ItemIndex <> -1 then
  begin
    dmTTT.DeleteRuntime_Platform_LibraryByResourceAlloc(lbPlatformLibrarySelectedID.Items[lbPlatformLibrarySelected.ItemIndex]);
    Show;
  end;
end;

procedure TfPlatformLibraryDoublePickList.FormCreate(Sender: TObject);
begin
  rplList := TList.Create;
  runtime_platform_lib := TRuntime_Platform_Library.Create;
end;

procedure TfPlatformLibraryDoublePickList.FormShow(Sender: TObject);
var
  I: Integer;
begin
  //get all platform library
  dmTTT.GetRuntime_Platform_Library(0, rplList, runtime_platform_lib);
  //cleart LB
  lbPlatformLibraryAvailable.Clear;
  lbPlatformLibraryID.Clear;
  //insert platform Lib Indetifier to list box
  for I := 0 to rplList.Count - 1 do
  begin
    lbPlatformLibraryAvailable.Items.Add(TRuntime_Platform_Library(rplList[I]).FData.Library_Name);
    lbPlatformLibraryID.Items.Add(IntToStr(TRuntime_Platform_Library(rplList[I]).FData.Platform_Library_Index));
  end;

  rplList.Clear;
  //get selected
  if ResourceAllocationForm.ra.FData.Resource_Alloc_Index <> 0 then
    begin
    dmTTT.GetRuntime_Platform_LibraryByResourceAlloc(ResourceAllocationForm.ra.FData.Resource_Alloc_Index, rplList, runtime_platform_lib);
    lbPlatformLibrarySelected.Clear;
    lbPlatformLibrarySelectedID.Clear;
    //insert selected
    for I := 0 to rplList.Count - 1 do
    begin
      lbPlatformLibrarySelected.Items.Add(TRuntime_Platform_Library(rplList[I]).FData.Library_Name);
      lbPlatformLibrarySelectedID.Items.Add(IntToStr(TRuntime_Platform_Library(rplList[I]).FData.Platform_Library_Index));
    end;
  end;
end;

end.
