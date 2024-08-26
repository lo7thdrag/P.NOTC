unit uGroupSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDBAssetObject;

type
  TfGroupSelect = class(TForm)
    lbSingle: TListBox;
    lbId: TListBox;
    btnCopy: TButton;
    btnEdit: TButton;
    btnNew: TButton;
    btnRemove: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure getCubicle;
  private
    { Private declarations }

    procedure getDataCubicle;
  public
    { Public declarations }
    idGroup : string;
  end;

var
  fGroupSelect: TfGroupSelect;
  vList       : TList;
  cubicle     : TCubicle_Group_Assignment;

implementation

{$R *.dfm}
uses uDataModuleTTT, uVehicleSelect, uRAList, ufScenario, uGroupAllocationWindow,
uResurceAllocationSelect;

procedure TfGroupSelect.btnEditClick(Sender: TObject);
begin
  idGroup := lbId.Items.Strings[lbSingle.ItemIndex];
  GroupAllocationWindowForm.isCopy := False;
  getDataCubicle;
end;

procedure TfGroupSelect.getDataCubicle;
begin
  with GroupAllocationWindowForm do begin
    isNew := False;
    Show
  end;
end;

procedure TfGroupSelect.btnNewClick(Sender: TObject);
begin
  with GroupAllocationWindowForm do begin
    isNew := True;
    idGroup := '';
    Show;
  end;
end;

procedure TfGroupSelect.FormCreate(Sender: TObject);
begin
  vList       := TList.Create;
  cubicle     := TCubicle_Group_Assignment.Create;
end;

procedure TfGroupSelect.FormShow(Sender: TObject);
begin
  getCubicle;
end;

procedure TfGroupSelect.getCubicle;
var
  I: Integer;
begin

  lbSingle.Clear;
  lbId.Clear;
  vList.Clear;

  if fResorceAllocationSelect.RA_id <> '' then
    dmTTT.getCubicle_GroupsByResource(StrToInt(fResorceAllocationSelect.RA_id),frmScenario.force,vList)
  else
    dmTTT.getCubicle_GroupsByResource(frmScenario.Scenario.FData.Resource_Alloc_Index,frmScenario.force,vList);

  for I := 0 to vList.Count - 1 do
  begin
    lbSingle.Items.Add(TCubicle_Group_Assignment(vList[i]).FData.Group_Identifier);
    lbId.Items.Add(IntToStr(TCubicle_Group_Assignment(vList[i]).FData.Group_Index));
  end;
end;


end.
