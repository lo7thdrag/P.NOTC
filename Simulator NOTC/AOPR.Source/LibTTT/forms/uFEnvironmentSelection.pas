unit uFEnvironmentSelection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfEnvironmentsSelect = class(TForm)
    lbEnvironmentList: TListBox;
    btNew: TButton;
    btEdit: TButton;
    lbTempId: TListBox;
    lbTempIdArea: TListBox;
    btCopy: TButton;
    btRemove: TButton;
    btUsage: TButton;
    btFilter: TButton;
    btClose: TButton;
    procedure FormShow(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btCopyClick(Sender: TObject);
    procedure lbEnvironmentListClick(Sender: TObject);
    procedure btRemoveClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
  private
    { Private declarations }
    procedure getEnvironmentData;
  public
    { Public declarations }
    id_area:string;
    pList : TList;

  end;

var
  fEnvironmentsSelect: TfEnvironmentsSelect;
  aList : TList;


implementation

uses uSimDBEditor,newclassASTT,uDBAsset_GameEnvironment, uEnvironment,
  uDataModuleTTT, uEnvironmentCharacteristicsWindow;

{$R *.dfm}

procedure TfEnvironmentsSelect.btCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfEnvironmentsSelect.btCopyClick(Sender: TObject);
begin
   EnvironmentForm.isCopy := True;
   getEnvironmentData;
end;

procedure TfEnvironmentsSelect.btEditClick(Sender: TObject);
begin
  id_area  := lbTempidArea.Items.Strings[lbEnvironmentList.ItemIndex];
  EnvironmentForm.isCopy := False;
  getEnvironmentData;
end;

procedure TfEnvironmentsSelect.getEnvironmentData;
begin

  with EnvironmentForm do begin
    isNew := false;
   // id_area  := lbTempidArea.Items.Strings[lbEnvironmentList.ItemIndex];
    id_game_area := StrToInt(fEnvironmentsSelect.id_area);
    envi_id  := fEnvironmentsSelect.lbTempId.Items.Strings[fEnvironmentsSelect.lbEnvironmentList.ItemIndex];
    if fEnvironmentsSelect.id_area <> '' then
    begin
       getGameArea(IntToStr(id_game_area),fEnvironmentsSelect.pList,EnvironmentCharacteristicsWindowForm.GameEnviroDef);
       if isCopy then
          edtName.Text := 'Copy of ' + lbEnvironmentList.Items.Strings[lbEnvironmentList.ItemIndex]
       else
          edtName.Text := fEnvironmentsSelect.lbEnvironmentList.Items.Strings[fEnvironmentsSelect.lbEnvironmentList.ItemIndex];

    end;
    edtArea.Text := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FGameArea.Game_Area_Identifier;
    Show;
  end;
end;

procedure TfEnvironmentsSelect.btNewClick(Sender: TObject);
begin
  EnvironmentForm.isNew := true;
  EnvironmentForm.envi_id := IntToStr(622);
  EnvironmentForm.getEnvironment;
  EnvironmentForm.edtName.Text := '(Unnamed)';
  EnvironmentForm.edtArea.Text := '(None)';
  EnvironmentForm.btnEditCharacteristics.Enabled := false;
  EnvironmentForm.Show;
end;

procedure TfEnvironmentsSelect.btRemoveClick(Sender: TObject);
begin
  if lbEnvironmentList.ItemIndex <> -1 then
  begin
    dmTTT.deleteGame_Environment_Def(StrToInt(lbTempId.Items.Strings[lbEnvironmentList.ItemIndex]));
    Self.Close;
    Self.Show;
  end;
end;

procedure TfEnvironmentsSelect.FormShow(Sender: TObject);
var i : integer;
begin
  //setting button enable
  btNew.Enabled := true;
  btClose.Enabled := true;
  //setting button disable
  btCopy.Enabled := false;
  btEdit.Enabled := false;
  btRemove.Enabled := false;
  btUsage.Enabled := false;
  btFilter.Enabled := false;

 pList := Tlist.Create;

//get all scenario name
 uSimDBEditor.getEnvironments(pList);

 lbEnvironmentList.Items.Clear;
 lbTempidArea.Items.Clear;
 lbTempId.Items.Clear;

 for I := 0 to pList.Count - 1 do begin
  lbEnvironmentList.Items.Add(TGame_Environment_Definition(pList[i]).FData.Game_Enviro_Identifier);
  lbTempId.Items.Add(IntToStr(TGame_Environment_Definition(pList[i]).FData.Game_Enviro_Index));
  lbTempidArea.Items.Add(IntToStr(TGame_Environment_Definition(pList[i]).FData.Game_Area_Index));
 end;

end;

procedure TfEnvironmentsSelect.lbEnvironmentListClick(Sender: TObject);
begin
  btCopy.Enabled := true;
  btEdit.Enabled := true;
  btRemove.Enabled := true;
  btUsage.Enabled := true;
  btFilter.Enabled := false;
end;

end.
