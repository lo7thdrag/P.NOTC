unit uDefensiveJammerSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAsset_Countermeasure;

type
  TfDefensiveJammerSelect = class(TForm)
    shp1: TShape;
    lbAllDefJam: TListBox;
    btnAdd: TButton;
    btnRemove: TButton;
    btnOk: TButton;
    btnCancel: TButton;
    lbTempIdAll: TListBox;
    lbTempIdSel: TListBox;
    lbDefJamSel: TListBox;
    btnEdit: TButton;
    btnCopy: TButton;
    btnNew: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    dList, dsList : Tlist;
    defensiveJammer : TDefensive_Jammer_On_Board;
    id    : string;
    isNew : Boolean;
    procedure getDefensiveJammer;
    procedure setDefault;
    procedure Definition;
  end;

var
  fDefensiveJammerSelect: TfDefensiveJammerSelect;

implementation

uses
  uDataModuleTTT, uVehicleAttributeWindow, uDefensiveJammer;

{$R *.dfm}

procedure TfDefensiveJammerSelect.btnAddClick(Sender: TObject);
begin
  if lbAllDefJam.ItemIndex <> -1 then
  begin
    defensiveJammer := dList[lbAllDefJam.ItemIndex];
    setDefault;
    dmTTT.InsertDefensive_Jammer_On_Board(IntToStr(defensiveJammer.FData.Defensive_Jammer_Instance_Index), defensiveJammer);
    getDefensiveJammer;
  end;
end;

procedure TfDefensiveJammerSelect.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfDefensiveJammerSelect.btnCopyClick(Sender: TObject);
begin
  fDefensiveJammer.isCopy := True;
  Definition;
  fDefensiveJammer.Show;
end;

procedure TfDefensiveJammerSelect.btnNewClick(Sender: TObject);
begin
  isNew := True;
  with fDefensiveJammer do
    begin
      edtClassDefensiveJammer.Text  := '';
      edtTypeA.Text                 := '';
      edtTypeB.Text                 := '';
      edtTypeC.Text                 := '';
      cbxTARHMissiles.Checked       := False;
      cbxFireControlRadar.Checked   := False;
      Show;
    end;
end;

procedure TfDefensiveJammerSelect.Definition;
var
  I : Integer;
begin
  if id <> '' then
      dmTTT.getDefensive_Jammer_Def(StrToInt(id),dList,fDefensiveJammer.defensive_jammer);

    for I := 0 to dList.Count - 1 do
    begin
      with fDefensiveJammer do begin
        if isCopy then
        begin
          edtClassDefensiveJammer.Text := 'Copy of '+ TDefensive_Jammer_On_Board(dList[i]).FDefensiveJammer_Def.Defensive_Jammer_Identifier;
          isNew := True;
        end
        else
          edtClassDefensiveJammer.Text := TDefensive_Jammer_On_Board(dList[i]).FDefensiveJammer_Def.Defensive_Jammer_Identifier;

        TrackBarTypeA.Position       := Round (TDefensive_Jammer_On_Board(dList[i]).FDefensiveJammer_Def.Type_A_Seducing_Prob);
        edtTypeA.Text                := FloatToStr(TDefensive_Jammer_On_Board(dList[i]).FDefensiveJammer_Def.Type_A_Seducing_Prob);
        TrackBarTypeB.Position       := Round (TDefensive_Jammer_On_Board(dList[i]).FDefensiveJammer_Def.Type_B_Seducing_Prob);
        edtTypeB.Text                := FloatToStr(TDefensive_Jammer_On_Board(dList[i]).FDefensiveJammer_Def.Type_B_Seducing_Prob);
        TrackBarTypeC.Position       := Round (TDefensive_Jammer_On_Board(dList[i]).FDefensiveJammer_Def.Type_C_Seducing_Prob);
        edtTypeC.Text                := FloatToStr(TDefensive_Jammer_On_Board(dList[i]).FDefensiveJammer_Def.Type_C_Seducing_Prob);

        if TDefensive_Jammer_On_Board(dList[i]).FDefensiveJammer_Def.ECM_Type = 0 then
          cbECMType.ItemIndex := 0
        else if TDefensive_Jammer_On_Board(dList[i]).FDefensiveJammer_Def.ECM_Type = 1 then
          cbECMType.ItemIndex := 1
        else
          cbECMType.ItemIndex := 2;

        if TDefensive_Jammer_On_Board(dList[i]).FDefensiveJammer_Def.Jammer_TARH_Capable = 1 then
          cbxTARHMissiles.Checked  := True
        else
          cbxTARHMissiles.Checked  := False;

        if TDefensive_Jammer_On_Board(dList[i]).FDefensiveJammer_Def.Jammer_SARH_Capable = 1 then
          cbxFireControlRadar.Checked  := True
        else
          cbxFireControlRadar.Checked  := False;
      end;
    end;
end;

procedure TfDefensiveJammerSelect.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfDefensiveJammerSelect.btnRemoveClick(Sender: TObject);
begin
  if lbDefJamSel.ItemIndex <> -1 then
  begin
    defensiveJammer := dsList[lbDefJamSel.ItemIndex];
    dmTTT.DeleteDefensive_Jammer_On_Board(IntToStr(defensiveJammer.FData.Defensive_Jammer_Instance_Index), defensiveJammer);
    getDefensiveJammer;
  end;
end;

procedure TfDefensiveJammerSelect.FormCreate(Sender: TObject);
begin
  dList := TList.Create;
  dsList := TList.Create;
  defensiveJammer := TDefensive_Jammer_On_Board.Create;
end;

procedure TfDefensiveJammerSelect.FormShow(Sender: TObject);
begin
  getDefensiveJammer;
end;

procedure TfDefensiveJammerSelect.getDefensiveJammer;
var
  I: Integer;
begin
  dmTTT.getAllDefensive_Jammer_Definition(dList);
  dmTTT.getAllDefensive_Jammer_On_Board(fVehicleAttributeWindow.vehicle.FData.Vehicle_Index, dsList);

  lbAllDefJam.Clear;
  lbTempIdAll.Clear;
  lbTempIdSel.Clear;
  lbDefJamSel.Clear;

  for I := 0 to dList.Count - 1 do
  begin
    lbAllDefJam.Items.Add(TDefensive_Jammer_On_Board(dList[I]).FDefensiveJammer_Def.Defensive_Jammer_Identifier);
    lbTempIdAll.Items.Add(IntToStr(TDefensive_Jammer_On_Board(dList[I]).FDefensiveJammer_Def.Defensive_Jammer_Index));
  end;

  for I := 0 to dsList.Count - 1 do
  begin
    lbDefJamSel.Items.Add(TDefensive_Jammer_On_Board(dsList[I]).FData.Instance_Identifier);
    lbTempIdSel.Items.Add(IntToStr(TDefensive_Jammer_On_Board(dsList[I]).FData.Defensive_Jammer_Instance_Index));
  end;
end;

procedure TfDefensiveJammerSelect.setDefault;
begin
  with defensiveJammer do
  begin
    FData.Instance_Identifier := FDefensiveJammer_Def.Defensive_Jammer_Identifier;
    FData.Instance_Type := FDefensiveJammer_Def.ECM_Type;
    FData.Vehicle_Index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
    FData.Defensive_Jammer_Index := FDefensiveJammer_Def.Defensive_Jammer_Index;
  end;
end;

end.
