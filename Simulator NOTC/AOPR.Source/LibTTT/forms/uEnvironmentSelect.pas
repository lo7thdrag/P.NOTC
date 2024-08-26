unit uEnvironmentSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfEnvironmentSelect = class(TForm)
    lbEnvironmentAvailable: TListBox;
    lbEnvironmentSelect: TListBox;
    btnAdd: TButton;
    btnRemove: TButton;
    shp1: TShape;
    btnOk: TButton;
    btnCancel: TButton;
    lbtempIDEnvi: TListBox;
    btNew: TButton;
    btCopy: TButton;
    btEdit: TButton;
    lbTempIdArea: TListBox;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btCopyClick(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure getEnvi;
  private
    { Private declarations }
    procedure getEnvironmentData;
  public
    { Public declarations }
    idEnvi,idArea  : string;
    pList,aList : TList;
    fromRA  : boolean;
  end;

var
  fEnvironmentSelect: TfEnvironmentSelect;



implementation

uses uSimDBEditor,uDBAsset_GameEnvironment,uResourceAllocation, uEnvironment,
uFEnvironmentSelection, uEnvironmentCharacteristicsWindow;

{$R *.dfm}

procedure TfEnvironmentSelect.btCopyClick(Sender: TObject);
begin
  idArea := lbtempIdArea.Items.Strings[lbEnvironmentAvailable.ItemIndex];
  EnvironmentForm.isCopy := True;
  fromRA  := True;
  getEnvironmentData;
end;

procedure TfEnvironmentSelect.btEditClick(Sender: TObject);
begin
  idArea := lbTempIdArea.Items.Strings[lbEnvironmentAvailable.ItemIndex];
  EnvironmentForm.isCopy := False;
  fromRA  := True;
  getEnvironmentData;
end;

procedure TfEnvironmentSelect.btnAddClick(Sender: TObject);
var i: integer;
begin
 for I := 0 to lbEnvironmentAvailable.Items.Count - 1 do
   if lbEnvironmentAvailable.Selected[I] then
   begin
     if lbEnvironmentSelect.Count = 0 then
      begin
        lbEnvironmentSelect.Items.Clear;
        lbEnvironmentSelect.Items.Add(lbEnvironmentAvailable.Items[I]);
        idEnvi :=lbtempIDEnvi.Items[I];
      end
     else begin
        lbEnvironmentSelect.Items.Add(lbEnvironmentAvailable.Items[i]);
        lbEnvironmentAvailable.Items.Add(lbEnvironmentSelect.Items[0]);
        lbEnvironmentSelect.Items.Delete(0);
        idEnvi :=lbtempIDEnvi.Items[I];
     end;
   end;

  for I :=lbEnvironmentAvailable.Items.Count - 1 downto 0 do
  if lbEnvironmentAvailable.Selected[I] then
  begin
   lbEnvironmentAvailable.Items.Delete(I);
   lbtempIDEnvi.Items.Delete(I);
  end;

end;

procedure TfEnvironmentSelect.getEnvironmentData;
begin
  with EnvironmentForm do begin
    isNew := false;
   // id_area  := lbTempidArea.Items.Strings[lbEnvironmentList.ItemIndex];
    id_game_area := StrToInt(fEnvironmentSelect.idArea);
    envi_id  := lbtempIDEnvi.Items.Strings[lbEnvironmentAvailable.ItemIndex];
    if fEnvironmentSelect.idArea <> '' then
    begin
       getGameArea(IntToStr(id_game_area),fEnvironmentSelect.pList,EnvironmentCharacteristicsWindowForm.GameEnviroDef);
       if isCopy then
          edtName.Text := 'Copy of ' + fEnvironmentSelect.lbEnvironmentAvailable.Items.Strings[fEnvironmentSelect.lbEnvironmentAvailable.ItemIndex]
       else
          edtName.Text := fEnvironmentSelect.lbEnvironmentAvailable.Items.Strings[fEnvironmentSelect.lbEnvironmentAvailable.ItemIndex];

    end;
    edtArea.Text := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FGameArea.Game_Area_Identifier;
    Show;
    getEnvironment;
  end;
  getEnvi;
end;


procedure TfEnvironmentSelect.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfEnvironmentSelect.btNewClick(Sender: TObject);
begin
  fromRA  := True;
  EnvironmentForm.isNew := true;
  EnvironmentForm.envi_id := IntToStr(622);
  EnvironmentForm.getEnvironment;
  EnvironmentForm.edtName.Text := '(Unnamed)';
  EnvironmentForm.edtArea.Text := '(None)';
  EnvironmentForm.btnEditCharacteristics.Enabled := false;
  EnvironmentForm.Show;
end;

procedure TfEnvironmentSelect.btnOkClick(Sender: TObject);
begin
  if (idEnvi = '') then
  begin
    Exit;
  end;

 getDBEnvironments(strtoint(idEnvi),pList, SimMgr.GameEnvironment);
 ResourceAllocationForm.edtEnvironment.Text := SimMgr.GameEnvironment.FData.Game_Enviro_Identifier;
 ResourceAllocationForm.ra.FData.Game_Enviro_Index := SIMMgr.GameEnvironment.FData.Game_Enviro_Index;
 close;
end;

procedure TfEnvironmentSelect.btnRemoveClick(Sender: TObject);
var I     : integer;
begin
 for I := 0 to lbEnvironmentSelect.Items.Count - 1 do
   if lbEnvironmentSelect.Selected[I] then
   begin
    lbEnvironmentAvailable.Items.Add(lbEnvironmentSelect.Items[I]);
    lbtempIDEnvi.Items.Add(idEnvi);
   end;

 for I :=lbEnvironmentSelect.Items.Count - 1 downto 0 do
   if lbEnvironmentSelect.Selected[I] then
   begin
    lbEnvironmentSelect.Items.Delete(I);
    idEnvi := '';
   end;

end;

procedure TfEnvironmentSelect.FormShow(Sender: TObject);
var i : integer;
begin
  getEnvi;
end;

procedure TfEnvironmentSelect.getEnvi;
var i:integer;
begin
  pList := Tlist.Create;

//get all environment name
 uSimDBEditor.getEnvironments(pList);

 lbEnvironmentAvailable.Items.Clear;
 lbtempIDEnvi.Items.Clear;

 for I := 0 to pList.Count - 1 do
 begin
  lbEnvironmentAvailable.Items.Add(TGame_Environment_Definition(pList[i]).FData.Game_Enviro_Identifier);
  lbtempIDEnvi.Items.Add(inttostr(TGame_Environment_Definition(pList[i]).FData.Game_Enviro_Index));
  lbTempIdArea.Items.Add(IntToStr(TGame_Environment_Definition(pList[i]).FData.Game_Area_Index));
  end;
end;



end.
