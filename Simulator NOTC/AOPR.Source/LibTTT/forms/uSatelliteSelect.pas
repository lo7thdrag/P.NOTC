unit uSatelliteSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls,uDBAsset_Satellite;

type
  TfSatellite = class(TForm)
    lbAllSatellite: TListBox;
    btnAdd: TButton;
    shp1: TShape;
    btnRemove: TButton;
    btnOk: TButton;
    btnCancel: TButton;
    lbTempIdAll: TListBox;
    lbTempIdSel: TListBox;
    lbSatelliteSel: TListBox;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure getRASatellite;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sat_id  : string;
    sat : TSatellite_Definition;
  end;

var
  fSatellite  : TfSatellite;
  idSelect    : string;
  pList,sList: TList;

implementation

{$R *.dfm}
uses uDataModuleTTT, uSimDBEditor, uResurceAllocationSelect,
  uResourceAllocation, uInputName,uRAList,uDBAssetObject, uDBAsset_Weapon;

procedure TfSatellite.btnAddClick(Sender: TObject);
begin
  sat_id := lbTempIdAll.Items.Strings[lbAllSatellite.ItemIndex];
  ResourceAllocationForm.ra_index  := 6;
  finputName.Show;
end;

procedure TfSatellite.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfSatellite.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfSatellite.btnRemoveClick(Sender: TObject);
var rec:TPlatform_Instance;
i:integer;
begin
  idSelect := lbTempIdSel.Items.Strings[lbSatelliteSel.ItemIndex];

  for I :=0 to lbSatelliteSel.Count - 1 do
  if lbSatelliteSel.Selected[I] then
  begin
    lbSatelliteSel.Items.Delete(I);
    dmTTT.deletePlatformInstance(lbTempIdSel.Items[i]);
  end;
end;

procedure TfSatellite.getRASatellite;
var i   : integer;
    s   : string;
    li  : TListItem;
begin

//get all vehicle name
 uSimDBEditor.getAllSatellite(0,sList,sat);
 if fRAList.RA_id <> '' then
    uSimDBEditor.getRA(5,StrToInt(fRAList.RA_id),ResourceAllocationForm.force,pList);


 lbAllSatellite.Items.Clear;
 lbSatelliteSel.Items.Clear;
 lbTempIdAll.Items.Clear;
 lbTempIdSel.Items.Clear;

  for I := 0 to sList.Count - 1 do
  begin
      lbAllSatellite.Items.Add(TSatellite_Definition(sList[i]).FData.Satellite_Identifier);
      lbTempIdAll.Items.Add(IntToStr(TSatellite_Definition(sList[i]).FData.Satellite_Index));
  end;

  for I := 0 to pList.Count - 1 do begin
    lbSatelliteSel.Items.Add(TSatellite_Definition(pList[i]).FPI.Instance_Name);
    lbTempIdSel.Items.Add(IntToStr(TSatellite_Definition(pList[i]).FPI.Satellite_Index));
  end;

end;

procedure TfSatellite.FormCreate(Sender: TObject);
begin
  pList   := Tlist.Create;
  sList   := TList.Create;
  sat     := TSatellite_Definition.Create;
end;

procedure TfSatellite.FormShow(Sender: TObject);
begin
  getRASatellite;
end;

end.
