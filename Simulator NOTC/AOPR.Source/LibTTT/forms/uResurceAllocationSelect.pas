unit uResurceAllocationSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,uSimManager, ExtCtrls;

type
  TfResorceAllocationSelect = class(TForm)
    lbAvailableResAlloc: TListBox;
    lbSelectedRes: TListBox;
    btOK: TButton;
    Button2: TButton;
    btnAdd: TButton;
    btRemove: TButton;
    lbTempIdRA: TListBox;
    btNew: TButton;
    btCopy: TButton;
    Shape1: TShape;
    btnEdit: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btRemoveClick(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  public
  RA_id,idRASelected  :string;

    { Public declarations }
  end;

var
  fResorceAllocationSelect: TfResorceAllocationSelect;
  raList:TList;




implementation

uses uSimDBEditor,uDBAssetObject,uDBScenario, ufScenario, uResourceAllocation;//,uT3SimManager;
{$R *.dfm}

procedure TfResorceAllocationSelect.btNewClick(Sender: TObject);
begin
  ResourceAllocationForm.Show;
end;

procedure TfResorceAllocationSelect.btOKClick(Sender: TObject);
begin
 if (idRASelected<>'') then
 begin
   getDBResourceAllocation(strtoint(idRASelected),raList, frmScenario.ResourceAllocation);
   frmScenario.edResourceAllocation.text := frmScenario.ResourceAllocation.FData.Allocation_Identifier;
   frmScenario.selectedResourceAllocation := frmScenario.ResourceAllocation.FData.Resource_Alloc_Index;

   frmScenario.Scenario.FData.Resource_Alloc_Index := StrToInt(idRASelected);
   close;
 end;
end;

procedure TfResorceAllocationSelect.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfResorceAllocationSelect.btnAddClick(Sender: TObject);
var i: integer;
begin
  idRASelected := lbTempIdRA.Items[lbAvailableResAlloc.ItemIndex];
 for I := 0 to lbAvailableResAlloc.Items.Count - 1 do
   if lbAvailableResAlloc.Selected[I] then
   begin
    if lbSelectedRes.Count = 0 then
      begin
        lbSelectedRes.Items.Clear;
        lbSelectedRes.Items.Add(lbAvailableResAlloc.Items[I]);
        //idRASelected :=lbTempIdRA.Items[I];
      end
    else begin
      lbSelectedRes.Items.Add(lbAvailableResAlloc.Items[i]);
      lbAvailableResAlloc.Items.Add(lbSelectedRes.Items[0]);
      lbSelectedRes.Items.Delete(0);
      //idRASelected :=lbTempIdRA.Items[I];
    end;
   end;

 for I :=lbAvailableResAlloc.Items.Count - 1 downto 0 do
   if lbAvailableResAlloc.Selected[I] then
   begin
    lbAvailableResAlloc.Items.Delete(I);
    lbTempIdRA.Items.Delete(I);
   end;

   //idRASelected := lbTempIdRA.Items[0];
end;

procedure TfResorceAllocationSelect.btnEditClick(Sender: TObject);
begin
   RA_id := lbTempIdRA.Items.Strings[lbAvailableResAlloc.ItemIndex];
   with ResourceAllocationForm do begin
      isnew := False;
      ra_id := StrToInt(lbTempIdRA.Items.Strings[lbAvailableResAlloc.ItemIndex]);
      edtName.Text := lbAvailableResAlloc.Items.Strings[lbAvailableResAlloc.ItemIndex];
      edtStartTime.Text := datetimetostr( floattodatetime(TResource_Allocation(raList[lbAvailableResAlloc.ItemIndex]).FData.Game_Start_Time));
      Show;
   end;
end;

procedure TfResorceAllocationSelect.btRemoveClick(Sender: TObject);
 var I     : integer;
begin
 for I := 0 to lbSelectedRes.Items.Count - 1 do
   if lbSelectedRes.Selected[I] then
   begin
    lbAvailableResAlloc.Items.Add(lbSelectedRes.Items[I]);
    lbTempIdRA.Items.Add(idRASelected);
   end;

 for I :=lbSelectedRes.Items.Count - 1 downto 0 do
   if lbSelectedRes.Selected[I] then
   begin
    lbSelectedRes.Items.Delete(I);
    idRASelected := '';
   end;
end;

procedure TfResorceAllocationSelect.FormCreate(Sender: TObject);
begin
  raList := Tlist.Create;
end;

procedure TfResorceAllocationSelect.FormShow(Sender: TObject);
 var I     : integer;
begin

 if frmScenario.fromScenario then
    btRemove.Enabled := False;

//get all scenario name
 uSimDBEditor.getResourceAllocation(raList);

 lbAvailableResAlloc.Items.Clear;
 lbTempIdRA.Items.Clear;
 for I := 0 to raList.Count - 1 do
 begin
  lbAvailableResAlloc.Items.Add(TResource_Allocation(raList[i]).FData.Allocation_Identifier);
  lbTempIdRA.Items.Add(IntToStr(TResource_Allocation(raList[i]).FData.Resource_Alloc_Index));
 end;
end;


end.
