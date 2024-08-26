unit uRAList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDBAssetObject;

type
  TfRAList = class(TForm)
    btClose: TButton;
    btCopy: TButton;
    btEdit: TButton;
    btFilter: TButton;
    btNew: TButton;
    btRemove: TButton;
    btUsage: TButton;
    lbRAList: TListBox;
    lbRAId: TListBox;
    procedure FormShow(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure btCopyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure getResource;
    procedure btRemoveClick(Sender: TObject);
    procedure lbRAListClick(Sender: TObject);
  private
    { Private declarations }
    procedure getDataResource;
  public
    { Public declarations }
    raList:TList;
    RA_id :string;
    resource_alloc :TResource_Allocation;
  end;

var
  fRAList: TfRAList;

implementation

uses uSimDBEditor, uResourceAllocation, uDataModuleTTT;

{$R *.dfm}

procedure TfRAList.btCloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfRAList.btCopyClick(Sender: TObject);
begin
  ResourceAllocationForm.isCopy := True;
  getDataResource;
end;

procedure TfRAList.btEditClick(Sender: TObject);
begin
  if lbRAList.ItemIndex = -1 then
  begin
    Exit;
  end
  else begin
    ResourceAllocationForm.isCopy := False;
    ResourceAllocationForm.isnew := False;
    getDataResource;
  end;

end;

procedure TfRAList.getDataResource;
begin
  RA_id := lbRAId.Items.Strings[lbRAList.ItemIndex];
  with ResourceAllocationForm do begin
    isnew := False;
    ra_id := StrToInt(lbRAId.Items.Strings[lbRAList.ItemIndex]);
    edtStartTime.Text := datetimetostr( floattodatetime(TResource_Allocation(raList[lbRAList.ItemIndex]).FData.Game_Start_Time));
    Show;
  end;
end;

procedure TfRAList.btNewClick(Sender: TObject);
begin
  with ResourceAllocationForm do
  begin
    isnew := true;
    Show;
  end;
end;

procedure TfRAList.btRemoveClick(Sender: TObject);
begin
  dmTTT.DeleteResource_Allocation(lbRAId.Items.Strings[lbRAList.ItemIndex]);
  getResource;
end;

procedure TfRAList.FormCreate(Sender: TObject);
begin
  raList := Tlist.Create;
end;

procedure TfRAList.FormShow(Sender: TObject);
begin
  getResource;
  btEdit.Enabled := False;
  btCopy.Enabled := False;
  btRemove.Enabled := False;
  btUsage.Enabled  := False;
  btFilter.Enabled := False;

end;

procedure TfRAList.getResource;
var I: Integer;
begin
//get all scenario name
  dmTTT.getAllResource_Allocation(raList);

  lbRAList.Items.Clear;
  lbRAId.Items.Clear;


  for I := 0 to raList.Count - 1 do
  begin
    lbRAList.Items.Add(TResource_Allocation(raList[i]).FData.Allocation_Identifier);
    lbRAId.Items.Add(IntToStr(TResource_Allocation(raList[i]).FData.Resource_Alloc_Index));
  end;

end;


procedure TfRAList.lbRAListClick(Sender: TObject);
begin
  btEdit.Enabled := True;
  btCopy.Enabled := True;
  btRemove.Enabled := True;
  btUsage.Enabled  := True;
end;

end.
