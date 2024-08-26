unit uPredefinedSelectListForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, uDBPattern;

type
  TfPredefinedSelect = class(TForm)
    btCopy: TButton;
    btEdit: TButton;
    btnAdd: TButton;
    btnCancel: TButton;
    btNew: TButton;
    btnOk: TButton;
    btnRemove: TButton;
    lstPredefinedAvailable: TListBox;
    lstPredefinedSelect: TListBox;
    lstIDPredefined: TListBox;
    shp1: TShape;
    lstIDSelectedPredefined: TListBox;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure btCopyClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure lstPredefinedAvailableDblClick(Sender: TObject);

  private
    { Private declarations }
    AllList, SelectList : TList;
    pattern : TPredefined_Pattern;
  public

    procedure getAllData;
    procedure getSelectedData;
    procedure showSelectedData;
  end;

var
  fPredefinedSelect: TfPredefinedSelect;

implementation

uses
  uDataModuleTTT, ufrmSummaryResourceAllocation, uDBAssetObject, ufrmSummaryPredefinedPattern;

{$R *.dfm}



procedure TfPredefinedSelect.btCopyClick(Sender: TObject);
var i: Integer;
begin
  if lstPredefinedAvailable.ItemIndex <> -1 then
  begin
    with frmSummaryPredefinedPattern do
    begin
      i := lstPredefinedAvailable.ItemIndex;
      edtPatternName.Text  := 'Copy of '+ TPredefined_Pattern(AllList[i]).FData.Pattern_Identifier;
      cbbType.ItemIndex    := TPredefined_Pattern(AllList[i]).FData.Pattern_Type;
      if TPredefined_Pattern(AllList[i]).FData.Pattern_Termination = 0 then
        chkEventPattern.Checked := True
      else
        chkEventPattern.Checked := False;

      edtHeading.Text        := FloatToStr(TPredefined_Pattern(AllList[i]).FData.Termination_Heading);

      dmTTT.GetVehicle_Definition(TPredefined_Pattern(AllList[i]).FData.Vehicle_Index,vehicle);
      edt1.Text              := vehicle.FData.Vehicle_Identifier;

      isNew := True;
    end;
  end;

  frmSummaryPredefinedPattern.ShowModal;
end;

procedure TfPredefinedSelect.btEditClick(Sender: TObject);
var i: Integer;
begin
  if lstPredefinedAvailable.ItemIndex <> -1 then
  begin
    with frmSummaryPredefinedPattern do
    begin
      i := lstPredefinedAvailable.ItemIndex;
      edtPatternName.Text  := TPredefined_Pattern(AllList[i]).FData.Pattern_Identifier;
      cbbType.ItemIndex    := TPredefined_Pattern(AllList[i]).FData.Pattern_Type;
      if TPredefined_Pattern(AllList[i]).FData.Pattern_Termination = 0 then
        chkEventPattern.Checked := True
      else
        chkEventPattern.Checked := False;

      edtHeading.Text        := FloatToStr(TPredefined_Pattern(AllList[i]).FData.Termination_Heading);

      dmTTT.GetVehicle_Definition(TPredefined_Pattern(AllList[i]).FData.Vehicle_Index,vehicle);
      edt1.Text              := vehicle.FData.Vehicle_Identifier;

      isNew := False;
    end;
  end;

  frmSummaryPredefinedPattern.ShowModal;
end;

procedure TfPredefinedSelect.btnAddClick(Sender: TObject);
var rec : TResource_Allocation;
  I: Integer;
  isSame : Boolean;
begin
  if lstPredefinedAvailable.ItemIndex <> -1 then
  begin
    rec := TResource_Allocation.Create;
    with rec.FResource_Pattern do
    begin
      Resource_Alloc_Index := frmSummaryResourceAllocation.ra.FData.Resource_Alloc_Index;
      Pattern_Index := TPredefined_Pattern(AllList[lstPredefinedAvailable.ItemIndex]).FData.Pattern_Index;
    end;
    rec.FPattern := TPredefined_Pattern(AllList[lstPredefinedAvailable.ItemIndex]).FData;
    isSame := False;
    for I := 0 to SelectList.Count - 1 do
    begin
      if TResource_Allocation(SelectList[I]).FResource_Pattern.Pattern_Index = rec.FResource_Pattern.Pattern_Index then
      begin
        isSame  := True;
        Continue;
      end;
    end;
    if not isSame then
    begin
      SelectList.Add(rec);
      showSelectedData;
    end;
  end;
end;

procedure TfPredefinedSelect.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfPredefinedSelect.btNewClick(Sender: TObject);
begin
  with frmSummaryPredefinedPattern do begin
    edtPatternName.Text      := '[Noname]';
    edtHeading.Text          := '';
    cbbType.Text             := '(None)';
    chkEventPattern.Checked  := false;
    edt1.Text                := '[None]';
    btnEditPattern.Enabled   := false;
    isNew := True;
    ShowModal;
  end;
end;

procedure TfPredefinedSelect.btnOkClick(Sender: TObject);
var MList : TList;
    I, K, id_pattern : Integer;
    isSaved : Boolean;
    RArec : TResource_Allocation;
begin
  MList := TList.Create;
  dmTTT.GetResource_Pattern_Mapping(frmSummaryResourceAllocation.ra.FData.Resource_Alloc_Index,MList);
  if MList.Count > 0 then
  begin
    for I := 0 to MList.Count - 1 do
    begin
      isSaved := False;
      for K := 0 to SelectList.Count - 1 do
      begin
        id_pattern := TResource_Allocation(SelectList[K]).FResource_Pattern.Pattern_Instance_Index;
        if id_pattern = TResource_Allocation(MList[I]).FResource_Pattern.Pattern_Instance_Index then
        begin
          //update
          RArec := TResource_Allocation.Create;
          RArec := TResource_Allocation(SelectList[K]);
          dmTTT.UpdateResource_Pattern_Mapping(id_pattern, RArec.FResource_Pattern);

          isSaved := True;
          if I < MList.Count - 1 then
            Break;
        end
        else if id_pattern = 0 then
        begin
          //insert
          RArec := TResource_Allocation.Create;
          RArec := TResource_Allocation(SelectList[K]);
          dmTTT.InsertResource_Pattern_Mapping(RArec.FResource_Pattern);

          isSaved := True;
        end;
      end;
      if not isSaved then
      begin
        //delete
        dmTTT.DeleteResource_Pattern_Mapping(TResource_Allocation(MList[I]).FResource_Pattern.Pattern_Instance_Index);
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
      dmTTT.InsertResource_Pattern_Mapping(RArec.FResource_Pattern);
    end;
  end;
  Close;
end;

procedure TfPredefinedSelect.btnRemoveClick(Sender: TObject);
begin
  if lstPredefinedSelect.ItemIndex <> -1 then
  begin
    SelectList.Delete(lstPredefinedSelect.ItemIndex);
    showSelectedData;
  end;
end;

procedure TfPredefinedSelect.FormCreate(Sender: TObject);
begin
  AllList := TList.Create;
  SelectList  := TList.Create;
  pattern := TPredefined_Pattern.Create;
end;

procedure TfPredefinedSelect.FormShow(Sender: TObject);
begin
  getAllData;
  getSelectedData;
end;

procedure TfPredefinedSelect.getAllData;
var
  I: Integer;
begin
  AllList.Clear;
  dmTTT.GetPredefined_Pattern(0,AllList,pattern);

  lstPredefinedAvailable.Clear;
  lstIDPredefined.Clear;
  for I := 0 to AllList.Count - 1 do
  begin
    lstPredefinedAvailable.Items.Add(TPredefined_Pattern(AllList[I]).FData.Pattern_Identifier);
    lstIDPredefined.Items.Add(IntToStr(TPredefined_Pattern(AllList[I]).FData.Pattern_Index));
  end;
end;

procedure TfPredefinedSelect.getSelectedData;
var
  I: Integer;
begin
  SelectList.Clear;
  dmTTT.GetResource_Pattern_Mapping(frmSummaryResourceAllocation.ra.FData.Resource_Alloc_Index,SelectList);

  showSelectedData;
end;

procedure TfPredefinedSelect.lstPredefinedAvailableDblClick(Sender: TObject);
begin
  btnAdd.Click;
end;

procedure TfPredefinedSelect.showSelectedData;
var
  I: Integer;
begin
  lstPredefinedSelect.Clear;
  lstIDSelectedPredefined.Clear;
  for I := 0 to SelectList.Count - 1 do
  begin
    lstPredefinedSelect.Items.Add(TResource_Allocation(SelectList[I]).FPattern.Pattern_Identifier);
    lstIDSelectedPredefined.Items.Add(IntToStr(TResource_Allocation(SelectList[I]).FPattern.Pattern_Index));
  end;
end;

end.
