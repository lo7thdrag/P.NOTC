unit uRadarIntervalDouble;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, newClassASTT, uFormatioResourceList;

type
  TfRadarIntervalSelect = class(TForm)
    shp1: TShape;
    lstIDSelectedPredefined: TListBox;
    btnCopy: TButton;
    btnEdit: TButton;
    btnAdd: TButton;
    btnCancel: TButton;
    btnNew: TButton;
    btnOk: TButton;
    btnRemove: TButton;
    lstPredefinedAvailable: TListBox;
    lstPredefinedSelect: TListBox;
    lstIDPredefined: TListBox;
    procedure btnNewClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure getAllData;
    procedure getSelectedData;
    procedure btnCopyClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure showSelectedData;
    procedure lstPredefinedAvailableDblClick(Sender: TObject);
  private
    { Private declarations }
     AllList, SelectList : TList;

  public
    { Public declarations }
     radarinterval : TRadar_Interval_List;
     id : string;
     mList   : TList;
     isNew,isCopy,isEdit : Boolean;
  end;

var
  fRadarIntervalSelect: TfRadarIntervalSelect;

implementation

uses ufrmSummaryRadarIntervalList, uDBAsset_Radar , uDataModuleTTT,
  ufResouceAllocation, ufrmSummaryResourceAllocation, uDBAssetObject;

{$R *.dfm}

procedure TfRadarIntervalSelect.btnAddClick(Sender: TObject);
var rec : TResource_Allocation;
  I: Integer;
  isSame : Boolean;
begin
  if lstPredefinedAvailable.ItemIndex <> -1 then
  begin
    rec := TResource_Allocation.Create;
    with rec.FRadarListMap do
    begin
      Resource_Alloc_Index := frmSummaryResourceAllocation.ra.FData.Resource_Alloc_Index;
      Interval_List_Index := TRadar_Interval_List(AllList[lstPredefinedAvailable.ItemIndex]).FData.Interval_List_Index;
    end;
    rec.FRadarList := TRadar_Interval_List(AllList[lstPredefinedAvailable.ItemIndex]).FData;
    isSame := False;
    for I := 0 to SelectList.Count - 1 do
    begin
      if TResource_Allocation(SelectList[I]).FRadarListMap.Interval_List_Index = rec.FRadarListMap.Interval_List_Index then
      begin
        isSame  := True;
        Continue;
      end;
    end;
    if not isSame then
    begin
      SelectList.Add(rec);
      showSelectedData ;
    end;
  end;
end;

procedure TfRadarIntervalSelect.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfRadarIntervalSelect.btnCopyClick(Sender: TObject);
var i : integer;
begin
  if lstPredefinedAvailable.ItemIndex <> -1 then
  begin
    with frmSummaryRadarIntervalList do
    begin
       i := lstPredefinedAvailable.ItemIndex;
       edtName.Text := 'copy of '+TRadar_Interval_List(AllList[i]).FData.Interval_List_Identifier;
       isNew := False;
    end;
  end;
  frmSummaryRadarIntervalList.ShowModal;
end;

procedure TfRadarIntervalSelect.btnEditClick(Sender: TObject);
var i: Integer;
begin
  if lstPredefinedAvailable.ItemIndex <> -1 then
  begin
    with frmSummaryRadarIntervalList do begin
      radar_interval := TRadar_Interval_List.Create;
      radar_interval.FData.Interval_List_Index := StrToInt(lstIDPredefined.Items.Strings[lstPredefinedAvailable.ItemIndex]);
      radar_interval.FData.Interval_List_Identifier := lstPredefinedAvailable.Items.Strings[lstPredefinedAvailable.ItemIndex];
      edtName.Text := radar_interval.FData.Interval_List_Identifier;
      isNew := False;
    end;
  end;
  frmSummaryRadarIntervalList.ShowModal;
end;

procedure TfRadarIntervalSelect.btnNewClick(Sender: TObject);
begin
 with frmSummaryRadarIntervalList do begin
    isNew := True;
    edtName.Text :=  '[Noname]';
    ShowModal;
 end;
end;

procedure TfRadarIntervalSelect.btnOkClick(Sender: TObject);
var MList : TList;
    I, K, id_pattern : Integer;
    isSaved : Boolean;
    RArec : TResource_Allocation;
begin
try
  MList := TList.Create;
  dmTTT.GetResource_Interval_List_Mapping(frmSummaryResourceAllocation.ra.FData.Resource_Alloc_Index,mList);
  if MList.Count > 0 then
  begin
    for I := 0 to MList.Count - 1 do
    begin
      isSaved := False;
      for K := 0 to SelectList.Count - 1 do
      begin
        id_pattern := TResource_Allocation(SelectList[K]).FRadarListMap.Interval_List_Index;
        if id_pattern = TResource_Allocation(MList[I]).FRadarListMap.Interval_List_Index then
        begin
          //update
          RArec := TResource_Allocation.Create;
          RArec := TResource_Allocation(SelectList[K]);
          dmTTT.UpdateResource_Interval_List_Mapping(frmSummaryResourceAllocation.ra.FData.Resource_Alloc_Index, RArec);

          isSaved := True;
          if I < MList.Count - 1 then
            Break;
        end
        else if id_pattern = 0 then
        begin
          //insert
          RArec := TResource_Allocation.Create;
          RArec := TResource_Allocation(SelectList[K]);
          dmTTT.InsertResource_Interval_List_Mapping(RArec);

          isSaved := True;
        end;
      end;
      if not isSaved then
      begin
        //delete
        dmTTT.DeleteAllResource_Interval_List_Mapping(IntToStr(TResource_Allocation(MList[I]).FRadarListMap.Interval_List_Index));
      end;
    end;
  end
  else
  begin
    for K := 0 to SelectList.Count - 1 do
    begin
      //insert
      RArec := TResource_Allocation.Create;
      RArec := TResource_Allocation(SelectList[K]);
      dmTTT.InsertResource_Interval_List_Mapping(RArec);
    end;
  end;
  Close;
except
  Close;
end;
end;

procedure TfRadarIntervalSelect.btnRemoveClick(Sender: TObject);
begin
  if lstPredefinedSelect.ItemIndex <> -1 then
  begin
    SelectList.Delete(lstPredefinedSelect.ItemIndex);
    showSelectedData;
  end
  else
    ShowMessage('Select List first');
end;

procedure TfRadarIntervalSelect.FormCreate(Sender: TObject);
begin
  AllList := TList.Create;
  SelectList  := TList.Create;
  radarinterval := TRadar_Interval_List.Create;
end;

procedure TfRadarIntervalSelect.FormShow(Sender: TObject);
begin
  getAllData;
  getSelectedData;
end;

procedure TfRadarIntervalSelect.getAllData;
var
  I: Integer;
begin
  AllList.Clear;
  dmTTT.GetRadar_Interval_List(0,AllList,radarinterval);

  lstPredefinedAvailable.Clear;
  lstIDPredefined.Clear;
  for I := 0 to AllList.Count - 1 do
  begin
    lstPredefinedAvailable.Items.Add(TRadar_Interval_List(AllList[I]).FData.Interval_List_Identifier);
    lstIDPredefined.Items.Add(IntToStr(TRadar_Interval_List(AllList[I]).FData.Interval_List_Index));
  end;
end;

procedure TfRadarIntervalSelect.getSelectedData;
var
  I : Integer;
begin
  SelectList.Clear;
  dmTTT.GetResource_Interval_List_Mapping(frmSummaryResourceAllocation.ra.FData.Resource_Alloc_Index,SelectList);
  showSelectedData;
end;

procedure TfRadarIntervalSelect.lstPredefinedAvailableDblClick(Sender: TObject);
begin
  btnAdd.Click;
end;

procedure TfRadarIntervalSelect.showSelectedData;
var
  I: Integer;
begin
  lstPredefinedSelect.Clear;
  lstIDSelectedPredefined.Clear;
  for I := 0 to SelectList.Count - 1 do
  begin
    lstPredefinedSelect.Items.Add(TResource_Allocation(SelectList[I]).FRadarList.Interval_List_Identifier);
    lstIDSelectedPredefined.Items.Add(IntToStr(TResource_Allocation(SelectList[I]).FRadarList.Interval_List_Index));
  end;
end;

end.
