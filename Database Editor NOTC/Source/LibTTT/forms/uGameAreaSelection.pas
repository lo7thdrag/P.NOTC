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
    procedure lbAllGameDblClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);

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
uses uSimDBEditor,uDBAsset_GameEnvironment,ufrmSummaryResourceAllocation,
  uResurceAllocationSelect, ufrmSummaryEnvironment, ufrmAvailableEnvironment,
  uEnvironmentCharacteristicsWindow, ufrmSummaryOverlay, ufrmAvailableGameArea, uExerciseArea,
  uENCSelect;

procedure TfGameAreaSelection.btAddClick(Sender: TObject);
var i: integer;
begin
  if lbAllGame.ItemIndex <> -1 then
  begin
    lbGameSel.Items.Clear;
    idRASelected := lbTempIdAll.Items.Strings[lbAllGame.ItemIndex];

    lbAllGame.Items.Clear;
    lbTempIdAll.Items.Clear;
    for I := 0 to gList.Count - 1 do
    begin
      if TGame_Environment_Definition(gList[i]).FGameArea.Game_Area_Index = StrToInt(idRASelected) then
      begin
        lbGameSel.Items.Add(TGame_Environment_Definition(gList[i]).FGameArea.Game_Area_Identifier);
      end
      else begin
        lbAllGame.Items.Add(TGame_Environment_Definition(gList[i]).FGameArea.Game_Area_Identifier);
        lbTempIdAll.Items.Add(IntToStr(TGame_Environment_Definition(gList[i]).FGameArea.Game_Area_Index));
      end;
    end;
  end;
end;

procedure TfGameAreaSelection.btCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfGameAreaSelection.btCopyClick(Sender: TObject);
begin
  if lbAllGame.ItemIndex <> -1 then
  begin
    ExerciseAreaForm.isCopy := True;
    ENCSelect.isCopy        := True;
    ExerciseAreaForm.idGameArea := StrToInt(lbTempIdAll.Items.Strings[lbAllGame.ItemIndex]);
//    frmAvailableGameArea.getGame;
  end;
end;

procedure TfGameAreaSelection.btEditClick(Sender: TObject);
begin
  if lbAllGame.ItemIndex <> -1 then
  begin
  //  fGameAreaList.flagIsNew := false;
    ExerciseAreaForm.isCopy := False;
    ENCSelect.isCopy        := False;
    ExerciseAreaForm.idGameArea := StrToInt(lbTempIdAll.Items.Strings[lbAllGame.ItemIndex]);
//    frmAvailableGameArea.getGame;
  end;
end;

procedure TfGameAreaSelection.btNewClick(Sender: TObject);
begin
  with ExerciseAreaForm do
  begin
    edtName.Text := '(Noname)';
    edtLatitude.Text := '00° 00.000'''+' N';
    edtLongitude.Text := '000° 00.000'''+' E';
    edtMaximum.Text := '1000';
    ShowModal;
  end;
end;

procedure TfGameAreaSelection.btOKClick(Sender: TObject);
begin
  if fromEnviro then
  begin
    if lbGameSel.Count <> 0 then
    begin
      frmSummaryEnvironment.edtArea.Text := lbGameSel.Items[0];
      frmSummaryEnvironment.btnEditCharacteristics.Enabled := True;
      frmSummaryEnvironment.btnApply.Enabled := True;
      EnvironmentCharacteristicsWindowForm.GameEnviroDef.FData.Game_Area_Index := StrToInt(idRASelected);
      EnvironmentCharacteristicsWindowForm.GameEnviroDef.FGameArea.Game_Area_Index := StrToInt(idRASelected);
      frmSummaryEnvironment.id_game_area := idRASelected;
    end
    else begin
      frmSummaryEnvironment.edtArea.Text := '[None]';
      frmSummaryEnvironment.btnEditCharacteristics.Enabled := False;
      frmSummaryEnvironment.id_game_area := '';
      frmSummaryEnvironment.btnApply.Enabled := False;
    end;
  end
  else if fromOverlay then
  begin
    with frmSummaryOverlay do
    begin
      if lbGameSel.Items.Count > 0 then
      begin
//        GameArea.FData.Game_Area_Index := StrToInt(idRASelected);
//        GameArea.FGameArea.Game_Area_Index := StrToInt(idRASelected);
//        edtArea.Text := lbGameSel.Items[0];
//        UpdateOverlayForm;
      end
      else
      begin
//        GameArea.FData.Game_Area_Index := 0;
//        GameArea.FGameArea.Game_Area_Index := 0;
//        edtArea.Text := 'None';
//        UpdateOverlayForm;
      end;
    end;
  end;
  Close;
end;


procedure TfGameAreaSelection.btRemoveClick(Sender: TObject);
var i :integer;
begin
  if lbGameSel.ItemIndex <> -1 then
  begin
    lbGameSel.Items.Delete(lbGameSel.ItemIndex);
    idRASelected := '';

    lbAllGame.Items.Clear;
    lbTempIdAll.Items.Clear;
    for I := 0 to gList.Count - 1 do
    begin
      lbAllGame.Items.Add(TGame_Environment_Definition(gList[i]).FGameArea.Game_Area_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TGame_Environment_Definition(gList[i]).FGameArea.Game_Area_Index));
    end;
  end;
end;

procedure TfGameAreaSelection.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
if GetKeyState(VK_ESCAPE)< 0 then
  begin
    case Msg.CharCode of
     VK_ESCAPE:
     begin
       btOK.Click;
     end;
    end;
  end;
end;

procedure TfGameAreaSelection.FormShow(Sender: TObject);
begin
  if frmSummaryEnvironment.id_game_area <> '' then
    idRASelected := frmSummaryEnvironment.id_game_area
  else idRASelected := '';

  getGameArea;
end;

procedure TfGameAreaSelection.getGameArea;
var i : integer;
begin
  gList := TList.Create;

  //get all vehicle name
  uSimDBEditor.getGameAreaList(gList);

  lbAllGame.Items.Clear;
  lbTempIdAll.Items.Clear;
  lbGameSel.Items.Clear;

  if idRASelected <> '' then begin
    for I := 0 to gList.Count - 1 do
    begin
      if TGame_Environment_Definition(gList[i]).FGameArea.Game_Area_Index = StrToInt(idRASelected) then
      begin
        lbGameSel.Items.Add(TGame_Environment_Definition(gList[i]).FGameArea.Game_Area_Identifier);
      end
      else begin
        lbAllGame.Items.Add(TGame_Environment_Definition(gList[i]).FGameArea.Game_Area_Identifier);
        lbTempIdAll.Items.Add(IntToStr(TGame_Environment_Definition(gList[i]).FGameArea.Game_Area_Index));
      end;
    end;
  end
  else begin
    for I := 0 to gList.Count - 1 do
    begin
      lbAllGame.Items.Add(TGame_Environment_Definition(gList[i]).FGameArea.Game_Area_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TGame_Environment_Definition(gList[i]).FGameArea.Game_Area_Index));
    end;
  end;

end;


procedure TfGameAreaSelection.lbAllGameDblClick(Sender: TObject);
begin
  btAdd.Click;
end;

end.
