unit uChaffSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAsset_Countermeasure;

type
  TfChaffSelect = class(TForm)
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
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnEditMountClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cList, csList: TList;
    chaff : TChaff_on_board;
    id    : string;
    isNew : Boolean;
    procedure getData;
    procedure setDefault;
    procedure Definition;
  end;

var
  fChaffSelect: TfChaffSelect;

implementation

uses
  uDataModuleTTT, uVehicleAttributeWindow, uChaffMount, uChaffDecoy;

{$R *.dfm}

procedure TfChaffSelect.btnAddClick(Sender: TObject);
begin
  if lbAllMissile.ItemIndex <> -1 then
  begin
    chaff := cList[lbAllMissile.ItemIndex];
    setDefault;
    dmTTT.insertChaff(chaff);
    getData;
  end;
end;

procedure TfChaffSelect.btnCopyClick(Sender: TObject);
begin
  fChaff.isCopy := True;
  Definition;
  fChaff.Show;
end;

procedure TfChaffSelect.btnEditClick(Sender: TObject);
begin
  fChaff.isCopy := False;
  Definition;
  fChaff.Show;
end;

procedure TfChaffSelect.btnEditMountClick(Sender: TObject);
begin
  if lbMissileSel.ItemIndex <> -1 then
  begin
    ChaffMountForm.chaff := csList[lbMissileSel.ItemIndex];
    ChaffMountForm.Show;
  end;
end;
procedure TfChaffSelect.btnNewClick(Sender: TObject);
begin
  isNew := True;
  with fChaff do
    begin
       edtClassChaff.Text               := '';
       edtDissipationTimein100kt.Text   := '';
       edtDescentRate.Text              := '';
       edtMaxBloom.Text                 := '';
       edtMaxRadarCross.Text            := '';
       edtBloomTime.Text                := '';
       edtDissipationTimeinStillAir.Text:= '';
       edtMaxRadarAttenuation.Text      := '';
       edtLowerLimit.Text               := '';
       edtUpperLimit.Text               := '';
       cbMaxRadar.Clear;
       Show;
    end;
end;

procedure TfChaffSelect.Definition;
Var
  I: Integer;
begin
  if id <> '' then
      dmTTT.getChaff_Def(StrToInt(id),cList,fChaff.chaff);

    for I := 0 to cList.Count - 1 do
    begin
      with fChaff do begin
        if isCopy then
        begin
          edtClassChaff.Text  := 'Copy of '+TChaff_On_Board(cList[i]).FChaff_Def.Chaff_Identifier;
          isNew := True;
        end
        else
          edtClassChaff.Text  := TChaff_On_Board(cList[i]).FChaff_Def.Chaff_Identifier;
        edtDissipationTimein100kt.Text   := IntToStr(TChaff_On_Board(cList[i]).FChaff_Def.Min_Dissipation_Time);
        edtDescentRate.Text              := FloatToStr(TChaff_On_Board(cList[i]).FChaff_Def.Descent_Rate);
        edtMaxBloom.Text                 := FloatToStr(TChaff_On_Board(cList[i]).FChaff_Def.Max_Radius);
        edtMaxRadarCross.Text            := FloatToStr(TChaff_On_Board(cList[i]).FChaff_Def.Max_Radar_Cross);
        edtBloomTime.Text                := FloatToStr(TChaff_On_Board(cList[i]).FChaff_Def.Bloom_Time);
        edtDissipationTimeinStillAir.Text:= FloatToStr(TChaff_On_Board(cList[i]).FChaff_Def.Max_Dissipation_Time);
        edtMaxRadarAttenuation.Text      := FloatToStr(TChaff_On_Board(cList[i]).FChaff_Def.Max_Radar_Attenuation);
        edtLowerLimit.Text               := FloatToStr(TChaff_On_Board(cList[i]).FChaff_Def.Radar_Affect_Lower_Freq);
        edtUpperLimit.Text               := FloatToStr(TChaff_On_Board(cList[i]).FChaff_Def.Radar_Affect_Upper_Freq);
      end;
    end;
end;

procedure TfChaffSelect.btnRemoveClick(Sender: TObject);
begin
  if lbMissileSel.ItemIndex <> -1 then
  begin
    chaff := csList[lbMissileSel.ItemIndex];
    dmTTT.DeleteChaff_On_Board(IntToStr(chaff.FData.Chaff_Instance_Index), chaff);
    getData;
  end;
end;

procedure TfChaffSelect.FormCreate(Sender: TObject);
begin
  cList := TList.Create;
  csList := TList.Create;
  chaff := TChaff_On_Board.Create;
end;

procedure TfChaffSelect.FormShow(Sender: TObject);
begin
  getData;
end;

procedure TfChaffSelect.getData;
Var
  I : Integer;
begin
  dmTTT.getAllChaff_Definition(cList);
  dmTTT.getAllChaff_On_Board(fVehicleAttributeWindow.vehicle.FData.Vehicle_Index, csList);

  lbAllMissile.Clear;
  lbTempIdAll.Clear;
  lbTempIdSel.Clear;
  lbMissileSel.Clear;

  for I := 0 to cList.Count - 1 do
  begin
    lbAllMissile.Items.Add(TChaff_On_Board(cList[I]).FChaff_Def.Chaff_Identifier);
    lbTempIdAll.Items.Add(IntToStr(TChaff_On_Board(cList[I]).FChaff_Def.Chaff_Index));
  end;

  for I := 0 to csList.Count - 1 do
  begin
    lbMissileSel.Items.Add(TChaff_On_Board(csList[I]).FData.Instance_Identifier);
    lbTempIdSel.Items.Add(IntToStr(TChaff_On_Board(csList[I]).FData.Chaff_Instance_Index));
  end;
end;

procedure TfChaffSelect.setDefault;
begin
  with chaff do
  begin
    FData.Instance_Identifier := FChaff_Def.Chaff_Identifier;
    FData.Instance_Type := FChaff_Def.Platform_Category;
    FData.Chaff_Qty_On_Board := 100;
    FData.Vehicle_Index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
    FData.Chaff_Index := FChaff_Def.Chaff_Index;
  end;
end;

end.
