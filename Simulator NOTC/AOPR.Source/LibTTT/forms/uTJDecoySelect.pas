unit uTJDecoySelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAsset_Countermeasure;

type
  TfTJDecoySelect = class(TForm)
    shp1: TShape;
    lbAllTJ: TListBox;
    btnAdd: TButton;
    btnRemove: TButton;
    btnOk: TButton;
    btnCancel: TButton;
    lbTempIdAll: TListBox;
    lbTempIdSel: TListBox;
    lbTJSel: TListBox;
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
    procedure btnEditClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tjList, tjsList : TList;
    towed : TTowed_Jammer_Decoy_On_Board;
    id : String;
    isNew : boolean;
    procedure getTJ;
    procedure setDefault;
    procedure Definition;
  end;

var
  fTJDecoySelect: TfTJDecoySelect;

implementation

uses
  uDataModuleTTT, uVehicleAttributeWindow, uTowedJammerMount,
  uTowedJammerDecoyDef, uFloatingDecoy;

{$R *.dfm}

procedure TfTJDecoySelect.btnAddClick(Sender: TObject);
begin
  if lbAllTJ.ItemIndex <> -1 then
  begin
    towed := tjList[lbAllTJ.ItemIndex];
    setDefault;
    dmTTT.insertTowed_Jammer(towed);
    getTJ;
  end;
end;

procedure TfTJDecoySelect.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfTJDecoySelect.btnCopyClick(Sender: TObject);
begin
  fTowedjammerDecoy.isCopy := True;
  Definition;
  fTowedjammerDecoy.Show;
end;

procedure TfTJDecoySelect.btnEditClick(Sender: TObject);
begin
  fTowedjammerDecoy.isCopy := False;
  Definition;
  fTowedjammerDecoy.Show;
end;

procedure TfTJDecoySelect.definition;
var
  I : Integer;
begin
  if id <> '' then
      dmTTT.getTowed_Jammer_Def(StrToInt(id),tjList,fTowedjammerDecoy.towed_jammer);

    for I := 0 to tjList.Count - 1 do
    begin
      with fTowedjammerDecoy do begin
        if isCopy then
        begin
          edtClassTowedJammer.Text  := 'Copy of ' + TTowed_Jammer_Decoy_On_Board(tjList[i]).FDef.Towed_Decoy_Identifier;
          isNew := True;
        end
        else
          edtClassTowedJammer.Text  := TTowed_Jammer_Decoy_On_Board(tjList[i]).FDef.Towed_Decoy_Identifier;
        edtFrontRadarCross.Text   := FloatToStr(TTowed_Jammer_Decoy_On_Board(tjList[i]).FDef.Front_Radar_Cross);
        edtSideRadarCross.Text    := FloatToStr(TTowed_Jammer_Decoy_On_Board(tjList[i]).FDef.Side_Radar_Cross);
        edtFrontAcousticCross.Text:= FloatToStr(TTowed_Jammer_Decoy_On_Board(tjList[i]).FDef.Front_Acoustic_Cross);
        edtSideAcousticCross.Text := FloatToStr(TTowed_Jammer_Decoy_On_Board(tjList[i]).FDef.Side_Acoustic_Cross);
        edtFrontVisualCross.Text  := FloatToStr(TTowed_Jammer_Decoy_On_Board(tjList[i]).FDef.Front_Visual_Cross);
        edtSideVisualCross.Text   := FloatToStr(TTowed_Jammer_Decoy_On_Board(tjList[i]).FDef.Side_Visual_Cross);
        edtLengthDimensions.Text  := FloatToStr(TTowed_Jammer_Decoy_On_Board(tjList[i]).FDef.Length);
        edtWidththDimensions.Text := FloatToStr(TTowed_Jammer_Decoy_On_Board(tjList[i]).FDef.Width);
        edtHeigthDimensions.Text  := FloatToStr(TTowed_Jammer_Decoy_On_Board(tjList[i]).FDef.Height);
        edtActivationControl.Text := FloatToStr(TTowed_Jammer_Decoy_On_Board(tjList[i]).FDef.Activation_Control_Delay);
        edtTowLength.Text         := FloatToStr(TTowed_Jammer_Decoy_On_Board(tjList[i]).FDef.Tow_Length);
        edtTypeA.Text             := FloatToStr(TTowed_Jammer_Decoy_On_Board(tjList[i]).FDef.Type_A_Seducing_Prob);
        edtTypeB.Text             := FloatToStr(TTowed_Jammer_Decoy_On_Board(tjList[i]).FDef.Type_B_Seducing_Prob);
        edtTypeC.Text             := FloatToStr(TTowed_Jammer_Decoy_On_Board(tjList[i]).FDef.Type_C_Seducing_Prob);
        TrackBarTypeA.Position    := Round(TTowed_Jammer_Decoy_On_Board(tjList[i]).FDef.Type_A_Seducing_Prob);
        TrackBarTypeB.Position    := Round(TTowed_Jammer_Decoy_On_Board(tjList[i]).FDef.Type_B_Seducing_Prob);
        TrackBarTypeC.Position    := Round(TTowed_Jammer_Decoy_On_Board(tjList[i]).FDef.Type_C_Seducing_Prob);


        if TTowed_Jammer_Decoy_On_Board(tjList[i]).FDef.ECM_Type = 0 then
          cbECMType.ItemIndex := 0
        else if TTowed_Jammer_Decoy_On_Board(tjList[i]).FDef.ECM_Type = 1 then
          cbECMType.ItemIndex := 1
        else
          cbECMType.ItemIndex := 2;

        if TTowed_Jammer_Decoy_On_Board(tjList[i]).FDef.Decoy_TARH_Capable = 1 then
          cbxTARHMissiles.Checked := True
        else
          cbxTARHMissiles.Checked := False;

        if TTowed_Jammer_Decoy_On_Board(tjList[i]).FDef.Decoy_SARH_Capable = 1 then
          cbxFireControlRadars.Checked := True
        else
          cbxFireControlRadars.Checked := False;
      end;

    end;
end;

procedure TfTJDecoySelect.btnEditMountClick(Sender: TObject);
begin
  if lbTJSel.ItemIndex <> -1 then
  begin
    towed := tjsList[lbTJSel.ItemIndex];
    towedjammerMountForm.towedJammer := towed;
    TowedJammerMountForm.Show;
  end;
end;

procedure TfTJDecoySelect.btnNewClick(Sender: TObject);
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
end;

procedure TfTJDecoySelect.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfTJDecoySelect.btnRemoveClick(Sender: TObject);
begin
  if lbTJSel.ItemIndex <> -1 then
  begin
    towed := tjsList[lbTJSel.ItemIndex];
    dmTTT.DeleteTowed_Jammer_Decoy_On_Board(IntToStr(towed.FData.Towed_Decoy_Instance_Index), towed);
    lbTempIdSel.ItemIndex := lbTJSel.ItemIndex;
    lbTJSel.DeleteSelected;
    lbTempIdSel.DeleteSelected;
    //getTJ;
  end;
end;

procedure TfTJDecoySelect.FormCreate(Sender: TObject);
begin
  tjList := TList.Create;
  tjsList := TList.Create;
  towed := TTowed_Jammer_Decoy_On_Board.Create;
end;

procedure TfTJDecoySelect.FormShow(Sender: TObject);
begin
  getTJ;
end;

procedure TfTJDecoySelect.getTJ;
var
  I: Integer;
begin
  tjList.Clear;
  dmTTT.getAllTowed_Jammer_Decoy_Definition(tjList);
  dmTTT.getAllTowed_Jammer_Decoy_On_Board_Only(fVehicleAttributeWindow.vehicle.FData.Vehicle_Index, tjsList);

  lbAllTJ.Clear;
  lbTJSel.Clear;
  lbTempIdAll.Clear;
  lbTempIdSel.Clear;

  for I := 0 to tjList.Count - 1 do
  begin
    lbAllTJ.Items.Add(TTowed_Jammer_Decoy_On_Board(tjList[I]).FDef.Towed_Decoy_Identifier);
    lbTempIdAll.Items.Add(IntToStr((TTowed_Jammer_Decoy_On_Board(tjList[I])).FDef.Towed_Decoy_Index));
  end;

  for I := 0 to tjsList.Count - 1 do
  begin
    lbTJSel.Items.Add(TTowed_Jammer_Decoy_On_Board(tjsList[I]).FData.Instance_Identifier);
    lbTempIdSel.Items.Add(IntToStr(TTowed_Jammer_Decoy_On_Board(tjsList[I]).FData.Towed_Decoy_Instance_Index));
  end;
end;

procedure TfTJDecoySelect.setDefault;
begin
  with towed do
  begin
    FData.Instance_Identifier := FDef.Towed_Decoy_Identifier;
    FData.Instance_Type := FDef.Platform_Category;
    FData.Quantity := 2;
    FData.Vehicle_Index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
    FData.Towed_Decoy_Index := FDef.Towed_Decoy_Index;
  end;
end;

end.
