unit uFloatingDecoySelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAsset_Countermeasure;

type
  TfFloatingDecoySelect = class(TForm)
    shp1: TShape;
    lbAllMissile: TListBox;
    btnAdd: TButton;
    btnRemove: TButton;
    btnOk: TButton;
    btnCancel: TButton;
    lbTempIdAll: TListBox;
    lbTempIdSel: TListBox;
    lbMissileSel: TListBox;
    btnEdit: TButton;
    btnCopy: TButton;
    btnNew: TButton;
    btnEditMount: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnEditMountClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    floatingDecoy : Tfloating_Decoy_on_Board;
    fList, fsList : TList;
    isNew : Boolean;
    id    : string;
    procedure getFloating;
    procedure setDefault;
    procedure Definition;
  end;

var
  fFloatingDecoySelect: TfFloatingDecoySelect;

implementation

uses
  uDataModuleTTT, uVehicleAttributeWindow, uFloatingDecoyMount, uFloatingDecoy;

{$R *.dfm}

procedure TfFloatingDecoySelect.btnAddClick(Sender: TObject);
begin
  if lbAllMissile.ItemIndex <> -1 then
  begin
    floatingDecoy := fList[lbAllMissile.ItemIndex];
    setDefault;
    dmTTT.insertFloating_Decoy(floatingDecoy);
    getFloating;
  end;
end;

procedure TfFloatingDecoySelect.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfFloatingDecoySelect.btnCopyClick(Sender: TObject);
begin
  fFloatingDecoy.isCopy := True;
  Definition;
  fFloatingDecoy.Show;
end;

procedure TfFloatingDecoySelect.btnEditClick(Sender: TObject);
begin
  fFloatingDecoy.isCopy := False;
  Definition;
  fFloatingDecoy.Show;
end;

procedure TfFloatingDecoySelect.Definition;
var
  I : Integer;
begin
  if id <> '' then
      dmTTT.getFloating_Decoy(StrToInt(id),fList,fFloatingDecoy.floating);

    for I := 0 to fList.Count - 1 do
    begin
      with fFloatingDecoy do begin
        if isCopy then
        begin
          edtClassFloatingDecoy.Text := 'Copy of '+TFloating_Decoy_On_Board(fList[i]).FFloatingDecoy_Def.Floating_Decoy_Identifier;
          isNew := True;
        end
        else
          edtClassFloatingDecoy.Text := TFloating_Decoy_On_Board(fList[i]).FFloatingDecoy_Def.Floating_Decoy_Identifier;
        edtLengthDimensions.Text   := FloatToStr(TFloating_Decoy_On_Board(fList[i]).FFloatingDecoy_Def.Length);
        edtWidththDimensions.Text  := FloatToStr(TFloating_Decoy_On_Board(fList[i]).FFloatingDecoy_Def.Width);
        edtHeigthDimensions.Text   := FloatToStr(TFloating_Decoy_On_Board(fList[i]).FFloatingDecoy_Def.Height);
        edtFrontRadarCross.Text    := FloatToStr(TFloating_Decoy_On_Board(fList[i]).FFloatingDecoy_Def.Front_Radar_Cross);
        edtSideRadarCross.Text     := FloatToStr(TFloating_Decoy_On_Board(fList[i]).FFloatingDecoy_Def.Side_Radar_Cross);
        edtFrontAcousticCross.Text := FloatToStr(TFloating_Decoy_On_Board(fList[i]).FFloatingDecoy_Def.Front_Acoustic_Cross);
        edtSideAcousticCross.Text  := FloatToStr(TFloating_Decoy_On_Board(fList[i]).FFloatingDecoy_Def.Side_Acoustic_Cross);
        edtFrontVisualCross.Text   := FloatToStr(TFloating_Decoy_On_Board(fList[i]).FFloatingDecoy_Def.Front_Visual_Cross);
        edtSideVisualCross.Text    := FloatToStr(TFloating_Decoy_On_Board(fList[i]).FFloatingDecoy_Def.Side_Visual_Cross);
        edtLifetimeDuration.Text   := FloatToStr(TFloating_Decoy_On_Board(fList[i]).FFloatingDecoy_Def.Lifetime_Duration);
      end;
    end;
end;

procedure TfFloatingDecoySelect.btnEditMountClick(Sender: TObject);
begin
  if lbMissileSel.ItemIndex <> -1 then
  begin
    FloatingMountForm.floating := fsList[lbMissileSel.ItemIndex];
    FloatingMountForm.Show;
  end;
end;

procedure TfFloatingDecoySelect.btnNewClick(Sender: TObject);
begin
  isNew := True;
  with fFloatingDecoy do
    begin
      edtClassFloatingDecoy.Text      := '';
      edtLengthDimensions.Text        := '';
      edtWidththDimensions.Text       := '';
      edtHeigthDimensions.Text        := '';
      edtFrontRadarCross.Text         := '';
      edtSideRadarCross.Text          := '';
      edtFrontAcousticCross.Text      := '';
      edtSideAcousticCross.Text       := '';
      edtFrontVisualCross.Text        := '';
      edtSideVisualCross.Text         := '';
      edtLifetimeDuration.Text        := '';
      cbFrontRadarCross.Clear;
      cbSideRadarCross.Clear;
      Show;
    end;
    Close;
end;

procedure TfFloatingDecoySelect.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfFloatingDecoySelect.btnRemoveClick(Sender: TObject);
begin
  if lbMissileSel.ItemIndex <> -1 then
  begin
    floatingDecoy := fsList[lbMissileSel.ItemIndex];
    dmTTT.DeleteFloating_Decoy_On_Board(IntToStr(floatingDecoy.FData.Floating_Decoy_Instance_Index), floatingDecoy);
    getFloating;
  end;
end;

procedure TfFloatingDecoySelect.FormCreate(Sender: TObject);
begin
  fList := TList.Create;
  fsList := TList.Create;
  floatingDecoy := TFloating_Decoy_On_Board.Create;
end;

procedure TfFloatingDecoySelect.FormShow(Sender: TObject);
begin
  getFloating;
end;

procedure TfFloatingDecoySelect.getFloating;
var
  I: Integer;
begin
  dmTTT.getAllFloating_Decoy_Definition(fList);
  dmTTT.getAllFloating_Decoy_On_Board(fVehicleAttributeWindow.vehicle.FData.Vehicle_Index, fsList);

  lbAllMissile.Clear;
  lbTempIdAll.Clear;
  lbTempIdSel.Clear;
  lbMissileSel.Clear;

  for I := 0 to fList.Count - 1 do
  begin
    lbAllMissile.Items.Add(TFloating_Decoy_On_Board(fList[I]).FFloatingDecoy_Def.Floating_Decoy_Identifier);
    lbTempIdAll.Items.Add(IntToStr(TFloating_Decoy_On_Board(fList[I]).FFloatingDecoy_Def.Floating_Decoy_Index));
  end;

  for I := 0 to fsList.Count - 1 do
  begin
    lbMissileSel.Items.Add(TFloating_Decoy_On_Board(fsList[I]).FData.Instance_Identifier);
    lbTempIdSel.Items.Add(IntToStr(TFloating_Decoy_On_Board(fsList[I]).FData.Floating_Decoy_Instance_Index));
  end;

end;

procedure TfFloatingDecoySelect.setDefault;
begin
  with floatingDecoy do
  begin
    FData.Instance_Identifier := FFloatingDecoy_Def.Floating_Decoy_Identifier;
    FData.Instance_Type := FFloatingDecoy_Def.Platform_Category;
    FData.Quantity := 1;
    FData.Vehicle_Index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
    FData.Floating_Decoy_Index := FFloatingDecoy_Def.Floating_Decoy_Index;
  end;
end;

end.
