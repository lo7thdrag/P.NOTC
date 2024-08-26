unit uGameDefaultSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,uDBGame_Defaults ;

type
  TfGameDefaults = class(TForm)
    lbGameDefaultAvailable: TListBox;
    lbGameDefaultSelect: TListBox;
    btnRemove: TButton;
    btnCancel: TButton;
    btnOk: TButton;
    shp1: TShape;
    lbTempID: TListBox;
    btnEdit: TButton;
    btnCopy: TButton;
    btnNew: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  pList : TList;
  idGDSelected: string;
  fromCharacteristic : boolean;
  fromResaourceAlloc: boolean;
  end;

var
  fGameDefaults: TfGameDefaults;

implementation

uses uSimDBEditor,uResourceAllocation, uDataModuleTTT,
  uCharacteristicLandmass, uDBAssetObject, uGameDefaults;

{$R *.dfm}

procedure TfGameDefaults.btn1Click(Sender: TObject);
var i: integer;
begin
 for I := 0 to lbGameDefaultAvailable.Items.Count - 1 do
   if lbGameDefaultAvailable.Selected[I] then
   begin
    if lbGameDefaultSelect.Count = 0 then
      begin
        lbGameDefaultSelect.Items.Clear;
        lbGameDefaultSelect.Items.Add(lbGameDefaultAvailable.Items[I]);
        idGDSelected :=lbTempID.Items[I];
      end
    else begin
      lbGameDefaultSelect.Items.Add(lbGameDefaultAvailable.Items[i]);
      lbGameDefaultAvailable.Items.Add(lbGameDefaultSelect.Items[0]);
      lbGameDefaultSelect.Items.Delete(0);
      idGDSelected :=lbTempID.Items[I];
    end;
   end;

 for I :=lbGameDefaultAvailable.Items.Count - 1 downto 0 do
   if lbGameDefaultAvailable.Selected[I] then
   begin
    lbGameDefaultAvailable.Items.Delete(I);
    lbTempId.Items.Delete(I);
   end;
end;

procedure TfGameDefaults.btnAddClick(Sender: TObject);
var i: integer;
begin
 for I := 0 to lbGameDefaultAvailable.Items.Count - 1 do
   if lbGameDefaultAvailable.Selected[I] then
   begin
    if lbGameDefaultSelect.Count = 0 then
      begin
        lbGameDefaultSelect.Items.Clear;
        lbGameDefaultSelect.Items.Add(lbGameDefaultAvailable.Items[I]);
        idGDSelected :=lbTempId.Items[I];
      end
    else begin
      lbGameDefaultSelect.Items.Add(lbGameDefaultAvailable.Items[i]);
      lbGameDefaultAvailable.Items.Add(lbGameDefaultSelect.Items[0]);
      lbGameDefaultSelect.Items.Delete(0);
      idGDSelected :=lbTempId.Items[I];
    end;
   end;

 for I :=lbGameDefaultAvailable.Items.Count - 1 downto 0 do
   if lbGameDefaultAvailable.Selected[I] then
   begin
    lbGameDefaultAvailable.Items.Delete(I);
    lbTempId.Items.Delete(I);
   end;
end;

procedure TfGameDefaults.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfGameDefaults.btnEditClick(Sender: TObject);
begin
  idGDSelected := lbTempID.Items.Strings[lbGameDefaultAvailable.ItemIndex];
  with fGameDefault do
  begin
    dmTTT.GetAllGame_Defaults(StrToInt(idGDSelected),mList,game_default);
    Definition;
    Show;
  end;
  Close;
end;

procedure TfGameDefaults.btnOkClick(Sender: TObject);
begin
  if (idGDSelected = '') then
  begin
    exit;
  end;
 if fromResaourceAlloc then
 begin
    ResourceAllocationForm.edtDefaults.Text := lbGameDefaultSelect.Items[0];
    ResourceAllocationForm.ra.FData.Defaults_Index := SIMMgr.Resource_alloc.FData.Defaults_Index;
 end;

 if fromCharacteristic then
 begin
    fCharacteristicLandmass.edtDefaults.Text := lbGameDefaultSelect.Items[0];
    fCharacteristicLandmass.default_index := SIMMgr.Resource_alloc.FData.Defaults_Index;
 end;

 close;
end;

procedure TfGameDefaults.btnRemoveClick(Sender: TObject);
var I     : integer;
begin
 for I := 0 to lbGameDefaultSelect.Items.Count - 1 do
   if lbGameDefaultSelect.Selected[I] then
   begin
    lbGameDefaultAvailable.Items.Add(lbGameDefaultSelect.Items[I]);
    lbTempId.Items.Add(idGDSelected);
   end;

 for I :=lbGameDefaultSelect.Items.Count - 1 downto 0 do
   if lbGameDefaultSelect.Selected[I] then
   begin
    lbGameDefaultSelect.Items.Delete(I);
    idGDSelected := '';
   end;
end;

procedure TfGameDefaults.FormShow(Sender: TObject);
var i : integer;
  rec : TGame_Defaults;
begin
 pList := Tlist.Create;
 rec := TGame_Defaults.Create;
//get all environment name
 uSimDBEditor.getDefaults(pList, rec);

 lbGameDefaultAvailable.Items.Clear;
 lbTempId.Items.Clear;
 for I := 0 to pList.Count - 1 do
 begin
  lbGameDefaultAvailable.Items.Add(TGame_Defaults(pList[i]).FData.Defaults_Identifier);
  lbTempId.Items.Add(inttostr(TGame_Defaults(pList[i]).FData.Defaults_Index));

 end;

end;

end.
