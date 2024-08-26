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
    lbTempIDSelect: TListBox;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure getGameDefault;
    procedure showGameDefault;
    procedure FormCreate(Sender: TObject);
    procedure lbGameDefaultAvailableDblClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  allList,sList : TList;
  idGDSelected: string;
  fromCharacteristic : boolean;
  fromResaourceAlloc: boolean;
  end;

var
  fGameDefaults: TfGameDefaults;

implementation

uses uSimDBEditor,ufrmSummaryResourceAllocation, uDataModuleTTT,
  uCharacteristicLandmass, uDBAssetObject, ufrmSummaryGameDefaults, ufrmAdminMainForm;

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
  if fromCharacteristic then
  begin
    if lbGameDefaultAvailable.ItemIndex <> -1 then
    begin
      fCharacteristicLandmass.default_index := StrToInt(lbTempID.Items[lbGameDefaultAvailable.ItemIndex]);

      showGameDefault;
    end;
  end
  else if fromResaourceAlloc then
  begin
    if lbGameDefaultAvailable.ItemIndex <> -1 then
    begin
      frmSummaryResourceAllocation.idGDef := lbTempID.Items[lbGameDefaultAvailable.ItemIndex];

      showGameDefault;
    end;
  end
  else begin
    for I := 0 to lbGameDefaultAvailable.Items.Count - 1 do
    if lbGameDefaultAvailable.Selected[I] then
    begin
      if lbGameDefaultSelect.Count = 0 then
      begin
        lbGameDefaultSelect.Items.Clear;
        lbGameDefaultSelect.Items.Add(lbGameDefaultAvailable.Items[I]);
        lbTempIDSelect.Items.Add(lbTempID.Items[I]);
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
end;

procedure TfGameDefaults.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfGameDefaults.btnCopyClick(Sender: TObject);
begin
  idGDSelected := lbTempID.Items.Strings[lbGameDefaultAvailable.ItemIndex];
  with frmSummaryGameDefault do
  begin
//    isCopy := True;
//    dmTTT.GetAllGame_Defaults(StrToInt(idGDSelected),mList);
//    Definition;
    ShowModal;
  end;
end;

procedure TfGameDefaults.btnEditClick(Sender: TObject);
begin
  idGDSelected := lbTempID.Items.Strings[lbGameDefaultAvailable.ItemIndex];
  with frmSummaryGameDefault do
  begin
//    dmTTT.GetAllGame_Defaults(StrToInt(idGDSelected),mList);
//    Definition;
    ShowModal;
  end;
end;

procedure TfGameDefaults.btnNewClick(Sender: TObject);
begin
  frmAdminMainForm.index := 6;

end;

procedure TfGameDefaults.btnOkClick(Sender: TObject);
begin
  if fromCharacteristic then
  begin
    if lbGameDefaultSelect.Count <> 0 then
      fCharacteristicLandmass.edtDefaults.Text := lbGameDefaultSelect.Items[0]
    else fCharacteristicLandmass.edtDefaults.Text := '[None]';
  end
  else if fromResaourceAlloc then
  begin
    if lbGameDefaultSelect.Count <> 0 then
      frmSummaryResourceAllocation.edtDefaults.Text := lbGameDefaultSelect.Items[0]
    else frmSummaryResourceAllocation.edtDefaults.Text := '[None]';
  end
  else begin
    if (idGDSelected = '') then
    begin
      exit;
    end;
    if fromResaourceAlloc then
    begin
      frmSummaryResourceAllocation.edtDefaults.Text := lbGameDefaultSelect.Items[0];
      frmSummaryResourceAllocation.ra.FData.Defaults_Index := SIMMgr.Resource_alloc.FData.Defaults_Index;
    end;
  end;

 close;
end;

procedure TfGameDefaults.btnRemoveClick(Sender: TObject);
var I     : integer;
begin
  if fromCharacteristic then
  begin
    if lbGameDefaultSelect.ItemIndex <> -1 then
    begin
      fCharacteristicLandmass.default_index := 0;
      showGameDefault;
    end;
  end
  else if fromResaourceAlloc then
  begin
    if lbGameDefaultSelect.ItemIndex <> -1 then
    begin
      frmSummaryResourceAllocation.idGDef := '';
      showGameDefault;
    end;
  end
  else begin
   for I := 0 to lbGameDefaultSelect.Items.Count - 1 do
     if lbGameDefaultSelect.Selected[I] then
     begin
      lbGameDefaultAvailable.Items.Add(lbGameDefaultSelect.Items[I]);
      lbTempId.Items.Add(idGDSelected);
      lbGameDefaultSelect.Items.Delete(I);
  //  dmTTT.deleteGame_Defaults(StrToInt(fGameDefaults.idGDSelected));
     end;

   for I :=lbGameDefaultSelect.Items.Count - 1 downto 0 do
     if lbGameDefaultSelect.Selected[I] then
     begin
      lbGameDefaultSelect.Items.Delete(I);
      idGDSelected := '';
      Refresh;
     end;
  end;
end;

procedure TfGameDefaults.FormCreate(Sender: TObject);
begin
  allList := TList.Create;
  sList   := TList.Create;
end;

procedure TfGameDefaults.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
if GetKeyState(VK_ESCAPE)< 0 then
  begin
    case Msg.CharCode of
     VK_ESCAPE:
     begin
       btnOk.Click;
     end;
    end;
  end;
end;

procedure TfGameDefaults.FormShow(Sender: TObject);
begin
  getGameDefault;
  Refresh;
end;

procedure TfGameDefaults.getGameDefault;
var
  rec : TGame_Defaults;
begin
  rec     := TGame_Defaults.Create;

  //get all environment name
  uSimDBEditor.getDefaults(allList, rec);

  showGameDefault;
end;

procedure TfGameDefaults.showGameDefault;
var i : integer;
begin
  lbGameDefaultAvailable.Items.Clear;
  lbTempId.Items.Clear;
  lbGameDefaultSelect.Items.Clear;
  lbTempIDSelect.Items.Clear;

  if fromResaourceAlloc then
  with frmSummaryResourceAllocation do
  begin
    for I := 0 to allList.Count - 1 do
    begin
      if frmSummaryResourceAllocation.idGDef = IntToStr(TGame_Defaults(allList[i]).FData.Defaults_Index) then
      begin
        lbGameDefaultSelect.Items.Add(TGame_Defaults(allList[i]).FData.Defaults_Identifier);
        lbTempIDSelect.Items.Add(IntToStr(TGame_Defaults(allList[i]).FData.Defaults_Index));
      end
      else begin
        lbGameDefaultAvailable.Items.Add(TGame_Defaults(allList[i]).FData.Defaults_Identifier);
        lbTempId.Items.Add(inttostr(TGame_Defaults(allList[i]).FData.Defaults_Index));
      end;
    end;
  end;

  if fromCharacteristic then
  begin
    for I := 0 to allList.Count - 1 do
    begin
      if fCharacteristicLandmass.default_index = TGame_Defaults(allList[i]).FData.Defaults_Index then
      begin
        lbGameDefaultSelect.Items.Add(TGame_Defaults(allList[i]).FData.Defaults_Identifier);
        lbTempIDSelect.Items.Add(IntToStr(TGame_Defaults(allList[i]).FData.Defaults_Index));
      end
      else begin
        lbGameDefaultAvailable.Items.Add(TGame_Defaults(allList[i]).FData.Defaults_Identifier);
        lbTempId.Items.Add(inttostr(TGame_Defaults(allList[i]).FData.Defaults_Index));
      end;
    end;
  end;
end;

procedure TfGameDefaults.lbGameDefaultAvailableDblClick(Sender: TObject);
begin
  btnAddClick(lbGameDefaultAvailable);
end;

end.
