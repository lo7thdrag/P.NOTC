unit uGameAreaSelection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfGameAreaSelection = class(TForm)
    lbAllGame: TListBox;
    lbGameSel: TListBox;
    btAdd: TButton;
    btCopy: TButton;
    btEdit: TButton;
    btNew: TButton;
    btOK: TButton;
    btRemove: TButton;
    Shape1: TShape;
    btCancel: TButton;
    lbTempIdAll: TListBox;
    procedure btCancelClick(Sender: TObject);
    procedure getGameArea;
    procedure FormShow(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure btRemoveClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btCopyClick(Sender: TObject);
    procedure btNewClick(Sender: TObject);

  private
    { Private declarations }
  public
   fromEnviro, fromOverlay: boolean;
    { Public declarations }
    idRASelected        : string;
  end;

var
  fGameAreaSelection: TfGameAreaSelection;
  pList,gList       : TList;

implementation

{$R *.dfm}
uses uSimDBEditor,uDBAsset_GameEnvironment,uResourceAllocation,
  uResurceAllocationSelect, uEnvironment, uFEnvironmentSelection,
  uEnvironmentCharacteristicsWindow, uOverlay, uGameAreaList, uExerciseArea;

procedure TfGameAreaSelection.btAddClick(Sender: TObject);
var i: integer;
begin
 for I := 0 to lbAllGame.Items.Count - 1 do
   if lbAllGame.Selected[I] then
   begin
      if lbGameSel.Count = 0 then
        begin
        lbGameSel.Items.Clear;
        lbGameSel.Items.Add(lbAllGame.Items[I]);
        idRASelected :=lbTempIdAll.Items[I];
        end
      else begin
        lbGameSel.Items.Add(lbAllGame.Items[i]);
        lbAllGame.Items.Add(lbGameSel.Items[0]);
        lbGameSel.Items.Delete(0);
        idRASelected :=lbTempIdAll.Items[I];
      end;
   end;

 for I :=lbAllGame.Items.Count - 1 downto 0 do
   if lbAllGame.Selected[I] then
   begin
    lbAllGame.Items.Delete(I);
    lbTempIdAll.Items.Delete(I);
   end;

end;

procedure TfGameAreaSelection.btCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfGameAreaSelection.btCopyClick(Sender: TObject);
begin
  ExerciseAreaForm.isCopy := True;
  fGameAreaList.getGame;
end;

procedure TfGameAreaSelection.btEditClick(Sender: TObject);
begin
  ExerciseAreaForm.isCopy := False;
  fGameAreaList.getGame;

end;

procedure TfGameAreaSelection.btNewClick(Sender: TObject);
begin
  with ExerciseAreaForm do
  begin
    edtName.Text := '(Noname)';
    edtLatitude.Text := '00° 00.000'''+' N';
    edtLongitude.Text := '000° 00.000'''+' E';
    edtMaximum.Text := '1000';
    Show;
  end;
end;

procedure TfGameAreaSelection.btOKClick(Sender: TObject);
begin
  if fromEnviro then
  begin
    EnvironmentForm.edtArea.Text := lbGameSel.Items[0];
    EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Area_Index := StrToInt(idRASelected);
    EnvironmentCharacteristicsWindowForm.GameEnviroDef.FGameArea.Game_Area_Index := StrToInt(idRASelected);
    EnvironmentForm.id_game_area := StrToInt(idRASelected);

  Close;
  EnvironmentForm.Show;
  end
  else if fromOverlay then
  begin
    fOverlay.edtArea.Text := lbGameSel.Items[0];
    fOverlay.game_area_def.FData.Game_Area_Index := StrToInt(idRASelected);
    fOverlay.game_area_def.FGameArea.Game_Area_Index := StrToInt(idRASelected);

  Close;
  fOverlay.Show;
  end;
end;


procedure TfGameAreaSelection.btRemoveClick(Sender: TObject);
var i :integer;
begin
  for I := 0 to lbGameSel.Items.Count - 1 do
   if lbGameSel.Selected[I] then
   begin
    lbAllGame.Items.Add(lbGameSel.Items[I]);
    lbTempIdAll.Items.Add(idRASelected);
   end;

 for I :=lbGameSel.Items.Count - 1 downto 0 do
   if lbGameSel.Selected[I] then
   begin
    lbGameSel.Items.Delete(I);
    idRASelected := '';
   end;
end;

procedure TfGameAreaSelection.FormShow(Sender: TObject);
begin
  getGameArea;
end;

procedure TfGameAreaSelection.getGameArea;
var i : integer;
begin
  pList := Tlist.Create;
  gList := TList.Create;

//get all vehicle name
 uSimDBEditor.getGameAreaList(gList);

 lbAllGame.Items.Clear;
 lbTempIdAll.Items.Clear;


 for I := 0 to gList.Count - 1 do
 begin
    lbAllGame.Items.Add(TGame_Environment_Definition(gList[i]).FGameArea.Game_Area_Identifier);
    lbTempIdAll.Items.Add(IntToStr(TGame_Environment_Definition(gList[i]).FGameArea.Game_Area_Index));
 end;

end;


end.
